require 'rails_helper'

RSpec.describe "New Address form submission", type: :system do
    let(:error_message) do
        "Address is incorrect or something went wrong, try again"
    end

    before do
        driven_by(:rack_test)
    end

    after do
        VCR.eject_cassette
    end
    
    context "correct address" do
        before do
            VCR.insert_cassette "system_test_address_correct"
        end

        it "enables me to create addresses" do
            visit "/"
    
            fill_in "Street Address", :with => "630 Chestnut Street"
            fill_in "City", :with => "San Francisco"
            fill_in "Zip", :with => "94133"
            fill_in "State", :with => "CA"
    
    
            click_button "Save"
    
            expect(page).to have_text("630 Chestnut Street")
        end
    end


    context 'false address' do
        before do
            VCR.insert_cassette "system_test_address_failure"
        end

        it "Shows flash error" do
            visit "/"
    
            fill_in "Street Address", :with => "630 Chestnut Street"
            fill_in "City", :with => "Can Francisco"
            fill_in "Zip", :with => "94133"
            fill_in "State", :with => "CA"
    
    
            click_button "Save"
    
            expect(page).to have_text(error_message)
        end
    end    
end
