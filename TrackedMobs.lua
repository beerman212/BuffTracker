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