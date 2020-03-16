# Controller for reviews
class ReviewsController < ApplicationController
  include Pagy::Backend
  before_action :set_review, only: %i[show edit destroy update]
  before_action :set_book
  before_action :authenticate_user!, except: [:index]

  def index
    @pagy, @reviews = pagy(@book.reviews, items: 5)



    respond_to do |format|
			format.json do
        reviews = @book.reviews.all
        render(json: reviews, status: :ok)
      end			
		end
  end


  def new
    @review = Review.new
  end

  def edit; end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.book = @book
    if @review.save
      redirect_to @book, notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  def update
    if @review.update(review_params)
      redirect_to @book, notice: 'Review was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to reviews_url, notice: 'Review was successfully destroyed.'
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def set_book
    @book = Book.find(params[:book_id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
  
end