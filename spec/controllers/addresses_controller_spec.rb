require 'rails_helper'

RSpec.describe AddressesController, type: :request do
   describe 'GET /index' do    
    let!(:address) { create(:address) }

    it "shows form input and existing addresses" do
        get "/"
        expect(response).to include('address.street_address')
      end
    end   
end 
