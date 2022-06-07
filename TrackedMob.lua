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
    if buff.spell.overwrites then
        for _, spell_id in ipairs(buff.spell.overwrites) do
            if self.buffs[buff:get_buff_id()] and self.buffs[buff:get_buff_id()]:get_spell_id() == spell_id then
                local overwritten_buff = self.buffs[buff:get_buff_id()]
                overwritten_buff:expire()

                self.buffs[buff:get_buff_id()] = nil
            end
        end
    end

    self.buffs[buff:get_buff_id()] = buff

    self:sort_buffs()
end

function TrackedMob:remove_buff(buff_id)
    if self:has_buffs() then
        if self.buffs:containskey(buff_id) then
            local removed_buff = self.buffs[buff_id]
            removed_buff:expire()

            self.buffs[buff_id] = nil

            return removed_buff
        end
    end
end

function TrackedMob:clear_buffs()
    self.buffs:clear()
end

function TrackedMob:sort_buffs()
    self.buffs:sort(function(buff1, buff2)
        return buff1:get_remaining_duration_in_seconds() < buff2:get_remaining_duration_in_seconds()
    end)
end