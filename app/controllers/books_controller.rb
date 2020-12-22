class BooksController < ApplicationController
  before_action :authenticate_user!

  def new
    @book = Book.new
  end

  def create
    @newbook = Book.new(book_params)
    @newbook.user_id = current_user.id
    if @newbook.save
      redirect_to book_path(@newbook),notice: 'You have created book successfully.'
    else
      @user = current_user
      @books = Book.all
      render :index
    end
  end

  def index
    @user = current_user
    @newbook = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @newbook = Book.new
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
        render "edit"
    else
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book),notice: 'You have updated book successfully.'
    else
      #@user = @book.user
      render "edit"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
