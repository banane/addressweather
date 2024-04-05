class AddressesController < ApplicationController
    def index
        @addresses = Address.includes(:weather).all
    end    

    def create
        @address = Address.create(weatherparams)
        @weather = GetWeather.new(address: address)
    end

    def show
        @address = Address.find_by(weather_params)        
    end

    private

    def weatherparams
        params.permit(:weather)
    end
end
