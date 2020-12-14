class Food
  attr_reader :gtin_upc, :description, :brand_owner, :ingredients
  def initialize(info)
    @gtin_upc = info[:gtinUpc]
    @description = info[:description]
    @brand_owner = info[:brandOwner]
    @ingredients = info[:ingredients]
  end
end
