class StaticPagesController < ApplicationController
  def index
     @products = Product.limit(3)
#     redirect_to "/static_pages/landing_page"
  end
   
  def landing_page
   @featured_product = Product.first
   @products = Product.limit(3)
  end

end
