class UsersController < ApplicationController
  before_action :authenticate_user, except:[:new, :create]

  def show
    @user = User.find(current_user.id)
    @foods = @user.foods
    @items = @user.items.few
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

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "ユーザー情報を更新しました"
    else
      render :edit
    end
  end

  def destroy
    User.find(current_user.id).destroy
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
