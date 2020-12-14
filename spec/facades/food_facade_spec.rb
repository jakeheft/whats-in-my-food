require 'rails_helper'

describe 'Food Facade' do
  it 'can search foods with ingredient' do
    search = 'sweet potatoes'
    foods = FoodFacade.search_foods(search)

    expect(foods).to be_an(Array)
    expect(foods.first).to be_a(Food)
    expect(foods.first.gtin_upc).to be_a(String)
    expect(foods.first.description).to be_a(String)
    expect(foods.first.brand_owner).to be_a(String)
    expect(foods.first.ingredients).to be_a(String)
  end
end
