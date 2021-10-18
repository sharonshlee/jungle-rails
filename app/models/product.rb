class Product < ActiveRecord::Base

  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category

  validates :name, presence:  { message: "Name cannot be blank" }
  validates :price, presence: { message: "Price cannot be blank" }
  validates :quantity, presence: { message: "Quantity cannot be blank" }
  validates :category, presence: { message: "Category cannot be blank" }

end
