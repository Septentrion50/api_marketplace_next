class RealEstatesController < ApplicationController
  before_action :set_real_estate, only: [:show, :update, :destroy]
  before_action :authenticate_user!, except: [:index]


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
    @real_estate = RealEstate.new(real_estate_params)
    @real_estate.user = User.find(current_user.id)
    @real_estate.category = Category.find_by(title: params[:category])
    params[:images].each_with_index do |image, index|
      @real_estate.images.attach(io: File.open(image), filename: "#{@real_estate.title}_image#{index}")
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
      params.require(:real_estate).permit(:title, :description, :location, :address, :price, :category, images: [])
    end

end
