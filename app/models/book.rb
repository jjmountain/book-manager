class Book < ApplicationRecord
  has_many :loans


  def book_available?
    if self.quantity > 0
      self.quantity = self.quantity - 1
      self.save
    else 
      false
    end
  end
end
