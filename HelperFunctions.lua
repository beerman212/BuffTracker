equip_slots = {'main','sub','range','ammo','head','neck','left_ear','right_ear','body','hands','left_ring','right_ring','back','waist','legs','feet'}

function calculate_enhancing_duration(player, spell, target, equipment, buffs)
    --local spell_info, equipment, player, buffs = get_basic_info(spell, equipment)
    if not (player or spell or target or equipment or buffs) then return end

    local composure_modifier = get_base_enhancing_composure_modifier(player, spell, target, buffs)
    local composure_count = 0

    local base_duration = spell.duration or 0
    local duration_modifier = 1
    local duration_bonus = get_enhancing_duration_bonus(spell, player, buffs)

    local augment_duration_modifier = 1
    local perpetuance_modifier = buffs.Perpetuance and 2 or 1
    local embolden_modifier = buffs.Embolden and (target.id == player.id and -0.5) or 1

    for _, slot in ipairs(equip_slots) do
        local item = windower.ffxi.get_items(equipment[slot .. '_bag'], equipment[slot])
        local modifiers = enhancing_modifiers[item.id]

        if modifiers then
            for index, value in pairs(modifiers) do
                if index == 1 then
                    duration_modifier = duration_modifier + value
                elseif index == 'augment' then
                    augment_duration_modifier = augment_duration_modifier + value
                elseif index == 'perpetuance' and buffs.Perpetuance then
                    perpetuance_modifier = perpetuance_modifier + value
                elseif index == 'embolden' and buffs.Embolden then
                    embolden_modifier = embolden_modifier + value
                elseif spell.english:startswith(index) then
                    duration_bonus = duration_bonus + value
                end
            end
        end

        if enhancing_relic_bonus[item.id] then
            duration_bonus = duration_bonus + (player.merits.enhancing_magic_duration and (player.merits.enhancing_magic_duration * 3) or 0)
        end

        if composure_gear[item.id] then
            composure_count = composure_count + 1
        end
    end

    if buffs.Composure and target.id ~= player.id then
        composure_modifier = composure_modifier + composure_modifiers[composure_count] or 0
    end

    local enhancing_duration = base_duration + duration_bonus

    for _, modifier in ipairs({duration_modifier, augment_duration_modifier, composure_modifier, perpetuance_modifier, embolden_modifier}) do
        enhancing_duration = enhancing_duration * modifier
    end

    if (not (spell.english:startswith("Protect") or spell.english:startswith("Shell") or spell.english == "Aquaveil")) and enhancing_duration > 60 * 30 then
        enhancing_duration = 60 * 30
    end

    return enhancing_duration
end

function calculate_enfeebling_duration(player, spell, target, equipment, buffs)
    if not (player or spell or target or equipment or buffs) then return end
    local current_time = os.time()
    
    local composure_modifier = 1
    local composure_count = 0

    local saboteur_modifier = get_base_saboteur_modifier(spell, target, buffs, mob_data.NMs or L{})

    local duration_modifier = 1
    local augment_duration_modifier = 1

    local base_duration = (spell.duration or 0)

    local duration_bonus = (player.main_job == "RDM" and player.merits.enfeebling_magic_duration and (player.merits.enfeebling_magic_duration * 6) or 0)
    duration_bonus = duration_bonus + (player.job_points[player.main_job:lower()].enfeebling_magic_duration or 0)

    if buffs.Stymie then
        duration_bonus = duration_bonus + (player.job_points[player.main_job:lower()].stymie_effect or 0)
    end


    for _, slot in ipairs(equip_slots) do
        local item = windower.ffxi.get_items(equipment[slot .. '_bag'], equipment[slot])
        local modifiers = enfeebling_modifiers[item.id]

        if modifiers then
            for index, value in pairs(modifiers) do
                if index == 1 then
                    duration_modifier = duration_modifier + value
                elseif index == 'augment' then
                    augment_duration_modifier = augment_duration_modifier + value
                elseif index == 'saboteur' and buffs.saboteur then
                    saboteur_modifier = saboteur_modifier + value
                end
            end
        end

        if enfeebling_relic_bonus[item.id] then
            duration_bonus = duration_bonus + (player.merits.enfeebling_magic_duration and (player.merits.enfeebling_magic_duration * 6) or 0)
        end

        if composure_gear:contains(item.id) then
            composure_count = composure_count + 1
        end
    end
    
    composure_modifier = composure_modifier + (composure_modifiers[composure_count] or 0)
    local duration = (base_duration * saboteur_modifier) + duration_bonus

    for _, modifier in ipairs({duration_modifier, augment_duration_modifier, composure_modifier}) do
        duration = duration * modifier
    end

    duration = math.floor(duration)

    local duration_map = table.map(enfeebling_resist_states,
        function(resist_multiplier)
            return math.floor(duration * resist_multiplier)
        end
    )

    -- this doesn't go here, probably need to make it's own functions:
    -- local cast_data = {
    --     caster = player,
    --     equipment = equipment,
    --     spell = spell,
    --     target = target,
    --     buffs = buffs,
    --     time_applied = current_time,
    --     base_duration = base_duration,
    --     saboteur_modifier = saboteur_modifier,
    --     duration_bonus = duration_bonus,
    --     duration_modifier = duration_modifier,
    --     augment_duration_modifier = augment_duration_modifier,
    --     composure_modifier = composure_modifier,
    --     duration_map = duration_map
    -- }

    -- local cast_info = string.format("Spell: %s, Base Duration: %d, Sabo Mod: %.2d, Duration Bonus: %d", spell.en, base_duration, saboteur_modifier, duration_bonus)
    -- cast_info = cast_info .. "\n"
    -- cast_info = cast_info .. string.format("Duration Mod: %.2d, Augment Mod: %.2d, Composure Mod: %.2d", duration_modifier, augment_duration_modifier, composure_modifier)
    -- cast_info = cast_info .. "\nExpected Durations: "
    -- for state, duration in pairs(duration_map) do
    --     cast_info = cast_info .. string.format("\n\tResist: %s, Duration: %4d, Expires At: %s",state == 0 and " No Resist" or string.format("1/%d Resist", pow(2, state)), duration, os.date("%X", current_time + duration))
    -- end
    -- cast_info = cast_info .. string.format("\nMax Duration Expires At: %s", get_time_stamp(current_time + duration_map[0]))

    -- windower.add_to_chat(123, cast_info)

    return duration_map
