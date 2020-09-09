class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  def index
  	@book = Book.new
  	@books = Book.all
  	@user = current_user
  end

  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
  	@user = current_user
  end

  def edit

  end

  def create
  	@book = Book.new(book_params)
  	@book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def destroy

   @book.destroy
   redirect_to books_path
  end

def update

    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      render "edit"
    end

end

    private
    def book_params
       params.require(:book).permit(:title,:body)
    end


    def ensure_correct_user
    @book = Book.find(params[:id])
    unless @book.user == current_user
      redirect_to books_path
    end
  end
end

