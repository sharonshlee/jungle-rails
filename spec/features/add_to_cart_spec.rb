require 'rails_helper'

# feature === describe
RSpec.feature "Visitor click Add to Cart button", type: :feature, js: true do

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
  scenario "cart increases by one" do
    # ACT
    visit root_path
    # find('form button', match: :first).click
    click_button("Add", match: :first).click
    sleep 5
    # puts page.html
    # DEBUG
    save_screenshot

    # VERIFY
    expect(page).to have_content 'My Cart (1)'
  end

end