end

function get_basic_info(spell, equipment)
    local spell_info = windower.res.spells[spell.recast_id]
    local equipment = equipment or windower.ffxi.get_items('equipment')
    local player = windower.ffxi.get_player()
    local buffs = get_player_buffs(player)

    return spell_info, equipment, player, buffs
end

function get_base_saboteur_modifier(spell, target, buffs, nm_table)
    local saboteur_modifier = 1

    if buffs.Saboteur then
        if nm_table:contains(target:get_name()) then
            saboteur_modifier = 1.25
        else
            saboteur_modifier = 2
        end
    end

    return saboteur_modifier
end

function get_base_enhancing_composure_modifier(player, spell, target, buffs)
    local composure_modifier = 1

    if buffs.Composure and target.id == player.id and not (spell.english:startswith("Protect") or spell.english:startswith("Shell") or spell.english == "Aquaveil") then
        composure_modifier = 3
    end

    return composure_modifier
end

function get_enhancing_duration_bonus(spell, player, buffs)
    local duration_bonus = 0

    if player.main_job == "RDM" then
        if player.merits.enhancing_magic_duration then
            duration_bonus = duration_bonus + (player.merits.enhancing_magic_duration * 6)
        end

        duration_bonus = duration_bonus + (player.job_points[player.main_job:lower()].enhancing_magic_duration or 0)
    elseif player.main_job == "SCH" then
        if spell.english:startswith("Regen") and (buffs["Light Arts"] or buffs["Addendum: White"]) then
            local regen_bonus = math.floor((player.main_job_level - 1) / 4) * 2

            if buffs["Tabula Rasa"] then
                regen_bonus = regen_bonus * 2
            end

            duration_bonus = duration_bonus + regen_bonus

            if player.job_points[player.main_job].light_arts_effect then
                duration_bonus = duration_bonus + (player.job_points[player.main_job].light_arts_effect * 3)
            end
        end
    else

    end

    return duration_bonus
end

function update_gear_map()
    -- TODO: Look at inventory and update augmented gear maps
end

function get_player_buffs(player)
    player = player or windower.ffxi.get_player()
    if not player or not player.buffs then return {} end
    local buffs = T{}
    for _, buff_id in pairs(player.buffs) do
        buffs[buff_id] = (buffs[buff_id] or 0) + 1
        local buff_info = res.buffs[buff_id]
        if buff_info then
            local name = buff_info.english:lower()
            buffs[name] = (buffs[name] or 0) + 1
        end
    end
    setmetatable(buffs, {
        __index = function(t, key)
            if key and type(key) == 'string' then
                key = key:lower()
            end
            return rawget(t, key)
        end
    })
    return buffs
end

function convert_seconds_to_timer(duration)
    local hours, minutes, seconds

    hours = math.floor(duration / 3600)
    minutes = math.floor(duration % 3600 / 60)
    seconds = math.floor(duration % 60)

    return string.format("%02d:%02d:%02d", hours, minutes, seconds)

end

function get_time_utc(time)
    if not time then
        return os.date("'!%Y-%m-%dT%H:%M:%SZ'")
    else
        return os.date("'!%Y-%m-%dT%H:%M:%SZ'", time)
    end
end

function get_time_stamp(time)
    if not time then
        return os.date("%X")
    else
        return os.date("%X", time)
    end
end