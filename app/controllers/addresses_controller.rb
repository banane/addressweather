class AddressesController < ApplicationController
    def index
        @addresses = Address.includes(:weather).all
    end    

    def create
        @address = Address.find_by(address_params)
        if @address.nil?
            @address = Address.create(address_params)
        end        
        success = true if @address 
        success =  GetCoordinates.run!(address: @address)
        if success
            success = GetWeather.run!(address: @address)
        else
            @address.destroy
        end
        
        if @address && success
            redirect_to address_path(id: @address.id)
        else
            redirect_to root_path, alert: "Address is incorrect or something went wrong, try again."
        end
    end

    def update_weather
        @address = Address.find_by(id: params[:id])
        GetWeather.run!(address: @address)
        render :show
    end

    def show
        @address = Address.find_by(id: params[:id])        
    end

    private

    def address_params
        params.permit(:street_address, :city, :state, :zip)
    end
end
