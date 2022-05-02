equip_slots = {'main','sub','range','ammo','head','neck','left_ear','right_ear','body','hands','left_ring','right_ring','back','waist','legs','feet'}

function calculate_enhancing_duration(spell, equipment)
    local spell_info, equipment, player, buffs = get_basic_info(spell, equipment)

    local composure_modifier = get_base_enhancing_composure_modifier(spell, player, buffs)
    local composure_count = 0

    local base_duration = spell_info.duration or 0
    local duration_modifier = 1
    local duration_bonus = get_enhancing_duration_bonus(spell, player, buffs)

    local augment_duration_modifier = 1
    local perpetuance_modifier = buffs.Perpetuance and 2 or 1
    local embolden_modifier = buffs.Embolden and (spell.target.id == player.id and -0.5) or 1

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

    if buffs.Composure and spell.target.id ~= player.id then
        composure_modifier = composure_modifier + composure_modifiers[composure_count] or 0
    end

    local enhancing_duration = base_duration + duration_bonus

    for modifier in pairs({duration_modifier, augment_duration_modifier, composure_modifier, perpetuance_modifier, embolden_modifier}) do
        enhancing_duration = math.floor(enhancing_duration * modifier)
    end

    return enhancing_duration
end

function calculate_enfeebling_duration(spell, equipment)
    local spell_info, equipment, player, buffs = get_basic_info(spell, equipment)

    local composure_modifier = 1
    local composure_count = 0

    local saboteur_modifier = get_base_saboteur_modifier(spell, buffs, mob_data.NMs or L{})

    local duration_modifier = 1
    local augment_duration_modifier = 1

    local base_duration = (spell_info.duration or 0)

    local duration_bonus = (player.main_job == "RDM" and player.merits.enfeebling_magic_duration and (player.merits.enfeebling_magic_duration * 6) or 0)
        + (player.job_points[player.main_job].enfeebling_magic_duration or 0)
        + (buffs.stymie and (player.job_points[player.main_job].stymie_effect or 0))

    for _, slot in ipairs(equip_slots) do
        local item = windower.ffxi.get_items(equipment[slot .. '_bag'], equipment[slot]).id
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

        if composure_gear[item.id] then
            composure_count = composure_count + 1
        end
    end

    local duration = math.floor(base_duration * saboteur_modifier) + duration_bonus

    for modifier in pairs({duration_modifier, augment_duration_modifier, composure_modifier}) do
        duration = math.floor(duration * modifier)
    end

    local duration_map = enfeebling_resist_states:map(
        function(resist_multiplier)
            return math.floor(duration * resist_multiplier)
        end
    )

    return duration_map
end

function get_basic_info(spell, equipment)
    local spell_info = windower.res.spells[spell.recast_id]
    local equipment = equipment or windower.ffxi.get_items('equipment')
    local player = windower.ffxi.get_player()
    local buffs = get_player_buffs(player)

    return spell_info, equipment, player, buffs
end

function get_base_saboteur_modifier(spell, buffs, nm_table)
    local saboteur_modifier = 1

    if buffs.Saboteur then
        if nm_table:contains(spell.target.name) then
            saboteur_modifier = 1.25
        else
            saboteur_modifier = 2
        end
    end

    return saboteur_modifier
end

function get_base_enhancing_composure_modifier(spell, player, buffs)
    local composure_modifier = 1

    if buffs.Composure and spell.target.id == player.id and not (spell.english:startswith("Protect") or spell.english:startswith("Shell")) then
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

        duration_bonus = duration_bonus + (player.job_points[player.main_job].enhancing_magic_duration or 0)
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