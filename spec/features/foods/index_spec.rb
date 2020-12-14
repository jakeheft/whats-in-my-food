require 'rails_helper'

describe 'When I select an ingredient' do
  it "I am taken to '/foods' where I can see 10 foods that contain that ingredient" do
    visit root_path

    fill_in :q, with: 'sweet potatoes'
    click_on 'Search'

    expect(current_path).to eq(foods_path)
  end
end
