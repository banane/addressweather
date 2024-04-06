class AddressesController < ApplicationController
    def index
        @addresses = Address.all
    end    

    def create
        @address = Address.create(weatherparams)
    end

    private

    def weatherparams
        params.permit(:weather)
    end
end
