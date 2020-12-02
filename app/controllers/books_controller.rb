class BooksController < ApplicationController
  def top
  end
  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @books = Book.all
    @book = Book.find(params[:id])
  end

  def new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book), notice: "Book was successfully created."
    else
      @books = Book.all
      render :index, notice: "errors prohibited this book from being saved:"
    end
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book), notice: "Book was successfully updated."
    else
      render :edit
    end
  end
  
  def destroy
    @book = Book.find(params[:id])  
    @book.destroy
    flash[:notice] = "Book was successfully destroy"
    logger.debug(flash[:notice])
    redirect_to books_path
  end

   private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end