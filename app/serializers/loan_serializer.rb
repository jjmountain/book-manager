class LoanSerializer < ActiveModel::Serializer
  attributes :id, :book, :user, :created_at, :updated_at, :due_date, :returned
  belongs_to :user
end
