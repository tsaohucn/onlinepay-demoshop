class CartsController < ApplicationController

  def destroy
    cart = Cart.find(params[:id])
    product = Product.find(params[:id])
    total_stock = cart.stock + product.stock
    product.update(stock: total_stock)
    cart.destroy
    flash[:notice] = "Article was destroy sucessful"
    redirect_to products_path    
  end

  def checkout
    total_cost = Cart.total_cost
    if total_cost > 0
      @checkout = { id: rand(1000000), cost: total_cost }
      Cart.all.destroy_all
    else
      redirect_to products_path
    end
  end

  def onlinepay
    #render text: params[:cost]
    playments = Onlinepay::Payments.new("Harry Potter Magic Bill : #{params[:id]}", params[:cost], "CNY")
    redirect_to playments.processingUrl
  end

end
