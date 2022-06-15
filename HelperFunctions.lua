require('logger')
extdata = require('extdata')

equip_slots = {'main','sub','range','ammo','head','neck','left_ear','right_ear','body','hands','left_ring','right_ring','back','waist','legs','feet'}

augment_cache = setmetatable({}, {
    __index = function(t, item)
        return type(item) == 'table' and item.id and item.extdata and rawget(t, item.id .. item.extdata) or rawget(t, item)
    end,
    __newindex = function(t, item, value)
        if not value or not value.type or not value.augments then return end
        if value.type ~= 'Augmented Equipment' then
            rawset(t, item.id .. item.extdata, false)
        else
            local augments = T(extdata_parse.augments):filter(function(a) return a ~= 'none' end)
            rawset(t, item.id .. item.extdata, augments)
        end
    end,
})

function calculate_enhancing_duration(player, spell, target, equipment, buffs)
    --local spell_info, equipment, player, buffs = get_basic_info(spell, equipment)
    if not (player or spell or target or equipment or buffs) then return end

    local composure_modifier = get_base_enhancing_composure_modifier(player, spell, target, buffs)
    local composure_count = 0

    local base_duration = spell.duration or 0
    local duration_modifier = 1
    local duration_bonus = get_enhancing_duration_bonus(spell, player, buffs)

    local augment_duration_modifier = 1
    local perpetuance_modifier = buffs.Perpetuance and 2 or 1
    local embolden_modifier = buffs.Embolden and (target.id == player.id and -0.5) or 1

    for _, slot in ipairs(equip_slots) do
        local item = windower.ffxi.get_items(equipment[slot .. '_bag'], equipment[slot])
        local modifiers = enhancing_modifiers[item.id]

        if modifiers then
            for index, value in pairs(modifiers) do
                if index == 1 then
                    duration_modifier = duration_modifier + value
                elseif index == 'augment' then
                    augment_duration_modifier = augment_duration_modifier + value
                elseif index == 'perpetuance' and buffs.Perpetuance then
                    perpetuance_modifier = perpetuance_modifier + value
                elseif index == 'embolden' and buffs.Embolden then
                    embolden_modifier = embolden_modifier + value
                elseif spell.english:startswith(index) then
                    duration_bonus = duration_bonus + value
                end
            end
        end

        if enhancing_relic_bonus[item.id] then
            duration_bonus = duration_bonus + (player.merits.enhancing_magic_duration and (player.merits.enhancing_magic_duration * 3) or 0)
        end

        if composure_gear[item.id] then
            composure_count = composure_count + 1
        end
    end

    if buffs.Composure and target.id ~= player.id then
        composure_modifier = composure_modifier + (composure_modifiers[composure_count] or 0)
    end

    local enhancing_duration = base_duration + duration_bonus

    for _, modifier in ipairs({duration_modifier, augment_duration_modifier, perpetuance_modifier, embolden_modifier}) do
        enhancing_duration = enhancing_duration * modifier
    end

    if enhancing_duration < (60 * 30) then
        enhancing_duration = enhancing_duration * composure_modifier

        if enhancing_duration > (60 * 30) then
            enhancing_duration = 60 * 30
        end
    end

    local modifiers = {
        ["Flat Bonus"] = duration_bonus,
        ["Duration"] = duration_modifier,
        ["Augment"] = augment_duration_modifier,
        ["Composure"] = composure_modifier,
        ["Perpetuance"] = perpetuance_modifier,
        ["Embolden"] = embolden_modifier
    }

    return enhancing_duration, modifiers
end

function calculate_enfeebling_duration(player, spell, target, equipment, buffs)
    if not (player or spell or target or equipment or buffs) then return end
    local current_time = os.time()
    
    local composure_modifier = 1
    local composure_count = 0

    local saboteur_modifier = get_base_saboteur_modifier(spell, target, buffs, mob_data.NMs or L{})

    local duration_modifier = 1
    local augment_duration_modifier = 1

    local base_duration = (spell.duration or 0)

    local duration_bonus = (player.main_job == "RDM" and player.merits.enfeebling_magic_duration and (player.merits.enfeebling_magic_duration * 6) or 0)
    duration_bonus = duration_bonus + (player.job_points[player.main_job:lower()].enfeebling_magic_duration or 0)

    if buffs.Stymie then
        duration_bonus = duration_bonus + (player.job_points[player.main_job:lower()].stymie_effect or 0)
    end


    for _, slot in ipairs(equip_slots) do
        local item = windower.ffxi.get_items(equipment[slot .. '_bag'], equipment[slot])
        local modifiers = enfeebling_modifiers[item.id]

        if modifiers then
            for index, value in pairs(modifiers) do
                if index == 1 then
                    duration_modifier = duration_modifier + value
                elseif index == 'augment' then
                    augment_duration_modifier = augment_duration_modifier + value
                elseif index == 'saboteur' and buffs.saboteur then
                    saboteur_modifier = saboteur_modifier + value
                end
            end
        end

        if enfeebling_relic_bonus[item.id] then
            duration_bonus = duration_bonus + (player.merits.enfeebling_magic_duration and (player.merits.enfeebling_magic_duration * 6) or 0)
        end

        if composure_gear:contains(item.id) then
            composure_count = composure_count + 1
        end
    end
    
    composure_modifier = composure_modifier + (composure_modifiers[composure_count] or 0)
    local duration = (base_duration * saboteur_modifier) + duration_bonus

    for _, modifier in ipairs({duration_modifier, augment_duration_modifier, composure_modifier}) do
        duration = duration * modifier
    end

    duration = math.floor(duration)

    local duration_map = table.map(resist_state_modifiers,
        function(resist_multiplier)
            return math.floor(duration * resist_multiplier)
        end
    )

    local modifiers = {
        ["Saboteur"] = saboteur_modifier,
        ["Flat Bonus"] = duration_bonus,
        ["Duration"] = duration_modifier,
        ["Augment"] = augment_duration_modifier,
        ["Composure"] = composure_modifier
    }

    return duration_map, modifiers
