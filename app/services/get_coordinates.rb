require 'Geocoder'

# This class gets the latitude and longitude from a human entered
# string address, via Geocoder gem.
# It returns a false result if it cannot find the address.
# It updates the address lat and long values if it does find them and 
# returns true;

class GetCoordinates < ActiveInteraction::Base
    object :address, class: 'Address'

    def execute
        get_coordinates
    end

    private
    
    def get_coordinates
        return true if address.latitude && address.longitude
        location = Geocoder.search(address.full_address)
        return false if location.nil? || location.empty?
        coords= location&.first&.coordinates
        address.update_attribute(:latitude, coords[0])
        address.update_attribute(:longitude, coords[1])
        address.save
    end
end
