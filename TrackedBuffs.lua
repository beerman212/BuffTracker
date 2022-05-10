TrackedBuffs = {}

function TrackedBuffs.new()
    local self = {}

    setmetatable(self, {__index = TrackedBuffs})

    return self
end

function TrackedBuffs.tostring(buffs)
    local display_string = "Buffs: \n"

    for _, buff in pairs(buffs) do
        display_string = display_string + "\t" .. buff .. "\n"
    end
end

function TrackedBuffs:add_buff(buff)
    self[buff:get_buff_id()] = buff
end

function TrackedBuffs:remove_buff(buff)
    if self[buff:get_buff_id()] then
        self[buff:get_buff_id()] = nil
    end
end

function TrackedBuffs:clear_buffs()
    table.clear(self)
end