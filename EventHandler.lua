--ActionPacket.open_listener(action_handler)

function action_handler(action)
    local actionpacket = ActionPacket.new(action)
    local category = actionpacket:get_category_string()
    local player = windower.ffxi.get_player()

    if category == 'spell_finish' then
        local actor_id = actionpacket:get_id()
        local spell = actionpacket:get_spell()
        local targets = actionpacket:get_targets()
        local skill_name = res.skills[spell.skill].en
        local time_cast = os.clock()

        if skill_name == "Enhancing Magic" then
            if actor_id == player.id then
                
            else

            end
        elseif skill_name == "Enfeebling Magic" then
            if actor_id == player.id then
                local equipment = windower.ffxi.get_items('equipment')

                for target in pairs(targets) do
                    local action = target:get_actions()()
                    local message_id = action:get_message_id()

                    if immunity_message_ids:contains(message_id) then
                        -- TODO: Update mob immunities
                    elseif no_effect_message_ids:contains(message_id) then
                        -- TODO: possibly notify player debuff not applied
                    elseif resist_message_ids:contains(message_id) then
                        -- TODO: possibly notify player debuff resisted
                        -- TODO: possibly aggregate resist data?
                    else
                        if damage_message_ids:contains(message_id) then
                            -- TODO: Handle Dia, Bio, Etc.
                        else
                            local debuff_durations = calculate_enfeebling_duration(player, spell, target, equipment)

                            if not debuff_durations then return end

                            -- TODO: Update Tracked Mob Table
                            local tracked_buff = TrackedBuff.new({id = target.top_level_param, spell_name = spell.en, time_applied = time_cast, expected_durations = debuff_durations})
                            
                        end
                    end
                end
            else

            end
        end
    end
end

windower.register_event('action message', function(id, data)

end)