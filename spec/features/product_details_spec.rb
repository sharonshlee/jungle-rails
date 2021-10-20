require 'rails_helper'

# feature === describe
RSpec.feature "Visitor navigates to product_details", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: 64.99
      )
    end
  end

  # scenario === it
  scenario "They see a product" do
    # ACT
    visit root_path
    # click on one of the product details button
    find_link("Details »", match: :first).click
    sleep 5
    # DEBUG
    save_screenshot

    # VERIFY
    expect(page).to have_css 'section.products-show'
  end

end
