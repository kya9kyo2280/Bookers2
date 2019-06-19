class BooksController < ApplicationController

    def new
    	@book = Book.new
    end

    def create
    	@book = Book.new(book_params)
        @book.user_id = current_user.id
        @book.save
        if @book.save
        flash[:notice] = "You have creatad book successfully"
        redirect_to book_path (@book.id)
        else
        flash[:notice] = "errors prohibited this obj from being saved"
        redirect_to books_path
        end
    end

    def index
        @books = Book.all
        @book = Book.new
        @user = User.find(current_user.id)
    end

    def show
        @book = Book.find(params[:id])
        @newbook = Book.new
        @user = User.find(current_user.id)
    end

    def edit
        @book = Book.find(params[:id])
    end

    def update
        book = Book.find(params[:id])
        book.update(book_params)
        if book.update(book_params)
        flash[:notice] = "You have updated book successfully."
        end
        redirect_to book_path(book.id)
    end

    def destroy
        book = Book.find(params[:id])
        book.destroy
        redirect_to books_path
    end


end

private
    def book_params
        params.require(:book).permit(:title, :body)
    end
