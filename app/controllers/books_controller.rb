class BooksController < ApplicationController
  def index
  	  @books = Book.all
  	  @post = Book.new
  end

  def show
  	  @book = Book.find(params[:id])
  end

  def new
  	  @book = Book.new
  end

  def edit
  	  @book = Book.find(params[:id])
  end

  def create
  	  book = Book.new(book_params)
  	  book.save
  	  redirect_to book_path(book)
  	  flash[:created] = "Book was successfully created."
  end

  def update
      book = Book.find(params[:id])
      book.update(book_params)
      redirect_to book_path(book)
      flash[:updated] = "Book was successfully updated.

"
  end

  def destroy
  	  book = Book.find(params[:id])
  	  book.destroy
  	  redirect_to books_path
  	  flash[:destroyed] = "Book was successfully destroyed.

"
  end

  private

  def book_params
  	  params.require(:book).permit(:title, :body)
  end
end