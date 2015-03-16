require 'shop.rb'

describe Shop do

  let (:shop){Shop.new}

  it 'should be able to load a json' do
    expect( shop.load_information.class).to eq Hash
  end

  it 'should know its name' do
    shop.load_information
    expect(shop.name).to eq 'The Coffee Connection'
  end

  it 'should know its address' do
    shop.load_information
    expect(shop.address).to eq '123 Lakeside Way'
  end

  it 'should know its telephone number' do
    shop.load_information
    expect(shop.telephone).to eq '16503600708'
  end

  it 'should know its menu prices' do
    shop.load_information
    expect( shop.menu_prices["Cafe Latte"] ).to eq 4.75
    expect( shop.menu_prices["Cappucino"] ).to eq 3.85
  end

end
