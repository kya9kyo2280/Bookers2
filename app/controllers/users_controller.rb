class UsersController < ApplicationController

before_action :authenticate_user!

  def show
  	    @user = User.find(params[:id])
        @books = @user.books
        @newbook = Book.new
  end

  def edit
   @user = User.find(params[:id])
   if @user.id != current_user.id
       redirect_to user_path(@current_user.id)

   end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] = "You have updated user successfully"
    redirect_to user_path(@user.id)
    else flash[:notice] = "1 error prohibited this obj from being saved:"
    @user = User.find(params[:id])
    render :edit
    end
  end

 def index
   @users = User.all
   @newbook = Book.new
   @user = User.find(current_user.id)

 end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  end
