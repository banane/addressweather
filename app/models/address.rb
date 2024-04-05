require 'geocoder'

class Address < ApplicationRecord
    has_many :weather

    def full_address
        [street_address, city, state, zip].join(",")
    end
    
    def get_coordinates
        return if latitude && longitude
        location = Geocoder.search(full_address)

        coords= location.first.coordinates
        puts coords
        self.update_attribute(latitude, coords[0])
        self.update_attribute(longitude, coords[1])
        self.save
    end
end
