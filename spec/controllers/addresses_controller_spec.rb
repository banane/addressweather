require 'rails_helper'

RSpec.describe AddressesController, type: :request do

   describe '#index' do    
    let!(:address) { create(:address) }

    it "shows form input and existing addresses" do
      get "/"
      expect(response.status).to eq(200)
    end
  end


  describe '#show' do
    let!(:address) { create(:address) }
    let(:weather) { create(:weather, address: address) }

    it "shows address info and weather info" do
      get "/addresses/#{address.id}"
      expect(response.status).to eq(200)
    end   
  end

  describe '#update_weather' do
    before { VCR.insert_cassette "update_weather" }
    after { VCR.eject_cassette }

    let!(:address) do
       create(:address, longitude: -122.41450776538997, latitude: 37.80384375)
    end

    let!(:weather) { create(:weather, address: address) }

    it "adds another weather update to address" do
      get "/addresses/#{address.id}/update_weather"
      expect(response.status).to eq(200)
      expect(address.reload.weather.size).to eq(2)
    end   
  end
end 
