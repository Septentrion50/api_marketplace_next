class Api::RealEstatesController < ApplicationController
  before_action :authenticate_user!

  # GET /real_estates
  def index
    @real_estates = RealEstate.all.where(user: params[:user_id])

    render json: @real_estates
  end

end