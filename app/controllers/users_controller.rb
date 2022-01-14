class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @foods = Food.all
    @items = Item.few
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to user_path(@user), notice: "ユーザーを登録しました"
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
