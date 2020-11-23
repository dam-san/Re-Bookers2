class BooksController < ApplicationController

  def index
    @books=Book.all
    
  end
  
  def show
    @book=Book.find(params[:id])
  end
  
  
  def create
    @book=Book.new(book_params)
    @book.user_id=current_user.id
    
    if @book.save
      redirect_to "book_path(@book.id)"
    else
      # render 
    end
  end
    
    
  def update
    @book=Book.find(params[:id])
    
    if @book.update
      redirect_to "book_path(@book.id)"
    else
      
    end  
    
  end
  
  
  
  
  private

  def book_params
  params.require(:book).permit(:title, :body)
  end

  
end
