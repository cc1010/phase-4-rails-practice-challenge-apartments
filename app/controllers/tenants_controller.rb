class TenantsController < ApplicationController
   rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
   def index
      tenants = Tenant.all
      render json: tenants
   end

   def show
      tenant = Tenant.find(params[:id])
      render json: tenant
   end

   def create
      tenant = Tenant.create(tenant_params)
      render json: tenant, status: :created
   end

   def update
      tenant = Tenant.find(params[:id])
      tenant.update(tenant_params)
      render json: tenant, status: :ok
   end

   def destroy
      tenant = Tenant.find(params[:id])
      tenant.destroy
   end

   private

   def tenant_params
      params.permit(:name, :age)
   end
   def render_not_found_response
      render json: { error: "Not found" }, status: :not_found
   end
end
