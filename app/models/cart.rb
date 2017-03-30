class Cart < ApplicationRecord

  def self.total_cost
    total = 0
    Cart.all.each do |product|
      total += product.price * product.stock
    end
    total
  end
  
end