end

-- Song Calculations
-- Reference page: https://www.bg-wiki.com/ffxi/Category:Song#Song_Effect_Duration
function calculate_song_duration(player, spell, target, equipment, buffs)
    if not (player or spell or target or equipment or buffs) then return end
    local current_time = os.time()
    
    -- Troubadour is applied after all other modifiers

    local duration_bonus = 0
    local duration_modifier = 1
    local augment_duration_modifier = 1
    local troubadour_modifier = 1
    local soul_voice_modifier = 1
    local base_duration = (spell.duration or 0)
    local equipped_items = {}
    local serial_list = {}
    local item = {}

    -- Standard modifiers
    for _, slot in ipairs(equip_slots) do
        item = set_item_metadata(windower.ffxi.get_items(equipment[slot .. '_bag'], equipment[slot]))
        
        table.insert(equipped_items, item)
   
        if modifiers then
            for index, value in pairs(modifiers) do
                if index == 1 then
                    duration_modifier = duration_modifier + value
                elseif spell.english:lower():contains(index) then
                    duration_modifier = duration_modifier + value
                elseif index == all_songs then
                    duration_modifier = duration_modifier + value
                -- TODO: Address special cases, such as Dynamis Horn
                end
            end
        end
    end

    --Augments
    -- All Songs,
    duration_modifier = duration_modifier + search_augments(equipped_items, 'All Songs'):reduce(function(total, aug) return total + ((not aug.sign or aug.sign=='+') and aug.value or (aug.value * -1)) end, 0) * 0.1

    if buffs.Nightingale and next(search_augments(equipped_items, 'Enhances "Nightingale" effect')) then
        duration_bonus = duration_bonus + (player.merits.nightingale or 0) * 4
    end

    if buffs.Troubadour then
        troubadour_modifier = 2
        duration_bonus = duration_bonus + (player.job_points.brd.troubadour_effect or 0) * 2
        if next(search_augments(equipped_items, 'Enhances "Troubadour" effect')) then
            duration_bonus = duration_bonus + (player.merits.troubadour or 0) * 4
        end
    end

    -- Job point bonus conditions:
    -- clarion_call_effect (2s/per); tenuto_effect (2s/per); lullaby_duration; marcato_effect
    if buffs["Clarion Call"] then
        duration_bonus = duration_bonus + (player.job_points.brd.clarion_call_effect or 0) * 2
    end

    -- TODO: Verify this applies only to self
    if buffs.Tenuto and target.id == player.id then
        duration_bonus = duration_bonus + (player.job_points.brd.tenuto_effect or 0) * 2
    end

    if spell.english:contains("Lullaby") then
        duration_bonus = duration_bonus + (player.job_points.brd.lullaby_duration or 0)
    end

    -- Soul Voice doubles the duration of Hymnus, Mazurka, and Scherzo, but is not compatible with Marcato.
    if spell.english:endswith("Hymnus") or spell.english:endswith("Mazurka") or spell.english:endswith("Scherzo") then
        if buffs["Soul Voice"] then
            soul_voice_modifier = 2
        elseif buffs.Marcato then
            soul_voice_modifier = 1.5
        end
    end

    -- TODO: Test to confirm if both SV and Marcato are in use that the JP duration bonus for Marcato would still apply
    if buffs.Marcato then
        duration_bonus = duration_bonus + (player.job_points.brd.marcato_effect or 0)
    end
    
    -- Flat bonuses and percentage based bonuses are both applied independently, then multiplied by Troubadour's doubling bonus. Soul voice, where applicable is multiplicative with this term.
    local duration = (base_duration * duration_modifier + duration_bonus) * troubadour_modifier * soul_voice_modifier

    duration = math.floor(duration)

    -- Applies to debuff songs, e.g. Elegy
    local duration_map = table.map(resist_state_modifiers,
        function(resist_multiplier)
            return math.floor(duration * resist_multiplier)
        end
    )

    local modifiers = {
        ["Troubadour"] = troubadour_modifier,
        ["Soul Voice"] = soul_voice_modifier,
        ["Flat Bonus"] = duration_bonus,
        ["Duration"] = duration_modifier,
        ["Augment"] = augment_duration_modifier,
    }

    if spell.targets == 32 then
        return duration_map, modifiers
    else
        -- if spell.targets == 1 then
        return duration, modifiers
    end
