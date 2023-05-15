class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  def total_price
    if quantity
      product.price * quantity
    else
      product.price * 1
    end
    # product.price * quantity
  end
end
