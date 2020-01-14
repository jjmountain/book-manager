class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :rental_fee, :quantity_on_loan, :quantity_remaining
  has_many :loans
end
