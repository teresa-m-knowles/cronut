require './lib/batter'
require './lib/batter_topping'
require './lib/topping'
class Item
  attr_reader :id,
              :type,
              :name,
              :ppu,
              :batters,
              :toppings
  def initialize(data)
    @id = data["id"]
    @type = data["type"]
    @name = data["name"]
    @ppu = data["ppu"]
    @batters = create_batters(data["batters"]["batter"])
    @toppings = create_toppings(data["topping"])
  end

  def create_batters(data)
    data.map do |batter_info|
      Batter.new(batter_info)
    end
  end

  def create_toppings(data)
    data.map do |topping_info|
      Topping.new(topping_info)
    end
  end
end
