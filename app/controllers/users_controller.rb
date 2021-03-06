class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    @user = User.new(user_params)
    if @user.save
      token = encode_token({user_id: @user.id})
      render json: { user: UserSerializer.new(@user), jwt: token }, status: :created
    else
      render json: { message: @user.errors.full_messages}, status: 409
    end
  end

  def profile
    render json: {user: UserSerializer.new(current_user)}
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :name)
  end
end
