class UsersController < ApplicationController
before_action :correct_user, only: [:edit, :update]

  def show
    @user1 = User.find(params[:id])
    @books = @user1.books
    @user = current_user
    @book =Book.new
    @following_users = @user1.following_user
    @follower_users = @user1.follower_user
  end

  def index
    @users = User.all.order(updated_at: :desc)
    @book = Book.new
    @user = current_user
    @following_users = @user.following_user
    @follower_users = @user.follower_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
   @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id)
    else
    render :edit
    end
  end

  def follows
   user = User.find(params[:id])
   @user = current_user
   @users = user.following_user
  end

  def followers
   user = User.find(params[:id])
   @user = current_user
   @users = user.follower_user
  end



 private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def correct_user

    user = User.find(params[:id])
    if current_user != user
      redirect_to user_path(current_user.id)
    end
  end


end