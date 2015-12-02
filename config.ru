require 'rack'
require 'grape'
require_relative 'dice_api'

use Rack::Static,
  :urls => ["/images", "/js", "/css"],
  :root => "public", :index => "index.html"

run DiceGame::API
