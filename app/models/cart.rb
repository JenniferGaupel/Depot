class Cart < ApplicationRecord
    has_many :line_items, dependent: :destroy

    def add_product(product)
        current_item = line_items.find_by(product_id: product.id)
        if current_item
            # Qty was default to nil, instead of 1 like I tried to describe in the db, 
            # and I was getting an error when I tried to add to the nil qty
            # so I added this check. If qty is true/exists with a not-nil value, increment cart qty
            # otherwise, it's false/nil, so set it to a default of 1
            if current_item.quantity
                current_item.quantity += 1
            else
                current_item.quantity = 1
            end
        else
            current_item = line_items.build(product_id: product.id)
        end
        current_item
    end

    def total_price
        line_items.to_a.sum { |item| item.total_price }
      end
end
