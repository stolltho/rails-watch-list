class ReviewsController < ApplicationController
  before_action :set_review, only: %i[destroy]
  before_action :set_list, only: %i[create]

  def create
    @review = Review.new(review_params)
    @review.list = @list
    if @review.save
      redirect_to list_path(@list)
    else
      @bookmarks = @list.bookmarks
      @bookmark = Bookmark.new
      render "lists/show", status: :unprocessable_entity
    end
  end

  def destroy
    @review.destroy
    redirect_to list_path(@review.list), status: :see_other
  end


  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:comment, :rating)
  end

end
