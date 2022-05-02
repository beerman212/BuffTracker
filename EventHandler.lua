require('actions')
require('packets')

ActionPacket.open_listener(action_handler)

function action_handler(action)
    local actionpacket = ActionPacket.new(action)
    local category = actionpacket:get_category_string()

    if category == 'spell_finish' then
        local actor = actionpacket:get_id()
        local spell = actionpacket:get_spell()
        local targets = actionpacket:get_targets()
    end
end

windower.register_event('action message', function(id, data)

end)