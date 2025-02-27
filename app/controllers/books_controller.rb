class BooksController < ApplicationController
  def index
    @user = current_user
    @booknew = Book.new

    @books = Book.all
  end

  def create
    @booknew = Book.new(book_params)
    @booknew.user_id = current_user.id
    if @booknew.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@booknew[:id])
    else
      @user = current_user
      @books = Book.all
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user

    @booknew = Book.new
  end

  def edit
    book = Book.find(params[:id])
    unless book.user.id == current_user.id
      redirect_to books_path
    end
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    unless book.user.id == current_user.id
      redirect_to books_path
    end

    @book = Book.find(params[:id])
      if  @book.update(book_params)
        flash[:notice] = "You have updated book successfully."
        redirect_to book_path(@book.id)
     else
     render :edit
     end
  end

  def destroy
    book = Book.find(params[:id])
    unless book.user.id == current_user.id
      redirect_to books_path
    end

    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end



  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
