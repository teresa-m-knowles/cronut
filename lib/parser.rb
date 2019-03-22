require 'json'
require 'pry'
require './lib/item'

data = JSON.parse(File.read('./data/cronut.json'))

items = data["items"]["item"].map do |item_data|
  Item.new(item_data)
end

binding.pry
