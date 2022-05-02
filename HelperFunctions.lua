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

    for _, slot in ipairs(slots) do
        local item = windower.ffxi.get_items(equipment[slot .. '_bag'], gear_info[slot])
    end
end

function get_basic_info(spell, equipment)
    local spell_info = windower.res.spells[spell.recast_id]
    local equipment = equipment or windower.ffxi.get_items('equipment')
    local player = windower.ffxi.get_player()
    local buffs = player.buffs

    return spell_info, equipment, player, buffs
end