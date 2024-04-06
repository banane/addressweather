require 'rails_helper'
require 'geocoder'

RSpec.describe GetWeather do  
 subject { described_class.run!(address: address) }

 let(:address) { create(:address, latitude: 37.791812, longitude: -122.394757) }
 let(:weather) do
     create(:weather, 
        address: address, 
        description: description,
        temperature_f: temperature,
        humidity: humidity,
        visibility: visibility
     ) 
 end

 let(:description) { "few clouds"}
 let(:temperature) { 57.27 }
 let(:humidity) { 55.0 }
 let(:visibility) { 10000 }
 let(:full_address) { address.full_address }

 before do  
    VCR.insert_cassette "weather_call"
    Rails.cache.clear
 end

 after do
    VCR.eject_cassette
    Rails.cache.clear
 end

 it "returns address weather" do
    subject
    weather_0 = address.reload.weather.last
    expect(weather_0.description).to eq(description)
    expect(weather_0.temperature_f).to eq(temperature)
    expect(weather_0.humidity).to eq(humidity)
    expect(weather_0.visibility).to eq(visibility)
 end

   
end
 
