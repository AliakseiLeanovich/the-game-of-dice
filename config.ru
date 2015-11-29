require 'rack'
require 'grape'
require_relative 'dice'

use Rack::Static,
  :urls => ["/images", "/js", "/css"],
  :root => "public", :index => "index.html"

run Dice::API
