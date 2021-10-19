require 'rails_helper'

RSpec.describe Product do
  
  describe 'Validations', type: :model do
    describe 'initial example' do
      it 'a product to a category with all four fields set will be saved successfully' do
        @category = Category.new
        @product = Product.new
        @product.name = 'Laptop'
        @product.description = 'This is a cool water proof laptop that will last for life.'
        @product.image = 'image_url'
        @product.price_cents = 700
        @product.quantity = 30
        @product.category = @category
 
        expect(@product.valid?).to be true
      end
    end

    describe 'validates :name,' do
      # it 'presence: true' do
      #   @product = Product.new
      #   @product.name = 'Apple'
      #   expect(@product.name).to be_present
      # end

      it 'should be validated when its empty' do
        @product = Product.new
        @product.name = nil
        @product.valid?
        expect(@product.errors[:name]).to include("Name cannot be blank")
      end
    end

    describe 'validates :price,' do
      # it 'presence: true' do
      #   @product = Product.new
      #   @product.price = 2300
      #   expect(@product.price).to be_present
      # end

      it 'should be validated when its empty' do
        @product = Product.new
        @product.valid?
        expect(@product.errors[:price]).to include("Price cannot be blank")
      end
    end

    describe 'validates :quantity,' do
      # it 'presence: true' do
      #   @product = Product.new
      #   @product.quantity = 20
      #   expect(@product.quantity).to be_present
      # end

      it 'should be validated when its empty' do
        @product = Product.new
        @product.quantity = nil
        @product.valid?
        expect(@product.errors[:quantity]).to include("Quantity cannot be blank")
      end
    end
    
    describe 'validates :category,' do
      # it 'presence: true' do
      #   @category = Category.new
      #   @product = Product.new
      #   @product.category = @category
      #   expect(@product.category).to be_present
      # end

      it 'should be validated when its empty' do
        @product = Product.new
        @product.category = nil
        @product.valid?
        expect(@product.errors[:category]).to include("Category cannot be blank")
      end
    end
  end 
end
