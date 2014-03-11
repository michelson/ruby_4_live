# Ruby 4 Live #

A Ruby implementation of the [Ableton Live](http://ableton.com/) API. The current version connects to an included [Max For Live](http://ableton.com/maxforlive) patch via OSC to interact with the API.

## Installation

Add this line to your application's Gemfile:

    gem 'ruby_4_live'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruby_4_live


## Author ##

Peter Marks (petertmarks [at] gmail [dot] com)


## Status ##

This is a young library (first commit 11/24/2009) and the API is subject to change. Currently, I'm modeling it after my own needs. If you are using it and have requests or questions, I am happy to listen and respond.


## Dependancies ##

+ [OpenSound Control for Ruby](http://github.com/fugalh/rosc)
+ [OpenSoundControl max external](http://cnmat.berkeley.edu/downloads)

## Usage ##

Establish a connection to the a LiveSet running the included max patch by creating a LiveConnection object:

	>  connection = Ruby4Live::LiveConnection.new('localhost', 7402, 7403)
	=> <LiveConnection>

Once connected, you can create a LiveSet object to scan for every Track, Device, DeviceParameter, ClipSlot and Clip 'LiveObject':

	>  require 'ruby_4_live'
	=> true
	>  set = Ruby4Live::LiveSet.new(connection)
	   Scan Complete
	=> LiveSet: 7 tracks, 10 devices, 37 parameters, 60 clip slots, 21 clips

The initial scan also fetches object attributes as specified in config/settings.yaml. It may take a few seconds to load everything. If you're having trouble, try increasing the SLEEP_INTERVAL constant. The LiveSet object stores all children LiveObjects in its 'objects' attribute to allow for easy serialization of the set.

Once the set is initialized, you can get all its objects of a particular kind by calling that kind pluralized:

	>  set.tracks
	=> [#<Track @order=0, @id=2, @name="1-Audio">, #<Track @order=1, @id=3, @name="2-Audio">]

LiveObject properties act as accessor methods:

	>  set.tracks[0].name
	=> "1-Audio"


## My To-Do List ##

+ Implement functionality for LiveSet, Scene and other objects.
+ Improved error handling for set scanning.
+ Transport listeners
+ Test suite

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
