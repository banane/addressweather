RSpec.describe "New Address form submission", type: :system do
    before do
        driven_by(:rack_test)
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
