--ActionPacket.open_listener(action_handler)

function action_handler(action)
    local actionpacket = ActionPacket.new(action)
    local category = actionpacket:get_category_string()
    local player = windower.ffxi.get_player()
    local buffs = get_player_buffs(player)

    if category == 'spell_finish' then
        local actor_id = actionpacket:get_id()
        local spell = actionpacket:get_spell()

        local skill_name = res.skills[spell.skill].en
        local time_cast = os.time()

        if skill_name == "Enhancing Magic" then
            if actor_id == player.id then
                local equipment = windower.ffxi.get_items('equipment')

                for target in actionpacket:get_targets() do
                    local action = target:get_actions()()
                    local message_id = action:get_message_id()

                    if no_effect_message_ids:contains(message_id) then

                    else
                        local buff = res.buffs[action.param]
                        local tracked_buff = TrackedBuff.new(buff, spell, player, target, equipment, time_cast)
                        tracked_buff:calculate_buff_duration()

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
    
                        else
                            local buff = res.buffs[action.param]
                            local tracked_buff = TrackedBuff.new(buff, spell, player, target, equipment, time_cast)
                            tracked_buff:calculate_buff_duration()
    
                            tracked_buff:print_log(true)
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
                        else
                            local buff = res.buffs[action.param]
                            local tracked_buff = TrackedBuff.new(buff, spell, player, target, equipment, time_cast)
                            tracked_buff:calculate_buff_duration()

                            tracked_buff:print_log(true)
                        end
                    end
                end
            else

            end
        end
    end
end

windower.register_event('action message', function(id, data)
    if id == 0x029 then
        local action_message = {}
        action_message.id = data:unpack('H', 0x19) % 32768
        action_message.target_id = data:unpack('I', 0x09)
        action_message.param = data:unpack('I', 0x0D)

        if mob_death_message_ids:contains(action_message.id) then
            -- TODO: Process tracked mob disposal
        elseif wears_off_message_ids:contains(action_message.id) then
            -- TODO: Process expired debuff
        end
    end
end)