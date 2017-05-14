class ProductsController < ApplicationController
  def index
    @products=Product.all
  end
  def show
    @product=Product.find(params[:id])
  end
  def add_to_cart
    @product=Product.find(params[:id])
    if !current_cart.products.include?(@product)
       current_cart.add_product_to_cart(@product)
       flash[:notice]="Success #{@product.title}to add to the cart"
    else
       flash[:warning]="You'd already had it in the cart."
    end
    redirect_to :back
  end
end
