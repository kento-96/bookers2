class BookCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @book = Book.find(params[:book_id])
    @book_comment = @book.book_comments.new(book_comment_params)
    @book_comment.user_id = current_user.id
    @book_comment.save
    # redirect_to book_path(@book)
  end

  def destroy
    @book = Book.find(params[:book_id])
    @book_comment = BookComment.find(params[:id])
    @book_comment.destroy
    # redirect_back(fallback_location: root_path)
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
