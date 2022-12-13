class SpicesController < ApplicationController

  def index
    spices = Spice.all
    render json: spices, status: :ok
  end

  def create 
    new_spice = Spice.create(spice_params)
    
    render json: new_spice, status: :created
  end

  def update
    update_spice = Spice.find_by(id: params[:id])
    if update_spice
      update_spice.update(spice_params)
      render json: update_spice
    else
      render json: {error: "not found"}, status: :not_found
    end
  end

  def destroy 
    destroy_spice = Spice.find_by(id: params[:id])
    if destroy_spice
      destroy_spice.destroy
      head :no_content
    else
      render json: {error: "not found"}, status: :not_found
    end
  end

  private 

  def spice_params
    params.permit(:title, :image, :description, :notes, :rating)
  end



end
