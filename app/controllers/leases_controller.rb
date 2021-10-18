class LeasesController < ApplicationController
   rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

   def create
      lease = Lease.create(lease_params)
      render json: lease, status: :created
   end

   def destroy
      Lease.find(params[:id]).destroy
   end

   private

   def lease_params
      params.permit(:rent, :apartment_id, :tenant_id)
   end
   def render_not_found_response
      render json: { error: "Not found" }, status: :not_found
   end
end
