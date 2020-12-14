require 'rails_helper'

describe 'When I select an ingredient' do
  it "I am taken to '/foods' where I can see 10 foods that contain that ingredient" do
    visit root_path

    search = 'sweet potatoes'

    fill_in :q, with: search
    click_on 'Search'

    expect(current_path).to eq(foods_path)
    expect(page).to have_content(search)
    expect(page).to have_content('Number of results:')
    expect(FoodFacade.result_count(search)).to_not eq(0)
    expect(page).to have_content(FoodFacade.result_count(search))

    within(first('.food')) do
      expect(page).to have_content('Description:')
      expect(page).to have_content('GTIN/UPC:')
      expect(page).to have_content('Brand Owner:')
      expect(page).to have_content('Ingredients:')
    end
  end
end
