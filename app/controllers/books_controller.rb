class BooksController < ApplicationController

	#ログインしないとどのページにも飛べないコード
   before_action :authenticate_user!, only: [:index, :show, :edit]

  def top
  end

  def index
  	@book = Book.new
  	@books = Book.all
  end

  def show
    @book_s = Book.new
  	@book = Book.find(params[:id])

  end

  def new
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user_id == current_user.id
    else
      redirect_to books_path(@book)
    end
    # if @book.edit
    # else redirect_to edit_book_path(@book)
    # end
  end

  # def create
  #    @book = Book.new(book_params)
     # @book.user_id = current_user.id
  #    @book.save
  #    redirect_to book_path(@book)
  #  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = 'Bookers2 was successfully created.'
      redirect_to book_path(@book)
    else
      @books = Book.all
      render 'index'
    end
  end

  # def update
  #   book = Book.find(params[:id])
  #   book.update(book_params)
  #   redirect_to book_path(book)
  # end

  def update
      @book = Book.find(params[:id])
      if @book.update(book_params)
      flash[:notice] = 'Bookers2 was successfully created.'
      redirect_to book_path(book.id)
    else
      render 'edit'
    end
  end

  def destroy
    book = Book.find(params[:id])
        book.destroy
        redirect_to books_path
  end

	private

    def user_params
        params.require(:user).permit(:caption, :image, :name)
    end

    def book_params
        params.require(:book).permit(:book_title, :book_body)
    end



end
