class BooksController < ApplicationController
  def index
  	  @books = Book.all
  	  @post = Book.new
  end

  def show
  	  @book = Book.find(params[:id])
  end

  def edit
  	  @book = Book.find(params[:id])
  end

  def create
  	  book = Book.new(book_params)
  	  if book.save
    	  redirect_to book_path(book)
    	  flash[:created] = "感想を投稿しました"
      else
        redirect_to books_path(book)
        flash[:failed] = "タイトルと本文を入力してください"
      end
  end

  def update
      book = Book.find(params[:id])
      book.update(book_params)
      redirect_to book_path(book)
      flash[:updated] = "投稿を編集しました"
  end

  def destroy
  	  book = Book.find(params[:id])
  	  book.destroy
  	  redirect_to books_path
  	  flash[:destroyed] = "投稿を削除しました"
  end

  private

  def book_params
  	  params.require(:book).permit(:title, :body)
  end
end
