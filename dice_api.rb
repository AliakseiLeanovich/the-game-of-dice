require 'grape'
require 'json'
require_relative 'game_step'

module DiceGame
  class API < Grape::API
    format :json
    secret_token = "123456"

    params do
      requires :access_token, :type => String
      requires :rate, :type => Integer
      requires :score, :type => Integer
    end

    before do
      error!("401 Unauthorized", 401) unless params[:access_token] == secret_token
    end

    post '/rate' do
      step = GameStep.new(params[:score], params[:rate])
      step.check_result
    end
  end
end
