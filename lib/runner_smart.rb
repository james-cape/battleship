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


# Q for Norm:

# How to write tests for gameplay.rb?

# How to further clean up code smells?

# Please critique our class/object logic?

# Please critique our overall structure in general?

# Any known pitfalls? Such as rendering 1 2 3 4 5 6 7 8 9 10 11 12 13 14 etc




# Need to be able to put in coordinates in any order and .sort


# ruby path/to/test_file.rb --name test_method_nam

# Look into storing ship coordinates in each ship's class object.
