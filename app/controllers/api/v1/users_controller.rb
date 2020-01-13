class Api::V1::UsersController < ApplicationController 
  before_action :set_user, only: [ :show ]

  def show
    render json: {
      id: @user.id,
      name: @user.full_name,
      balance: @user.balance,
      loans: @user.loans
    }
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: { status: 'SUCCESS', message: 'Created a user', data: @user }
    else
      render json: { status: 'ERROR', message: "User not created", data: @user.errors }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params 
    params.require(:user).permit(:balance)
  end

  def render_error
    render json: { errors: @user.errors.full_messages },
      status: :unprocessable_entity
  end

end