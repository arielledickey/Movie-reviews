class ReviewsController < ApplicationController
  before_filter :authorize
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
    @review = Review.all
  end

  def show
    # @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def edit
  end

  def create
    @review = Review.new(review_params)
    @review.save
    redirect_to @article


      if @review.save
    redirect_to @review
      else
    render 'new'
      end
  end

  def update
    respond_to do |format|
      if @review.update(movie_params)
        format.html { redirect_to @movie, notice: "Movie was successfully updated." }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :uncessable_entity }
      end
    end
  end

  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: "Review was successfully destroyed." }
    end
  end

  private
  def review_params
    params.require(:review).permit(:title, :text)
  end

  def set_review
    @review = Review.find(review_params)
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end





end

