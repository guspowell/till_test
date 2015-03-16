require 'sinatra/base'
require "sinatra/json"
require './lib/shop.rb'

class TillApp < Sinatra::Base
  get '/' do
    'Hello TillApp!'
  end

  get '/index' do
    @shop = Shop.new
    file = File.read('./public/hipstercoffee.json')
    @json_file = JSON.parse(file)[0]
    @name = @json_file['shopName']
    erb :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
