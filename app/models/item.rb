class Item < ApplicationRecord
  has_one_attached :image
  has_many :order_details, dependent: :destroy
  belongs_to :genre
  has_many :cart_items, dependent: :destroy

  validates :name, :image, :price, :genre_id, presence: true

  def with_tax_price
    (price * 1.1).floor
  end

end
