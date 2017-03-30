class ProductsController < ApplicationController
  def index
    @products = Product.all
    @carts = Cart.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "add sucessful"
      redirect_to products_path
    else
      render "new"
    end
  end

  def destroy
    @product = Product.find(params[:id]) 
    @product.destroy
    flash[:notice] = "Article was destroy sucessful"
    redirect_to products_path
  end 

  def buy
    product = Product.find(params[:id]) 
    if Cart.find_by(title: product.title)
      Cart.increment_counter(:stock, params[:id])
    else
      Cart.create(id: params[:id], title: product.title, price: product.price, stock: 1)
    end
    Product.decrement_counter(:stock, params[:id])
    redirect_to products_path
  end 

  private

  def product_params
    params.require(:product).permit(:title, :price, :stock)
  end
end
