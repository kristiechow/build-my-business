class StatusUpdatesController < ApplicationController

  def new
    @status_update = StatusUpdate.new
    @updater = User.find(params[:owner_id])
  end

  def create
    @reviewee = User.find(params[:developer_id])
     @review = @reviewee.received_reviews.build(review_params)
     if @review.save

      redirect_to developer_path(@reviewee)
    end

  end

  private

  def review_params
      params.require(:review).permit(:comment, :communication_rating, :quality_rating, :timeliness_rating, :reviewee_id).merge(reviewer_id: current_user.id, review_type: current_user.type)
  end

end