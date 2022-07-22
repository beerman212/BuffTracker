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

local resource_modifications = require('static/resource_modifications')
res = require('resources')
table.amend(res, resource_modifications, true)

require('tables')
require('sets')
socket = require('socket')

require('config')
local extdata = require('extdata')

require('message_map')
require('EventHandler')
require('TrackedBuff')
require('TrackedMob')
require('HelperFunctions')
mob_data = require('data/mob_data')
require('data/equipment_map')

ActionPacket.open_listener(action_handler)

tracked_mobs = T{}

defaults = {}
defaults.pos = {}
defaults.pos.x = 600
defaults.pos.y = 300
defaults.text = {}
defaults.text.font = 'Verdana'
defaults.text.size = 10
defaults.flags = {}
defaults.flags.bold = true
defaults.flags.draggable = true
defaults.bg = {}
defaults.bg.alpha = 255
defaults.duration = {}

settings = config.load(defaults)
maintargetbox = texts.new("Main Target", settings)
maintargetbox:show()

logfilename = "data/logger.log"