class ProductsController < ApplicationController
  def new
    @products = Product.all
    @product = Product.new
  end

  def create
    @product = current_user.products.new(product_params)
     if @product.save
       flash[:notice] = "Item has been saved"
       redirect_to product_path(@product)
     else
       flash[:notice] = "Something went wrong"
       redirect_to new_product_path
     end
  end

  def show
    @product = Product.find(params[:id])
  end



private
  def product_params
    params.require(:product).permit(:name, :description, :price, :photo)
  end
end
