class Book < ApplicationRecord
  has_many :loans

  def times_rented(start_str, end_str)
    if start_str == nil || end_str == nil
      errors.add(:id, "You must provide a start date and end date")
    end
    start_date = convert_to_date(start_str)
    end_date = convert_to_date(end_str)
    return Loan.where(book_id: id, returned: true).where("updated_at >= ? AND updated_at <= ?", start_date, end_date).count
  end

  def income(start_str, end_str)
    times_rented(start_str, end_str) * rental_fee
  end

  def quantity_on_loan
    Loan.where(book_id: id).count
  end
  
  private

  def convert_to_date(str)
    arr = str.split('-')
    return DateTime.new(arr[0].to_i, arr[1].to_i, arr[2].to_i, 23, 59, 59)
  end

end
