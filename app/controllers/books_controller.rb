class BooksController < ApplicationController
  before_action :find_book, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  before_action :authorize_user!, only:[:edit, :update, :destroy]
  def index
    @books = Book.order(created_at: :desc)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user
    if @book.save
      flash.notice = "book created successfully!"
      redirect_to book_path(@book.id)
    else
      render :new, status: 303
    end
  end
  

  def show 
    @book = Book.find params[:id]
    @review = Review.new
    @reviews = @book.reviews

  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to book_path(@book.id)
    else
      render :edit, status: 303
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  private

  def authorize_user!
    redirect_to root_path, alert: "Not authorized" unless can?(:crud, @book)
  end

  def find_book
    @book = Book.find params[:id]
  end


  def book_params
    params.require(:book).permit(:title, :image_url, :introduction, :genre)
  end
end
