class Product < ApplicationRecord

  # Note: The money-rails gem automatically interprets a column name called "price_cents" to mean "store a price in cents"
  # So it will automatically multiply a price entered in the params by 100 and save it here
  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true
end
