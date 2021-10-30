class BooksController < ApplicationController

  def show
    @book = Book.find(params[:id])
    @user = current_user
    @book1 = Book.new
    @book_comment = BookComment.new
    @following_users = @book.user.following_user
    @follower_users = @book.user.follower_user
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
    @following_users = @user.following_user
    @follower_users = @user.follower_user
  end

  def create
    @book = Book.new(book_params)
    @user = current_user
    @books = Book.all
    @book.user_id = current_user.id
    @following_users = @user.following_user
    @follower_users = @user.follower_user
    if @book.save
    flash[:notice] = "You have created book successfully."
    redirect_to book_path(@book.id)
    else
    render :index
    end
  end

  def edit
    @user = current_user
    @book = Book.find(params[:id])
   if @book.user == current_user
     render "edit"
   else
     redirect_to books_path
   end
  end

  def update
    @user = current_user
    @book = Book.find(params[:id])
    if @book.update(book_params)
     flash[:notice] = "You have updated book successfully."
    redirect_to book_path(@book.id)
    else
    render :edit
    end
  end

  def destroy
    book =Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
