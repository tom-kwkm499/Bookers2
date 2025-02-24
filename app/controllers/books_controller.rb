class BooksController < ApplicationController
  def index
    @user = current_user
    @booknew = Book.new

    @books = Book.all
  end

  def create
    @booknew = Book.new(book_params)
    @booknew.user_id = current_user.id
    @booknew.save
    redirect_to book_path(@booknew[:id])
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user

    @booknew = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
      if  @book.update(book_params)
        flash[:notice] = "Book was successfully updated."
        redirect_to book_path(@book.id)
     else
        render :edit
     end
   end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end



  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
