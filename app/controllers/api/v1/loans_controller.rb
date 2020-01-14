class Api::V1::LoansController < ApplicationController 
  before_action :set_loan, only: [ :show, :update ]

  def show
    render json: @loan
  end

  def create
    @book = Book.find(loan_params[:book_id])
    @user = User.find(loan_params[:user_id])
    @loan = Loan.new(loan_params)      
    if @loan.save
      render json: { status: 'success', message: 'created a loan', data: { loan: @loan, user: @user, book: @book } }
    else
      render json: { status: 'error', message: "loan couldn't be created", data: @loan.errors }
    end
  end

  def return
    @loan = Loan.where(book_id: loan_params[:book_id], user_id: loan_params[:user_id]).last
    if @loan.update(loan_params)
      render json: { status: 'success', message: "Book was returned", data: @loan }
    else
      render json: { status: 'error', message: "Book couldn't be returned", data: @loan.errors }
    end
  end

  private

  def set_loan
    @loan = Loan.find(params[:id])
  end

  def loan_params 
    params.require(:loan).permit(:user_id, :book_id)
  end

  def render_error
    render json: { errors: @loan.errors.full_messages },
      status: :unprocessable_entity
  end

end