require 'sinatra/base'
require './lib/shop.rb'

class TillApp < Sinatra::Base
  get '/' do
    'Hello TillApp!'
  end

  get '/index' do
    @shop = Shop.new
    @shop.load_information('./hipstercoffee.json')
    @shop_name = @shop.name
    erb :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
