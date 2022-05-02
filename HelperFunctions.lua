equip_slots = {'main','sub','range','ammo','head','neck','left_ear','right_ear','body','hands','left_ring','right_ring','back','waist','legs','feet'}

function calculate_enhancing_duration(spell, equipment)

end

function calculate_enfeebling_duration(spell, equipment)
    local spell_info, equipment, player, buffs = get_basic_info(spell, equipment)

    local composure_modifier = 1
    local composure_count = 0

    local saboteur_modifier = 1

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

    local duration = math.floor(math.floor(math.floor((math.floor(base_duration * saboteur_modifier) + duration_bonus) * duration_modifier) * augment_duration_modifier) * composure_modifier)
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