class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'


  get '/' do
    { message: "Hello world" }.to_json
  end

  get '/games' do
    games = Game.all
    games.to_json
  end

  get '/games/:id' do
    game = Game.find(params[:id])
    game.to_json(only: [:title, :price], include: {reviews: {only:[:score, :user_id]}})
  end

end
