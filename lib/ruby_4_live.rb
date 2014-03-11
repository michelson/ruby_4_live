require "ruby_4_live/version"
require "yaml"

# http://www.wonderolie.nl/2009/opensoundcontrol-list-from-processing-to-maxmsp/
require 'osc' # http://github.com/halfbyte/rosc
require 'pry'

SETTINGS          = YAML::load(File.read('lib/ruby_4_live/config/settings.yaml'))
OBJECT_ATTRIBUTES = YAML::load(File.read('lib/ruby_4_live/config/object_attributes.yaml'))
SLEEP_INTERVAL    = 0.05

module Ruby4Live
  autoload  :VERSION,          'ruby_4_live/version.rb'
  autoload  :LiveConnection,   'ruby_4_live/live_connection.rb'
  autoload  :LiveObject,       'ruby_4_live/live_object.rb'
  autoload  :LiveSet,          'ruby_4_live/live_set.rb'
  
  autoload  :Track,            'ruby_4_live/objects/track.rb'
  autoload  :Device,           'ruby_4_live/objects/device.rb'
  autoload  :MixerDevice,      'ruby_4_live/objects/mixer_device.rb'
  autoload  :DeviceParameter,  'ruby_4_live/objects/device_parameter.rb'
  autoload  :ClipSlot,         'ruby_4_live/objects/clip_slot.rb'
  autoload  :Clip,             'ruby_4_live/objects/clip.rb'
end
