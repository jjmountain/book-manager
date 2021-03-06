class Api::V1::BooksController < ApplicationController

  def index
    @books = Book.all
    render json: @books
  end

  def show
    @book = Book.find(params[:id])
    render json: @book
  end

  def income
    @book = Book.find(params[:id])
    start_date = params[:start_date]
    end_date = params[:end_date]
    times_rented = @book.times_rented(start_date, end_date)
    income = @book.income(start_date, end_date)
      render json: {
        id: @book.id,
        title: @book.title,
        author: @book.author,
        start_date: start_date,
        end_date: end_date,
        rental_fee: @book.rental_fee,
        times_rented: times_rented,
        income: income,
      }
  end
end