TrackedBuff = {}

-- function TrackedBuff.new(buff_id, spell_info, caster_info, equipment, time_applied, calculated_durations, is_saboteur)
--     local self = {}
--     self.buff_id = buff_id
--     self.spell_info = spell_info or {}
--     self.caster_info = caster_info or {}
--     self.equipment = equipment or {}
--     self.time_applied = time_applied or os.time()
--     self.calculated_durations = calculated_durations or {}
--     self.is_saboteur = is_saboteur or false

--     setmetatable(self, {__index = TrackedBuff, __tostring = TrackedBuff.tostring})

--     return self
-- end

function TrackedBuff.new(buff, spell, caster, target, equipment, time_applied)
    local self = {}
    self.buff = buff or {id=-1,en="Unknown"}
    self.spell = spell or {id=-1,en="Unknown"}
    self.caster = caster or {id=-1,name="Unknown",buffs=T{}}
    self.target = target or {id=-1,name="Unknown"}
    self.equipment = equipment or {}
    self.time_applied = time_applied or os.time()

    setmetatable(self, {__index = TrackedBuff})

    return self
end

function TrackedBuff:expire()
    self.time_expired = os.time()
end

function TrackedBuff:is_expired()
    return self.time_expired or false
end

function TrackedBuff:get_buff_id()
    return self.buff.id
end

function TrackedBuff:get_buff_name()
    return self.buff.en
end

function TrackedBuff:get_spell_id()
    return self.spell.id
end

function TrackedBuff:get_spell_name()
    return self.spell.en
end

function TrackedBuff:get_spell_skill()
    return res.skills[self.spell.skill].en or nil
end

function TrackedBuff:get_caster_id()
    return self.caster.id
end

function TrackedBuff:get_caster_name()
    return self.caster.name
end

function TrackedBuff:get_caster_buffs()
    return get_player_buffs(self.caster)
end

function TrackedBuff:is_player_caster()
    local player = windower.ffxi.get_player()

    return player.id == self.caster.id
end

function TrackedBuff:get_target_id()
    return self.target.id
end

function TrackedBuff:get_target_name()
    return self.target.name
end

function TrackedBuff:get_current_duration_in_seconds()
    local current_time = os.time()

    return os.difftime(current_time, self.time_applied)
end

function TrackedBuff:get_current_duration_as_timer()
    local current_duration = self:get_current_duration_in_seconds()

    return convert_seconds_to_timer(current_duration)
end

function TrackedBuff:get_total_duration_in_seconds()
    if not self.time_expired then return nil end

    return os.difftime(self.time_expired, self.time_applied)
end

function TrackedBuff:get_total_duration_as_timer()
    local total_duration = self:get_total_duration_in_seconds()

    if total_duration then
        return convert_seconds_to_timer(total_duration)
    end

    return nil
end

function TrackedBuff:get_calculated_duration_in_seconds(resist_state_value)
    local duration
    
    if self.calculated_duration then
        if type(self.calculated_duration) == "number" then
            duration = self.calculated_duration
        elseif type(self.calculated_duration) == "table" then
            if resist_state_value then
                duration = self.calculated_duration[resist_state_value]
            else
                duration = self.calculated_duration[0]
            end
        end

        return math.floor(duration)
    end
end

function TrackedBuff:get_calculated_duration_as_timer(resist_state_value)
    local timer_to_expire = self:get_calculated_duration_in_seconds(resist_state_value)

    if timer_to_expire then
        return convert_seconds_to_timer(timer_to_expire)
    end
end

function TrackedBuff:get_remaining_duration_in_seconds(resist_state_value)
    local time_to_expire
    local current_time = os.time()

    if self.calculated_duration then
        if type(self.calculated_duration) == "number" then
            time_to_expire = self.time_applied + self.calculated_duration
        elseif type(self.calculated_duration) == "table" then
            if resist_state_value then
                time_to_expire = self.time_applied + self.calculated_duration[resist_state_value]
            else
                time_to_expire = self.time_applied + self.calculated_duration[0]
            end
        end

        return os.difftime(time_to_expire, current_time)
    else
        return nil
    end
end

function TrackedBuff:get_remaining_duration_as_timer(resist_state_value)
    local duration = self:get_remaining_duration_in_seconds(resist_state_value)

    if duration then
        return convert_seconds_to_timer(duration)
    end

    return nil
end

function TrackedBuff:get_time_to_expire(resist_state_value)
    local time_to_expire
    
    if self.calculated_duration then
        if type(self.calculated_duration) == "number" then
            time_to_expire = self.time_applied + self.calculated_duration
        elseif type(self.calculated_duration) == "table" then
            if resist_state_value then
                time_to_expire = self.time_applied + self.calculated_duration[resist_state_value]
            else
                time_to_expire = self.time_applied + self.calculated_duration[0]
            end
        end

        return time_to_expire
    end

    return nil
end

