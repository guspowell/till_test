require 'sinatra/base'
require './lib/shop.rb'

class TillApp < Sinatra::Base
  get '/' do
    'Hello TillApp!'
  end

  shop = Shop.new

  get '/index' do
    shop.load_information
    @name = shop.name
    erb :index
  end

  get '/mainpage' do
    erb :mainpage
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
