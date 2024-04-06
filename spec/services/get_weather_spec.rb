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
 let(:temperature) { 56.26 }
 let(:humidity) { 57.0 }
 let(:visibility) { 10000 }
 let(:full_address) { address.full_address }

 before do  
    VCR.insert_cassette "weather_call"
 end

 after do
    VCR.eject_cassette
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
 
