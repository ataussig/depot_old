class StoreController < ApplicationController
  
  def increment_count
    session[:counter] ||= 0
    session[:counter] += 1
  end
  
  def index
    @products = Product.all
    @count = increment_count
    @cart = current_cart
  end

end
