class RealEstatesController < ApplicationController
  before_action :set_real_estate, only: [:show, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]


  # GET /real_estates
  def index
    @real_estates = RealEstate.all

    render json: @real_estates.with_attached_images.order(id: :desc)
  end

  # GET /real_estates/1
  def show
    render json: @real_estate
  end

  # POST /real_estates
  def create
    @real_estate = RealEstate.new()
    @real_estate.title = params[:title]
    @real_estate.address = params[:address]
    @real_estate.description = params[:description]
    @real_estate.category = Category.find_by(params[:category])
    @real_estate.price = params[:price]
    @real_estate.location = params[:location]
    @real_estate.user = User.find(current_user.id)
    if params[:image1]
      @real_estate.images.attach(io: File.open(params[:image1]), filename: params[:image1].original_filename)
    end
    if params[:image2]
      @real_estate.images.attach(io: File.open(params[:image2]), filename: params[:image2].original_filename)
    end
    if params[:image3]
      @real_estate.images.attach(io: File.open(params[:image3]), filename: params[:image3].original_filename)
    end

    if @real_estate.save
      render json: @real_estate, status: :created
    else
      render json: @real_estate.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /real_estates/1
  def update
    if @real_estate.update(real_estate_params)
      render json: @real_estate
    else
      render json: @real_estate.errors, status: :unprocessable_entity
    end
  end

  # DELETE /real_estates/1
  def destroy
    @real_estate.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_real_estate
      @real_estate = RealEstate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def real_estate_params
      params.permit(:title, :description, :location, :address, :price, :category, :image1, :image2, :image3)
    end

end