end

-- Job Specific Calculations

-- Warrior
-- Tomahawk Duration (merits)
-- Lots of stuff from equipment

-- Monk

-- White Mage

-- Black Mage

-- Red Mage

-- Thief

-- Paladin

-- Dark Knight

-- Beastmaster

-- Bard

-- Ranger

-- Samurai

-- Ninja

-- Dragoon

-- Summoner

-- Blue Mage

-- Corsair

-- Puppetmaster

-- Dancer

-- Scholar

-- Geomancer

-- Rune Fencer

function get_basic_info(spell, equipment)
    local spell_info = windower.res.spells[spell.recast_id]
    local equipment = equipment or windower.ffxi.get_items('equipment')
    local player = windower.ffxi.get_player()
    local buffs = get_player_buffs(player)

    return spell_info, equipment, player, buffs
end

function get_base_saboteur_modifier(spell, target, buffs, nm_table)
    local saboteur_modifier = 1

    if buffs.Saboteur then
        if nm_table:contains(target:get_name()) then
            saboteur_modifier = 1.25
        else
            saboteur_modifier = 2
        end
    end

    return saboteur_modifier
end

function get_base_enhancing_composure_modifier(player, spell, target, buffs)
    local composure_modifier = 1

    if buffs.Composure and target.id == player.id then
        composure_modifier = 3
    end

    return composure_modifier
end

function get_enhancing_duration_bonus(spell, player, buffs)
    local duration_bonus = 0

    if player.main_job == "RDM" then
        if player.merits.enhancing_magic_duration then
            duration_bonus = duration_bonus + (player.merits.enhancing_magic_duration * 6)
        end

        duration_bonus = duration_bonus + (player.job_points[player.main_job:lower()].enhancing_magic_duration or 0)
    elseif player.main_job == "SCH" then
        if spell.english:startswith("Regen") and (buffs["Light Arts"] or buffs["Addendum: White"]) then
            local regen_bonus = math.floor((player.main_job_level - 1) / 4) * 2

            if buffs["Tabula Rasa"] then
                regen_bonus = regen_bonus * 2
            end

            duration_bonus = duration_bonus + regen_bonus

            if player.job_points[player.main_job].light_arts_effect then
                duration_bonus = duration_bonus + (player.job_points[player.main_job].light_arts_effect * 3)
            end
        end
    else

    end

    return duration_bonus
end

function update_gear_map()
    -- TODO: Look at inventory and update augmented gear maps
end

function get_player_buffs(player)
    player = player or windower.ffxi.get_player()
    if not player or not player.buffs then return {} end
    local buffs = T{}
    for _, buff_id in pairs(player.buffs) do
        buffs[buff_id] = (buffs[buff_id] or 0) + 1
        local buff_info = res.buffs[buff_id]
        if buff_info then
            local name = buff_info.english:lower()
            buffs[name] = (buffs[name] or 0) + 1
        end
    end
    setmetatable(buffs, {
        __index = function(t, key)
            if key and type(key) == 'string' then
                key = key:lower()
            end
            return rawget(t, key)
        end
    })
    return buffs
end

function convert_seconds_to_timer(duration)
    local hours, minutes, seconds

    hours = math.floor(duration / 3600)
    minutes = math.floor(duration % 3600 / 60)
    seconds = math.floor(duration % 60)

    return string.format("%02d:%02d:%02d", hours, minutes, seconds)

end

function get_time_utc(time)
    if not time then
        return os.date("'!%Y-%m-%dT%H:%M:%SZ'")
    else
        return os.date("'!%Y-%m-%dT%H:%M:%SZ'", time)
    end
end

function get_time_stamp(time)
    if not time then
        return os.date("%X")
    else
        return os.date("%X", time)
    end
end

metadata_definition = {
    __index = function(t, index)
        if index ~= 'augments' then
            return rawget(t, index)
        else
            local augments = augment_cache[t]
            if augments == nil then
                local extdata_parse = extdata.decode(t)
                if extdata_parse and extdata_parse.type == 'Augmented Equipment' then
                    augments = T(extdata_parse.augments):filter(function(a) return a ~= 'none' end)
                end
                augment_cache[t] = augments
                rawset(t, 'augments', augments)
            end
            return augment_cache[t]
        end
    end
}

function set_item_metadata(item)
    return setmetatable(item, metadata_definition)
end

function search_augments(equipped_items, query)
    local found_augments = {}
    for _, item in ipairs(equipped_items) do
        if item.augments then
            
            for _, line in ipairs(item.augments) do
                local match, sign, value, percent = line:match('"?('..query..')"?%s*([+%-]?)([%dVI]*)(%%?)')
                if match then
                    local aug = T{match=match, sign=sign, value=value, percent=percent} --this could probably get cached somewhere too
                    table.insert(found_augments, aug)
                end
            end
        end
    end
    return(T(found_augments))
end