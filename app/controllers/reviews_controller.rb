class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
    @review = Review.all 
  end


  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def edit
  end

  def create
    @review = Review.new(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_@review, notice: "Movie was successfully created." }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
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
  def set_review
    @review = Review.find(params[:id])
  end

end
