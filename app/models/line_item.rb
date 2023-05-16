class LineItem < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :product
  belongs_to :cart, optional: true

  def total_price
    if quantity
      product.price * quantity
    else
      product.price * 1
    end
    # product.price * quantity
  end
end
