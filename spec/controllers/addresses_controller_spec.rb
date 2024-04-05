require 'rails_helper'

RSpec.describe AddressesController, type: :request do
   describe 'GET /index' do    
    let(:address) { create(:address, weather: weather) }
    let(:weather) { create(:weather) }

    it "is main page and returns weather" do
        get "/"
        expect(response).to include('light rain')
        
      end
    end    
end 