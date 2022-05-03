-- TrackedMobs Implementation
TrackedMobs = {}

function TrackedMobs.new()
    local self = {}
    setmetatable(self, {__index = TrackedMobs})
    return self
end

function TrackedMobs:add_mob(mob)
    mob = mob or TrackedMob.new()
    self[mob.id] = mob
end

function TrackedMobs:remove_mob(id)
    self[mob.id] = nil
end

function TrackedMobs:exists(id)
    return self[mob.id] and true or false
end

-- TrackedMob Implementation
TrackedMob = {}

function TrackedMob.new(mob)
    local self = mob or {id = -1}
    setmetatable(self, {__index = TrackedMob})
    return self
end

function TrackedMob.add_buff(buff)
    if not self.buffs then
        self.buffs = TrackedBuffs.new()
    end

    buff = buff or TrackedBuff.new()

    self.buffs[buff.id] = buff
end

function TrackedMob.remove_buff(id)
    if self.buffs then
        self.buffs[id] = nil
    end
end

function TrackedMob.clear_buffs()
    self.buffs:clear_buffs()
end

-- TrackedBuffs Implementation
TrackedBuffs = {}

function TrackedBuffs.new()
    local self = {}
    setmetatable(self, {__index = TrackedBuffs})
    return self
end

function TrackedBuffs:add_buff(buff)
    buff = buff or TrackedBuff.new()

    self[buff.id] = buff
end

function TrackedBuffs:remove_buff(buffID)
    self[buffID] = nil
end

function TrackedBuffs:clear_buffs()
    self:clear()
end

function TrackedBuffs:count()
    local count = 0
    for _, buff in pairs(self) do
        count = count + 1
    end
    return count
end

-- TrackedBuff Implementation
TrackedBuff = {}
TrackedBuff.example = {id=2, spellName = "Sleep II", timeApplied=0.0, expected_durations={[0]=80,[1]=40,[2]=20,[3]=10}}

function TrackedBuff.new(buff_id, spell, time_applied, expected_durations)
    local self = {}
    self.id = buff_id or -1
    self.spell = spell or {}
    self.time_applied = time_applied or os.clock()
    self.expected_durations = expected_durations or {[0] = 0, [1] = 0, [2] = 0, [3] = 0}
    
    setmetatable(self, {__index = TrackedBuff})

    self:calculate_expected_expiration()

    return self
end

function TrackedBuff:get_spell_name()
    return self.spell.en or "Unknown"
end

function TrackedBuff:get_current_duration()
    return math.floor(os.clock() - self.timeApplied)
end

function TrackedBuff:calculate_expected_expiration()
    self.expected_expirations = self.expected_durations:map(
        function(expected_duration)
            return timeApplied + expected_duration
        end
    )
end

function TrackedBuff:get_time_to_expire(resist_state_value)
    if not self.expected_expirations then
        self:calculate_expected_expiration()
    end

    if resist_state_value then
        return self.expected_expirations[resist_state_value] - os.clock()
    else
        local current_time = os.clock()
        return self.expected_expirations:map(function(expiration) return expiration - current_time end)
    end
end

function TrackedBuff:get_spell_name()
    return self.spell.en or "Unknown"
end

function TrackedBuff:overwrite(spell, time_applied, expected_durations)
    self.spell = spell or {en = "Unknown"}
    self.time_applied = time_applied or os.clock()
    self.expected_durations = expected_durations or {[0] = 0, [1] = 0, [2] = 0, [3] = 0}
    self:calculate_expected_expiration()
end