Given(/^I am a user with a till$/) do
  @till = Till.new
end

When(/^I choose an item and a quantity$/) do
  @till.add_item('cafe latte', 2)
end

Then(/^I should see the item and quantity$/) do
  expect(@till.order).to eq([{item: 'cafe latte', quantity: 2}]) # express the regexp above with the code you wish you had
end

When(/^I load the json file into the till$/) do
  @till.load(file)
end

Then(/^the till should know the shop name, address, phone number$/) do
  expect(@till.shop_name).to eq("The Coffee Connection")
  expect(@till.address).to eq("123 Lakeside Way")
  expect(@till.telephone).to eq("16503600708")
end
