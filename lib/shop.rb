class Shop

  attr_reader :json_file, :name, :address, :telephone, :menu_prices

  def initialize
    @json_file
    @name
    @address
    @telephone
    @menu_prices
  end

  def load_information
    file = File.read('hipstercoffee.json')
    @json_file = JSON.parse(file)[0]
  end

  def name
    # 'gus'
    @name = @json_file['shopName']
  end

  def address
    @name = @json_file['address']
  end

  def telephone
    @name = @json_file['phone']
  end

  def menu_prices
    @menu_prices = @json_file['prices'][0]
  end

end
