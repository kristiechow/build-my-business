class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @reviewee = User.find(params[:developer_id])
  end

  def create
    @reviewee = User.find(params[:developer_id])
     @review = @reviewee.reviews.build(review_params)
     if @review.save
    binding.pry

      redirect_to developer_path(@reviewee)
    end

  end




  private

  def review_params
      params.require(:review).permit(:content, :communication_rating, :quality_rating, :timeliness_rating, :reviewee_id).merge(reviewer_id: current_user.id)
  end

end