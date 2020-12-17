class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book),notice: 'You have created book successfully.'
    else
      @user = @book.user
      @books = Book.all
      render :index
    end
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end
  
  def edit
    @user = User.find(params[:id])
    if @book.save
      redirect_to book_path(@book),notice: 'You have updated book successfully.'
    else
      
      render :edit
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id)  
    
    else
      #@user = @book.user
      render "edit"
    end
  end

  def destroy
    
  end

  # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:book_name, :body)
  end
end
