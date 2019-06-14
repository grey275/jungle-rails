class ReviewsController < ApplicationController

  before_filter :current_user, only: [:create, :destroy]

  def create
    unless current_user
      redirect_to '/login'
      return
    end

    @review = Review.new(allowed_params)
    @review.user = current_user
    @review.product_id = params[:product_id]

    @review.save
    redirect_to :back
  end

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    redirect_to :back
  end

  private

  def allowed_params
    params.require(:review).permit(
      :rating,
      :summary,
      :content,
    )
  end
end
