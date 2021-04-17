class BooksController < ApplicationController
 before_action :authenticate_user!

 before_action :current_user,only:[:edit,:update]
  def new
  end

  def create
    @book=Book.new(book_params)
    @user=User.find(current_user.id)
    @books=Book.all
    @book.user_id= current_user.id
   if @book.save
     flash[:notice] ="Book was successfully created."
     redirect_to book_path(@book.id)
   else
     render:index
   end

  end

  def index
    @user = User.find(current_user.id)
    @books =Book.all
    @book=Book.new
  end

  def show
   @new=Book.new
   @book=Book.find(params[:id])
   @user = User.find(@book.user_id)
  end

  def edit
    @book=Book.find(params[:id])
    if @book.user == current_user
      render"edit"
    else
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       flash[:notice] = 'Book was successfully  updated.'
       redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    @book=Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title,:body)
  end
end
