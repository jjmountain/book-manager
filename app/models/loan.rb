class Loan < ApplicationRecord
  belongs_to :user
  belongs_to :book
  before_create :generate_due_date
  before_create :deduct_book_quantity
  before_update :increment_book_quantity, :deduct_user_balance, :return!
  validates :book_id, presence: true
  validates :user_id, presence: true
  validate :book_is_available, on: :create
  validate :user_has_enough_credit, on: :create
  validate :user_is_not_already_borrowing_book, on: :create

  validate :loan_is_not_already_returned, on: :update


  # validate :book_being_returned_is_checked_out_by_user, on: :update
  
  # validations on creating loan

  def book_is_available
    if Book.find(book_id).quantity_remaining == 0 
      errors.add(:book_id, "No more copies of that book are available")
    end
  end

  def user_has_enough_credit
    if User.find(user_id).balance < Book.find(book_id).rental_fee
      errors.add(:user_id, "User balance is not enough to borrow that book")
    end
  end

  def user_is_not_already_borrowing_book
    if User.find(user_id).loans.where(returned: false).pluck(:book_id).include?(book_id)
      errors.add(:user_id, "User is already borrowing this book")
    end
  end

  # validations on returning loan

  def loan_is_not_already_returned
    if returned
      errors.add(:id, "This loan has already been returned")
    end
  end

  # callbacks on create

  def deduct_user_balance
    user_to_deduct_from = User.find(user_id)
    rental_fee = Book.find(book_id).rental_fee
    user_to_deduct_from.update(balance: user_to_deduct_from.balance - rental_fee) 
  end

  def deduct_book_quantity
    book_to_update = Book.find(book_id)
    book_to_update.update(quantity_remaining: book_to_update.quantity_remaining - 1)
  end

  # callbacks on update (return)

  def increment_book_quantity
    book_to_update = Book.find(book_id)
    book_to_update.update(quantity_remaining: book_to_update.quantity_remaining + 1)
  end

  def return!
    self.returned = true
  end

  # other methods

  def generate_due_date
    self.due_date = Time.now + 1.month
  end

end
