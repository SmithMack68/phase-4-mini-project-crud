class SpicesController < ApplicationController

    # GET all spices
    def index
      spices = Spice.all 
      render json: spices 
    end

    # # GET one spice
    # def show
    #   spice = Spice.find_by(id: params[:id])
    #   if spice
    #     render json: spice, status: :ok 
    #   else
    #     render json: { error: "Spice not found" }, status: :not_found
    #   end
    # end

    # POST create a spice
    def create 
      spice = Spice.create(spice_params)
      render json: spice, status: :created
    end

    # PATCH /spices/:id 
    def update
      spice = Spice.find_by(id: params[:id])
      spice.update(spice_params)
      render json: spice 
    end

    # DELETE /spices/:id
    def destroy
      spice = Spice.find_by(id: params[:id])
      spice.destroy
      head :no_content
    end


    private

    def spice_params 
      params.permit(:title, :image, :description, :notes, :rating)
    end

end
