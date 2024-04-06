class AddressesController < ApplicationController
    def index
        @addresses = Address.includes(:weather).all
    end    

    def create
        @address = Address.find_or_create(address_params)
        GetWeather.run!(address: @address)

        render :show
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
