class BooksController < ApplicationController
    before_action :authenticate_user!
    def new
    	@book = Book.new
        @book = current_user.books.build
    end

    def create
    	@book = Book.new(book_params)
        @book.user_id = current_user.id
        @book.save
        if @book.save
        flash[:notice] = "You have creatad book successfully."
        redirect_to book_path (@book.id)
        else
        flash[:notice] = "errors prohibited this obj from being saved."
        redirect_to books_path
        end
        @book = current_user.books.build(book_params)
    end

    def index
        @books = Book.all
        @book = Book.new
        @user = User.find(current_user.id)
        if @user.id != current_user.id
       redirect_to new_user_session_path
        end
    end

    def show
        @book = Book.find(params[:id])
        @newbook = Book.new
        @user = User.find(current_user.id)
        if @user.id != current_user.id
        redirect_to new_user_session_path
        end
    end

    def edit
        @book = Book.find(params[:id])
       

    end

    def update
        book = Book.find(params[:id])
        book.update(book_params)
        if book.update(book_params)
        flash[:notice] = "You have updated book successfully."
        redirect_to book_path(book.id)
        else
        flash[:notice] = "errors prohibited this obj from being saved."
        @book = Book.find(params[:id])
        render :edit
        end

    end

    def destroy
        book = Book.find(params[:id])
        book.destroy
        redirect_to books_path
    end

    def correct_user
      @book = current_user.books.find_by(id: params[:id])
      unless @book
      redirect_to books_path
      end
    end

    before_action :correct_user, only: [:edit, :update]

    def ensure_correct_user
       @book = Book.find_by(id: params[:id])
       if @current_user.id != @post.user_id
       redirect_to  books_path
  end
end



end

private
    def book_params
        params.require(:book).permit(:title, :body)
    end
