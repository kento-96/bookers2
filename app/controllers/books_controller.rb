class BooksController < ApplicationController
  def new
  end

  def create
    @book=Book.new(book_params)

  end

  def index
    @user = User.find(current_user.id)
    @books =Book.all
    @book=Book.new
  end

  def show
    @book=Book.find(params[:id])

    @user=User.find_by(id:@book.user_id)
  end

  def edit
    @book=book.find(params[:id])
  end

  def destroy
  end

  private
  def book_params
    params.require(:book).permit(:title,:body)
  end
end
