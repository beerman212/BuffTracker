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

function TrackedMob:has_buff(new_buff, match_spell)
    local found_index, found_buff

    --table.vprint(self.buffs)
    if not self:has_buffs() then return end
    
    if match_spell then
        found_index, found_buff = self.buffs:find(function(buff) return buff == new_buff and buff:get_spell_id() == new_buff:get_spell_id() end)
    else
        found_index, found_buff = self.buffs:find(function(buff) return buff == new_buff end)
    end

    if found_buff then
        return found_index, found_buff
    end
end

function TrackedMob:add_buff(new_buff)
    local current_index, current_buff = self:has_buff(new_buff, true)
    
    if current_buff then
        self.buffs[current_index] = new_buff
        return
    end

    if not (self:has_buffs() and new_buff.spell.overwrites) then
        self.buffs:append(new_buff)
        return
    end

    for _, spell_id in ipairs(new_buff.spell.overwrites) do
        local found_index, found_buff = self.buffs:find(function(buff) return buff:get_spell_id() == spell_id end)

        if found_buff then
            self.buffs:remove(found_index)
        end
    end

    self.buffs:append(new_buff)

    --table.vprint(self.buffs)
end

function TrackedMob:add_bard_buff(new_buff)
    local current_index, current_buff = self.buffs:find(function(buff) return buff:get_buff_id() == new_buff:get_buff_id() and buff:get_spell_id() == new_buff:get_spell_id() end)

    if current_buff then
        self.buffs[current_index] = new_buff
        return
    end

    if not (self:has_buffs()) then
        self.buffs:append(new_buff)
        return
    end

    local caster_songs = T(self.buffs:filter(function(buff) return buff:get_spell_type() == "BardSong" and buff:get_caster_id() == new_buff:get_caster_id() end))

    if caster_songs:count() >= 5 then
        local first_song = caster_songs:sort(function(buff1, buff2) return buff1:get_remaining_duration_in_seconds() < buff2:get_remaining_duration_in_seconds() end):first()

        self:remove_buff(first_song:get_buff_id(), first_song:get_spell_id())
        self.buffs:append(new_buff)
    end
end

function TrackedMob:add_rune_buff(new_buff)
    local rune_buff_ids = S{523, 524, 525, 526, 527, 528, 529, 530}
    local current_runes = T(self.buffs:filter(function(buff) return rune_buff_ids:contains(buff:get_buff_id()) end))

    if current_runes:length() >= 3 then
        local first_rune = current_runes:sort(function(buff1, buff2) return buff1:get_remaining_duration_in_seconds() < buff2:get_remaining_duration_in_seconds() end):first()

        self:remove_buff(first_rune:get_buff_id(), first_rune:get_spell_id())
    end

    self.buffs:append(new_buff)
end

-- function TrackedMob:add_buff(buff)
--     if buff.spell.overwrites then
--         for _, spell_id in ipairs(buff.spell.overwrites) do
--             if self.buffs[buff:get_buff_id()] and self.buffs[buff:get_buff_id()]:get_spell_id() == spell_id then
--                 local overwritten_buff = self.buffs[buff:get_buff_id()]
--                 overwritten_buff:expire()

--                 self.buffs[buff:get_buff_id()] = nil
--             end
--         end
--     end

--     self.buffs[buff:get_buff_id()] = buff

--     self:sort_buffs()
-- end

function TrackedMob:remove_buff(buff_id, spell_id)
    local current_index, current_buff = self.buffs:find(function(buff) return buff:get_buff_id() == buff_id end)

    if spell_id then
        current_index, current_buff = self.buffs:find(function(buff) return buff:get_buff_id() == buff_id and buff:get_spell_id() == spell_id end)
    else
        current_index, current_buff = self.buffs:find(function(buff) return buff:get_buff_id() == buff_id end)
    end

    if current_buff then
        self.buffs:remove(current_index)
    end
end

function TrackedMob:clear_buffs()
    self.buffs:clear()
end