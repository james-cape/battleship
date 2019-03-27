require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require './lib/gameplay'
require './lib/animations'
require 'pry'

@gameplay = Gameplay.new

@gameplay.start
