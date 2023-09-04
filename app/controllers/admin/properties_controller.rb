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
			redirect_to admin_properties_path, notice: 'Property created successfully'
		else
			render :new
		end 
	end 

	def edit 
		@property = Property.find(params[:id])
		
		puts 'Before editing the value of current property is '  
		puts @property.inspect
		puts @property.amenity.inspect
		#@amenity = @property.amenity.inspect
	end 

	def update 
		@property = Property.find(params[:id])
		
		puts 'About to update the property values, the current values are '  
		puts @property.inspect
		puts @property.amenity.inspect
		#@amenity = @property.amenity.inspect

		if @property.update(property_params) #&& @amenity.update(amenity_params)
			redirect_to admin_property_path(@property), notice: 'Property updated successfully'
			
			puts 'The new property values are '  
			puts @property.inspect
			puts @property.amenity.inspect
		else
			render :edit
			
			puts 'The property update failed '  
			puts @property.inspect  
			puts @property.amenity.inspect
		end 
	end 

	def destroy 
		@property = Property.find(params[:id])
		@property.destroy 
		redirect_to admin_properties_path, notice: 'Property was successfully deleted'
	end 

	private 

	def property_params
		params.require(:property).permit(:title, :name, :owner, :email, :coverage, 
		amenity_attributes: [:id, :has_pool, :has_garage, :has_balcony, :has_roof, :has_terrace, :has_kitchen, :has_storage, :has_barbq, 
		:has_gym, :has_studio, :has_cinema])
	end
	
	#def amenity_params
	#	params.require(:amenity).permit(:has_pool, :has_garage, :has_balcony, :has_roof, :has_terrace, :has_kitchen, :has_storage, :has_barbq, 
	#	:has_gym, :has_studio, :has_cinema)
	#end
end
