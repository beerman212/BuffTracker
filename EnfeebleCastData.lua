EnfeebleCastData = {}

function EnfeebleCastData.new(caster, equipment, spell, target, buffs, time_cast, result)
    local self = {}
    self.caster = caster or {}
    self.equipment = equipment or {}
    self.spell = spell or {}
    self.target = target or {}
    self.buffs = buffs or T{}
    self.time_cast = time_cast or os.time()
    self.result = result or "Unknown"

    setmetatable(self, {__index = EnfeebleCastData, __tostring = EnfeebleCastData.tostring})
    return self
end

function EnfeebleCastData.tostring(castdata)
    local caster_info = string.format("Caster: %s, Saboteur: %s, Stymie: %s", castdata.caster.name, (castdata.buffs.Saboteur and "Yes") or "No", (castdata.buffs.Stymie and "Yes") or "No")
    local spell_info = string.format("Spell: %s, Buff ID: %3d, Base Duration: %3d, Result: %s", castdata.spell.en, castdata.spell.status, castdata.spell.duration, castdata.result)
    local target_info = string.format("Target: %s, Is NM: %s", castdata.target.name, "Not Testing Yet")
    local time_info = string.format("Time Cast: %s", castdata.time_cast)

    if castdata.time_expired then
        time_info = time_info .. string.format(", Time Expired: %s, Total Duration: %d", castdata.time_expired, os.difftime(castdata.time_expired, castdata.time_cast))
    else
        time_info = time_info .. string.format(", Current Duration: %d", os.difftime(os.time(), castdata.time_cast))
    end

    return string.format("%s\n%s\n%s\n%s", caster_info, spell_info, target_info, time_info)
end

function EnfeebleCastData:get_log_string()

end

function EnfeebleCastData:expire()
    self.time_expired = os.time()
end

function EnfeebleCastData:get_final_duration()
    return os.difftime(self.time_expired, self.time_cast)
end