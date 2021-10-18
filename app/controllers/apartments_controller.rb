class ApartmentsController < ApplicationController
   rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

   def index
      apartments = Apartment.all
      render json: apartments
   end

   def show
      apartment = Apartment.find(params[:id])
      render json: apartment
   end
   
   def create
      apartment = Apartment.create(apartment_params)
      render json: apartment, status: :created
   end

   def update
      apartment = Apartment.find(params[:id])
      apartment.update(apartment_params)
      render json: apartment, status: :ok
   end

   def destroy
      apartment = Apartment.find(params[:id])
      apartment.destroy
   end
   

   private
   def apartment_params
      params.permit(:number)
   end
   def render_not_found_response
      render json: { error: "Not found" }, status: :not_found
   end
end
