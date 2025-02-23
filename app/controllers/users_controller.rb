class UsersController < ApplicationController
  def index
  end

  def show
    @books  = Book.all
    @booknew = Book.new
  end

  def edit
  end
end
