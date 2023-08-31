class Admin::PropertiesController < ApplicationController
	before_action :authenticate_admin!

	def index 
		@properties = Property.all 
	end 

	def new
		@property = Property.new 
		@property.build_amenity 
	end 

	def create
		@property = Property.new(property_params)
		if @property.save 
			redirect_to admin_properties_path, notice: 'Property was successfully saved'
		else
			render :new
		end 
	end 

	def edit 
		@property = Property.find(params[:id])
	end 

	def update 
		@property = Property.find(params[:id])
		if @property.update(property_params)
			redirect_to admin_properties_path, notice: 'Property was successfully updated'
		else
			render :edit 
		end 
	end 

	def destroy 
		@property = Property.find(params[:id])
		@property.destroy 
		redirect_to admin_properties_path, notice: 'Property was successfully deleted'
	end 

	private 

	def property_params
		params.require(:property).permit(:title, :name, :owner, :email, :coverage, amenity_attributes: [:has_pool, :has_garage, :has_balcony, :has_roof, :has_terrace, :has_kitchen, :has_storage, :has_barbq, :has_gym, :has_studio, :has_cinema])
	end 
end
