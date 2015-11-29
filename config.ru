require 'rack'
require 'grape'
require_relative 'dice'

run Dice::API
