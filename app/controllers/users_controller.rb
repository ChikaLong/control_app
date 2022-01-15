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
      redirect_to user_path(@user), notice: "ようこそ"
    else
      render :new
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:notice] = "ご利用ありがとうございました"
    redirect_to root_path
  end

  def confirm
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
