require 'rails_helper'

describe FoodService do
  it 'search_foods' do
    foods = FoodService.search_foods('sweet potatoes')

    expect(foods).to be_an(Array)

    food = foods.first
    expect(food).to have_key(:gtinUpc)
    expect(food).to have_key(:description)
    expect(food).to have_key(:brandOwner)
    expect(food).to have_key(:ingredients)
  end

  it 'can see result count' do
    count = FoodService.result_count('sweet potatoes')

    expect(count > 10_000).to eq(true)
    expect(count < 100_000).to eq(true)
  end
end
