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

 let(:description) { "light rain"}
 let(:temperature) { 55.13 }
 let(:humidity) { 62 }
 let(:visibility) { 10000 }
 let(:full_address) { address.full_address }

 before do  
    VCR.insert_cassette "weather_call"
 end

 after do
    VCR.eject_cassette
 end


 it "returns address coordinates" do
    subject
    weather_0 = address.reload.weather.last
    expect(weather_0.description).to eq(description)
    expect(weather_0.temperature_f).to eq(temperature)
    expect(weather_0.humidity).to eq(humidity)
    expect(weather_0.visibility).to eq(visibility)
 end

 context "address has coordinates" do
    let(:address) { create(:address, latitude: 37.791812, longitude:  -122.394757)}

    it "does not call geocoder" do
        allow(Geocoder).to receive(:search)
        subject
        expect(Geocoder).not_to have_received(:search)
    end
 end

 context "address is incorrect" do
    let(:address) do
        create(:address, city: "Can Francisco")
    end

    it { is_expected.to be_falsey }
  end
end
 
