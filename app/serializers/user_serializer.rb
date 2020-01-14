class UserSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :acc_number, :balance
  has_many :loans
end
