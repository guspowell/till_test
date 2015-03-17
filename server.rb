require 'sinatra/base'
require './lib/shop.rb'
require './lib/order.rb'


class TillApp < Sinatra::Base
  get '/' do
    'Hello TillApp!'
  end

  shop = Shop.new
  shop.load_information

  get '/index' do
    @name = shop.name
    erb :index
  end

  get '/mainpage' do
    @name = shop.name
    @time = Time.new.strftime("%B %e, %Y")
    @order = Order.new(1)
    erb :mainpage
  end

  post '/mainpage' do
    table_number, item, quantity = params[:table_number].to_i, params[:item], params[:quantity].to_i
    @order = Order.new(table_number)
    @order.add_item(item, quantity)
    redirect to('/mainpage')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
