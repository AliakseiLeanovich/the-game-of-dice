require 'grape'
require 'json'

module Dice
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
      rate = params[:rate]
      score = params[:score].to_i
      unless rate.nil?
        dice1 = rand(1..6)
        dice2 = rand(1..6)
        result = (rate.to_i == dice1 + dice2) ? 1 : -1 
        score += result
      end
      { score: score, dice1: dice1, dice2: dice2 }
    end
  end
end
