class User < ApplicationRecord
  has_many :loans
  validates :acc_number, uniqueness: true
  before_create :generate_acc_number
  

  def full_name
    if first_name && last_name
      first_name + ' ' + last_name
    else
      ''
    end
  end

  def generate_acc_number
    acc_num_arr = []
    8.times { acc_num_arr << (0..9).to_a.sample }
    acc_num = acc_num_arr.join.to_i
    self.acc_number = acc_num
  end

end
