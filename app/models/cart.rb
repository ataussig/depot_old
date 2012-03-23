class Cart < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy # :dependent => destroy indicates that destroying the cart destroys the line_item's
end
