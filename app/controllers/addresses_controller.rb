class AddressesController < ApplicationController
    def index
        @addresses = Address.includes(:weather).all
    end    

    def create
        @address = Address.find_by(address_params)
        if @address.nil?
            # binding.pry
            @address = Address.create(address_params)
        end
        GetWeather.run!(address: @address)

        render :show
    end

    def show
        @address = Address.find_by(params)        
    end

    private

    def address_params
        # binding.pry
        params.permit(:street_address, :city, :state, :zip)
    end

    
end
