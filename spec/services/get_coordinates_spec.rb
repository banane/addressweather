require 'rails_helper'
require 'geocoder'

RSpec.describe GetCoordinates do  
    subject { described_class.run!(address: address) }

    let(:address) { create(:address) }
    let(:full_address) { address.full_address }

    after do
        VCR.eject_cassette
    end

    context "has valid address" do
        before { VCR.insert_cassette "geocoder_call" }

        it "returns address coordinates" do
            subject
        end
    end

    context "address has coordinates" do
        let(:address) { create(:address, latitude: 37.791812, longitude:  -122.394757)}

        it "does not call geocoder gem/service" do
            allow(Geocoder).to receive(:search)
            subject
            expect(Geocoder).not_to have_received(:search)
        end
    end

    context "address is incorrect" do
        before { VCR.insert_cassette "geocoder_call_wrong" }
        let(:address) do
            create(:address, city: "Can Francisco")
        end

        it { is_expected.to be_falsey }
    end
end
 
