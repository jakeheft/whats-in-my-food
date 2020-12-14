require 'rails_helper'

describe Food do
  it 'exists' do
    attr = {
      gtinUpc: '095829400193',
      description: "It's food",
      brandOwner: 'Food Company',
      ingredients: 'Stuff'
    }

    food = Food.new(attr)

    expect(food).to be_a(Food)
    expect(food.gtin_upc).to eq(attr[:gtinUpc])
    expect(food.description).to eq(attr[:description])
    expect(food.brand_owner).to eq(attr[:brandOwner])
    expect(food.ingredients).to eq(attr[:ingredients])
  end
end
