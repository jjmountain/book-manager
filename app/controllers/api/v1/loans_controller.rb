class Api::V1::LoansController < ApplicationController 
  before_action :set_loan, only: [ :show, :update ]

  def show
    render json: {
      id: @loan.id,
      book: @loan.book,
      user: @loan.user,
      due_date: @loan.due_date,
      returned: @loan.returned?,
      return_date: @loan.date_returned
    }
  end

  def create
    ## check to see if there are books available to loan and the user has enough money
    @book = Book.find(loan_params[:book_id])
    @user = User.find(loan_params[:user_id])
    @loan = Loan.new(loan_params)

    if @book.book_available?
      
      if @loan.save
        render json: { status: 'SUCCESS', message: 'created a loan', data: [@loan, @book] }
      else
        render json: { status: 'ERROR', message: "loan couldn't be created", data: @loan.errors }
      end
    else
      render json: { status: 'ERROR', message: "loan couldn't be created", data: @loan.errors }
    end
  end

  def update
    if @loan.update(return_params)
      render json: { status: 'SUCCESS', message: "Book was returned", data: @loan }
    else
      render json: { status: 'ERROR', message: "Book couldn't be returned", data: @loan.errors }
    end
  end

  private

  def set_loan
    @loan = Loan.find(params[:id])
  end

  def loan_params 
    params.require(:loan).permit(:user_id, :book_id)
  end

  def return_params
    params.require(:loan).permit(:user_id, :book_id, :date_returned)
  end

  def render_error
    render json: { errors: @loan.errors.full_messages },
      status: :unprocessable_entity
  end

end