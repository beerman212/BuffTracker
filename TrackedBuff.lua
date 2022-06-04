TrackedBuff = {}

function TrackedBuff.new(buff_id, spell_info, caster_info, equipment, time_applied, calculated_durations, is_saboteur)
    local self = {}
    self.buff_id = buff_id
    self.spell_info = spell_info or {}
    self.caster_info = caster_info or {}
    self.equipment = equipment or {}
    self.time_applied = time_applied or os.time()
    self.calculated_durations = calculated_durations or {}
    self.is_saboteur = is_saboteur or false

    setmetatable(self, {__index = TrackedBuff, __tostring = TrackedBuff.tostring})

    return self
end

function TrackedBuff.tostring(buff)
    local buff_string

    if buff.time_expired then
        buff_string = string.format("Buff ID: %d, Spell: %s, Caster: %s, Duration: %d, Resist State: %s", buff:get_buff_id(), buff:get_spell_name(), buff:get_caster_name(), buff:get_final_duration(), buff:get_resist_state())
    else
        buff_string = string.format("Buff ID: %d, Spell: %s, Caster: %s, Current Duration: %s, Maximum Expected Duration: %s, Expected Time Expire: %s", buff:get_buff_id(), buff:get_spell_name(), buff:get_caster_name(), convert_seconds_to_timer(buff:get_current_duration()), convert_seconds_to_timer(buff.calculated_durations[0]), os.date("%X", buff.time_applied + buff.calculated_durations[0]))
    end

    return buff_string
end

function TrackedBuff:get_buff_id()
    return self.buff_id
end

function TrackedBuff:get_spell_id()
    return self.spell_info.id
end

function TrackedBuff:get_spell_name()
    return self.spell_info.en
end

function TrackedBuff:get_caster_id()
    return self.caster_info.id
end

function TrackedBuff:get_caster_name()
    return self.caster_info.name
end

function TrackedBuff:get_current_duration()
    local current_time = os.time()

    return os.difftime(current_time, self.time_applied)
end

function TrackedBuff:get_current_duration_as_timer()
    local current_duration = self:get_current_duration()

    return convert_seconds_to_timer(current_duration)
end

function TrackedBuff:expire()
    self.time_expired = os.time()
end

function TrackedBuff:get_final_duration()
    if not self.time_expired then return end

    return os.difftime(self.time_expired, self.time_applied)
end

function TrackedBuff:get_final_duration_as_timer()
    if not self.time_expired then return end

    local final_duration = self:get_final_duration()
    return convert_seconds_to_timer(final_duration)
end

function TrackedBuff:get_resist_state()
    if not self.time_expired then return end

    --if self:get_caster_id() ~= player.id then return end

    local duration = self:get_final_duration()
    local variance = 3
    local resist_state = -1
    
    for state, calculated_duration in pairs(self.calculated_durations) do
        local duration_diff = math.abs(calculated_duration - duration)

        if duration_diff < variance then
            resist_state = state
        end
    end

    if resist_state == -1 then
        return "Unknown: No Match"
    elseif resist_state == 0 then
        return "No Resist: Full Duration"
    else
        return string.format("1/%d Resist", pow(2, resist_state))
    end
end

-- Helper functions
function get_timestamp(time)
    return os.date("%X", time)
end

function convert_seconds_to_timer(duration)
    local minutes = math.floor(duration / 60)
    local seconds = duration % 60

    return string.format("%02d:%02d", minutes, seconds)
end