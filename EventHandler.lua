--ActionPacket.open_listener(action_handler)

function action_handler(action)
    local actionpacket = ActionPacket.new(action)
    local category = actionpacket:get_category_string()
    local player = windower.ffxi.get_player()
    local spell = actionpacket:get_spell()

    if not spell then return end
    if not spell.duration then return end
    local type = spell.type

    if category == 'spell_finish' then
        local actor_id = actionpacket:get_id()
        local skill_name = res.skills[spell.skill].en
        local time_cast = socket.gettime()

        if skill_name == "Enhancing Magic" then
            if actor_id == player.id then
                local equipment = windower.ffxi.get_items('equipment')

                for target in actionpacket:get_targets() do
                    local action = target:get_actions()()
                    local message_id = action:get_message_id()

                    if no_effect_message_ids:contains(message_id) then

                    else
                        local buff = res.buffs[spell.status]
                        local tracked_buff = TrackedBuff.new(buff, spell, player, target, equipment, time_cast)
                        tracked_buff:calculate_buff_duration()

                        if not tracked_mobs[target.id] then
                            tracked_mobs[target.id] = TrackedMob.new(target)
                        end

                        tracked_mobs[target.id]:add_buff(tracked_buff)
                        tracked_buff:print_log(true)
                    end
                end
            else

            end
        elseif skill_name == "Singing" then
                if actor_id == player.id then
                    local equipment = windower.ffxi.get_items('equipment')
    
                    for target in actionpacket:get_targets() do
                        local action = target:get_actions()()
                        local message_id = action:get_message_id()
    
                        if no_effect_message_ids:contains(message_id) then
                            -- do nothing
                        else
                            local buff = res.buffs[action.param]
                            local tracked_buff = TrackedBuff.new(buff, spell, player, target, equipment, time_cast)
                            tracked_buff:calculate_buff_duration()
     
                            if not tracked_mobs[target.id] then
                                tracked_mobs[target.id] = TrackedMob.new(target)
                            end

                            tracked_mobs[target.id]:add_buff(tracked_buff)
                        end
                    end
                end
        elseif skill_name == "Enfeebling Magic" then
            if actor_id == player.id then
                local equipment = windower.ffxi.get_items('equipment')

                for target in actionpacket:get_targets() do
                    
                    local action = target:get_actions()()
                    local message_id = action:get_message_id()

                    if immunity_message_ids:contains(message_id) then
                        local target_name = target:get_name()
                        if mob_data.immunities:contains(target_name) then
                            if not (mob_data.immunities[target_name]:contains(action.top_level_param)) then
                                mob_data.immunities[target_name]:append(action.top_level_param)
                            end
                        else
                            mob_data.immunities:append({[target_name] = L{action.top_level_param}})
                        end

                        -- TODO: Update mob_data file
                    elseif no_effect_message_ids:contains(message_id) then
                        -- TODO: possibly notify player debuff not applied
                    elseif resist_message_ids:contains(message_id) then
                        -- TODO: possibly notify player debuff resisted
                        -- TODO: possibly aggregate resist data?
                    else
                        if damage_message_ids:contains(message_id) then
                            -- TODO: Handle Dia, Bio, Etc.
                            local buff = res.buffs[spell.status]
                            local tracked_buff = TrackedBuff.new(buff, spell, player, target, equipment, time_cast)
                            tracked_buff:calculate_buff_duration()

                            if not tracked_mobs[target.id] then
                                tracked_mobs[target.id] = TrackedMob.new(target)
                            end

                            if tracked_mobs[target.id]:has_buffs() and tracked_buff.spell.overwrites then
                                -- TODO: Loop to identify buffs
                                for _, spell_id in ipairs(tracked_buff.spell.overwrites) do
                                    local status_to_overwrite = (res.spells[spell_id]).status
                                    local removed_buff
                                    
                                    for buff_id, current_buff in pairs(tracked_mobs[target.id].buffs) do
                                        if buff_id == status_to_overwrite and spell_id == current_buff:get_spell_id() then
                                            removed_buff = tracked_mobs[target.id]:remove_buff(buff_id)
                                            tracked_mobs[target.id]:add_buff(tracked_buff)
                                        end
                                    end

                                    if removed_buff then
                                        return removed_buff
                                    else
                                        tracked_mobs[target.id]:add_buff(tracked_buff)
                                    end
                                end
                            else
                                tracked_mobs[target.id]:add_buff(tracked_buff)
                            end
                        else
                            local buff = res.buffs[spell.status]
                            local tracked_buff = TrackedBuff.new(buff, spell, player, target, equipment, time_cast)
                            tracked_buff:calculate_buff_duration()

                            if not tracked_mobs[target.id] then
                                tracked_mobs[target.id] = TrackedMob.new(target)
                            end

                            tracked_mobs[target.id]:add_buff(tracked_buff)

                            --tracked_buff:print_log(true)
                            --flog(logfilename, table.tovstring(tracked_buff))
                            --flog(logfilename, table.tovstring(get_equipment_info(tracked_buff.equipment)))

                        end
                    end
                end
            else

            end
        end
    elseif type == 'JobAbility' or type == 'CorsairRoll' or type == 'Jig' or type == 'Samba' or type == 'Step' then
        windower.add_to_chat(123, "What??!!")
        local actor_id = actionpacket:get_id()
        if actor_id == player.id then
            local equipment = windower.ffxi.get_items('equipment')
            local time_cast = socket.gettime()
            local buff = res.buffs[spell.status]

            for target in actionpacket:get_targets() do
                local action = target:get_actions()()
                local message_id = action:get_message_id()

                if no_effect_message_ids:contains(message_id) then
                    -- Do nothing
                else
                    local tracked_buff = TrackedBuff.new(buff, spell, player, target, equipment, time_cast)
                    
                    if type == 'Step' and tracked_mobs[target.id] then
                        tracked_buff:calculate_step_duration(tracked_mobs[target.id])
                    else
                        tracked_buff:calculate_buff_duration()
                    end

                    if not tracked_mobs[target.id] then
                        tracked_mobs[target.id] = TrackedMob.new(target)
                    end
                    tracked_mobs[target.id]:add_buff(tracked_buff)
                end
            end
        end
    elseif category == "job_ability" then
        local actor_id = actionpacket:get_id()

        if actor_id == player.id then
            local equipment = windower.ffxi.get_items("equipment")
            local time_cast = socket.gettime()
            local buff = res.buffs[spell.status]

            for target in actionpacket:get_targets() do
                local action = target:get_actions()()
                local message_id = action:get_message_id()

                if spell.type == "Rune" then
                    local tracked_buff = TrackedBuff.new(buff, spell, player, target, equipment, time_cast)
                    tracked_buff.calculated_duration = 300
                    tracked_buff:print_log()

                    if not tracked_mobs[target.id] then
                        tracked_mobs[target.id] = TrackedMob.new(target)
                    end

                    tracked_mobs[target.id]:add_rune_buff(tracked_buff)
                end
            end
        end
    elseif category == "job_ability_run" then
        
    end
