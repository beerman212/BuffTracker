addon = {}
addon.author = "Shadowmeld"
addon.commands = {'bufftracker', 'bt'}
addon.name = "BuffTracker"
addon.version = "00.00.01"

require('luau')
require('functions')
require('actions')
require('packets')
local texts = require('texts')
res = require('resources')
require('tables')
require('sets')

require('config')
local extdata = require('extdata')

require('message_map')
require('EventHandler')
require('TrackedMobs')
require('HelperFunctions')
require('data/mob_data')
require('data/equipment_map')

ActionPacket.open_listener(action_handler)