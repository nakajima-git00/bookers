class BooksController < ApplicationController
  def index
    @books = Book.all.order(id: "ASC")
    @book = Book.new
  end

  def create
    book = Book.new(book_params)

    if book.save
      flash[:success] = "Book Was successfully Created!"
      redirect_to book_path(book)
    else
      @books = Book.all.order(id: "ASC")
      @book = book
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])

    if book.update(book_params)
      flash[:success] = "Book Was successfully Updated!"
      redirect_to book_path(book)
    else
      @book = book
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:success] = "Book Was successfully Destroyed!"
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