end

windower.register_event('incoming chunk', function(id, data)
    if id == 0x029 then
        local action_message = {}
        action_message.id = data:unpack('H', 0x19) % 32768
        action_message.target_id = data:unpack('I', 0x09)
        action_message.param = data:unpack('I', 0x0D)

        if mob_death_message_ids:contains(action_message.id) then
            -- TODO: Process tracked mob disposal
        elseif wears_off_message_ids:contains(action_message.id) then
            -- TODO: Process expired debuff
            
            if tracked_mobs[action_message.target_id] then
                tracked_mobs[action_message.target_id]:remove_buff(action_message.param)
            end

        end
    end
end)

windower.register_event('target change', function(id)
    local target = windower.ffxi.get_mob_by_index(id)

    if target then
        maintargetbox:clear()

        local display_info = target.name .. "\n" .. "---------------\n"

        if tracked_mobs[target.id] then
            local mob = tracked_mobs[target.id]
            if mob:has_buffs() then
                for _, buff in pairs(mob.buffs) do
                    display_info = display_info .. ("\n%-12s : %10s"):format(buff:get_spell_name(), buff:get_remaining_duration_as_timer())
                end
            end
        end

        maintargetbox:text(display_info)
        maintargetbox:show()
    else
        maintargetbox:hide()
    end
end)

windower.register_event('prerender', function(id)
    local target = windower.ffxi.get_mob_by_target("t")

    if target then
        maintargetbox:clear()
        local display_info = target.name .. "\n" .. "---------------\n"

        if tracked_mobs[target.id] then
            local mob = tracked_mobs[target.id]
            if mob:has_buffs() then
                for _, buff in pairs(mob.buffs) do
                    display_info = display_info .. ("\n%-12s : %10s"):format(buff:get_spell_name(), buff:get_remaining_duration_as_timer())
                end
            end
        end

        maintargetbox:text(display_info)
        maintargetbox:show()
    else
        maintargetbox:hide()
    end
end)