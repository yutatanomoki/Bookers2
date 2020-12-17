class UsersController < ApplicationController
  
  def index
    @users = User.all
  end
  
  
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.all
  end
  
  def edit
    @user = User.find(params[:id])
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
    

  private

  def user_params
    params.require(:user).permit(:name, :introduction)
  end

end
