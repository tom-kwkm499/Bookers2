class BooksController < ApplicationController
  def index
    
  end

  def create
    @booknew = Book.new(book_params)
    @booknew.user_id = current_user.id
    @booknew.save
    redirect_to book_path(@booknew[:id])
  end

  def show
  end

  def edit
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
