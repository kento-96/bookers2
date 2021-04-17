class BooksController < ApplicationController
  def new
  end

  def create
    @book=Book.new(book_params)
    @user=User.find(current_user.id)
    @books=Book.all
    @book.user_id= current_user.id
    @book.save
    redirect_to books_path

  end

  def index
    @user = User.find(current_user.id)
    @books =Book.all
    @book=Book.new
  end

  def show
   @new=Book.new
   @book=Book.find(params[:id])
   @user = User.find(current_user.id)
  end

  def edit
    @book=Book.find(params[:id])
  end

  def destroy
  end

  private
  def book_params
    params.require(:book).permit(:title,:body)
  end
end
