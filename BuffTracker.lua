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
--require('TrackedMobs')
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
defaults.text.font = 'Consolas'
defaults.text.size = 10
defaults.flags = {}
defaults.flags.bold = false
defaults.flags.draggable = true
defaults.bg = {}
defaults.bg.alpha = 255
defaults.duration = {}

settings = config.load(defaults)
maintargetbox = texts.new("Main Target", settings)
maintargetbox:show()