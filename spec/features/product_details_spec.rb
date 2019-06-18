require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do

  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They click on a details button for a product" do
    # act
    visit root_path
    first('.product').click_link('Details')

    visit current_url
    save_screenshot

    # debug/verify
    expect(current_path).to match /\/products\/\d/
  end
end