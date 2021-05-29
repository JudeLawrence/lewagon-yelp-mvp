class AnswersController < ApplicationController

  def new
    @review = Review.find(params[:review_id])
    @answer = Answer.new
  end

  def create
    @review = Review.find(params[:review_id])
    @restaurant = Restaurant.find(@review.restaurant_id)
    @answer = Answer.new(answer_params)
    @answer.review = @review
    if @answer.save
      redirect_to @restaurant
    else
      render :new
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to @answer.review.restaurant
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end

end
