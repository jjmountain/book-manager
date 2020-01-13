class Loan < ApplicationRecord
  belongs_to :user
  belongs_to :book
  before_create :generate_due_date
  validates :book_id, presence: true
  validates :user_id, presence: true

  # create validation to check that there are books available

  # create validation to check that user has sufficient balance

  def generate_due_date
    self.due_date = Time.now + 1.month
  end

  def returned?
    !date_returned.nil?
  end
end
