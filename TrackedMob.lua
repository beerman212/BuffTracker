TrackedMob = {}

function TrackedMob.new(target)
    local self = {}
    self.target = target or {}
    self.buffs = T{}

    setmetatable(self, {__index = TrackedMob})
    return self
end

function TrackedMob:death()
    self = nil
end

function TrackedMob:get_mob_id()
    return target.id or -1
end

function TrackedMob:get_mob_name()
    return target.name or "Unknown"
end

function TrackedMob:has_buffs()
    return not self.buffs:empty()
end

function TrackedMob:add_buff(buff)
    if self:has_buffs() then
        if self.buffs:containskey(buff.buff_id) then
            local current_buff = self.buffs[buff.buff_id]

            if buff.spell_info.overrides and buff.spell_info.overrides:contains(current_buff:get_spell_id()) then
                self.buffs[buff.buff_id] = buff
            end
        else
            self.buff[buff.buff_id] = buff
        end
    else
        self.buffs[buff.buff_id] = buff
    end
end

function TrackedMob:remove_buff(buff)
    if self:has_buffs() then
        if self.buffs:containskey(buff.buff_id) then
            self.buffs[buff.buff_id] = nil
        end
    end
end

function TrackedMob:clear_buffs()
    self.buffs:clear()
end