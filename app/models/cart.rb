class Cart < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy # :dependent => destroy indicates that destroying the cart destroys the line_item's
  
  def add_product(product_id)
    current_item = line_items.find_by_product_id(product_id)
    if current_item
      current_item.quantity += 1    # If the current_item exists, then up the quantity by 1
    else
      current_item = line_items.build(:product_id => product_id)    # If the current_item doesn't exist, then create it
    end
    current_item
  end
  
  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
  
  def total_items
    line_items.sum(:quantity)
  end
  
end