function TrackedBuff:calculate_buff_duration()
    if self:is_player_caster() then    
        local skill = self:get_spell_skill()

        if skill then
            if skill == "Enhancing Magic" then
                local duration, modifiers = calculate_enhancing_duration(self.caster, self.spell, self.target, self.equipment, self:get_caster_buffs())

                if duration then
                    self.calculated_duration = duration
                    self.modifiers = modifiers
                end
            
            elseif skill == "Singing" then
                local duration, modifiers = calculate_enhancing_duration(self.caster, self.spell, self.target, self.equipment, self:get_caster_buffs())

                if duration then
                    self.calculated_duration = duration
                    self.modifiers = modifiers
                end

            elseif skill == "Enfeebling Magic" then
                local duration_map, modifiers = calculate_enfeebling_duration(self.caster, self.spell, self.target, self.equipment, self:get_caster_buffs())

                if duration_map then
                    self.calculated_duration = duration_map
                    self.modifiers = modifiers
                end
            end
        end
    end
end

function TrackedBuff:print_log(verbose)
    local buff_info = "Buff: %s, Spell: %s, Caster: %s, Time Applied: %s"

    if self.time_expired then
        buff_info = buff_info .. ", Time Expired: %s, Total Duration: %s, Max Duration: %s"

        windower.add_to_chat(80, buff_info:format(self:get_buff_name(), self:get_spell_name(), self:get_caster_name(), get_time_stamp(self.time_applied), get_time_stamp(self.time_expired), self:get_total_duration_as_timer(), self:get_calculated_duration_as_timer()))
        
        if verbose then
            windower.add_to_chat(80, table.concat(self.modifiers, ', '))
        end
    else
        buff_info = buff_info .. ", Current Duration: %s, Max Duration: %s, Expected Expire: %s"

        windower.add_to_chat(80, buff_info:format(self:get_buff_name(), self:get_spell_name(), self:get_caster_name(), get_time_stamp(self.time_applied), self:get_current_duration_as_timer(), self:get_calculated_duration_as_timer(), get_time_stamp(self:get_time_to_expire())))

        if verbose then
            windower.add_to_chat(80, table.concat(self.modifiers, ', '))
        end
    end
end

-- function TrackedBuff.tostring(buff)
--     local buff_string

--     if buff.time_expired then
--         buff_string = string.format("Buff ID: %d, Spell: %s, Caster: %s, Duration: %d, Resist State: %s", buff:get_buff_id(), buff:get_spell_name(), buff:get_caster_name(), buff:get_final_duration(), buff:get_resist_state())
--     else
--         buff_string = string.format("Buff ID: %d, Spell: %s, Caster: %s, Current Duration: %s, Maximum Expected Duration: %s, Expected Time Expire: %s", buff:get_buff_id(), buff:get_spell_name(), buff:get_caster_name(), convert_seconds_to_timer(buff:get_current_duration()), convert_seconds_to_timer(buff.calculated_durations[0]), os.date("%X", buff.time_applied + buff.calculated_durations[0]))
--     end

--     return buff_string
-- end

-- function TrackedBuff:get_buff_id()
--     return self.buff_id
-- end

-- function TrackedBuff:get_spell_id()
--     return self.spell_info.id
-- end

-- function TrackedBuff:get_spell_name()
--     return self.spell_info.en
-- end

-- function TrackedBuff:get_caster_id()
--     return self.caster_info.id
-- end

-- function TrackedBuff:get_caster_name()
--     return self.caster_info.name
-- end

-- function TrackedBuff:get_current_duration()
--     local current_time = os.time()

--     return os.difftime(current_time, self.time_applied)
-- end

-- function TrackedBuff:get_current_duration_as_timer()
--     local current_duration = self:get_current_duration()

--     return convert_seconds_to_timer(current_duration)
-- end

-- function TrackedBuff:expire()
--     self.time_expired = os.time()
-- end

-- function TrackedBuff:get_final_duration()
--     if not self.time_expired then return end

--     return os.difftime(self.time_expired, self.time_applied)
-- end

-- function TrackedBuff:get_final_duration_as_timer()
--     if not self.time_expired then return end

--     local final_duration = self:get_final_duration()
--     return convert_seconds_to_timer(final_duration)
-- end

-- function TrackedBuff:get_resist_state()
--     if not self.time_expired then return end

--     --if self:get_caster_id() ~= player.id then return end

--     local duration = self:get_final_duration()
--     local variance = 3
--     local resist_state = -1
    
--     for state, calculated_duration in pairs(self.calculated_durations) do
--         local duration_diff = math.abs(calculated_duration - duration)

--         if duration_diff < variance then
--             resist_state = state
--         end
--     end

--     if resist_state == -1 then
--         return "Unknown: No Match"
--     elseif resist_state == 0 then
--         return "No Resist: Full Duration"
--     else
--         return string.format("1/%d Resist", pow(2, resist_state))
--     end
-- end

-- Helper functions
function get_timestamp(time)
    return os.date("%X", time)
end

-- function convert_seconds_to_timer(duration)
--     local minutes = math.floor(duration / 60)
--     local seconds = duration % 60

--     return string.format("%02d:%02d", minutes, seconds)
-- end