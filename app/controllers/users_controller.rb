class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    
    @books  = @user.books
    @booknew = Book.new
  end

  def edit
  end
end
