require 'geocoder'

class Address < ApplicationRecord
    has_many :weather

    def full_address
        [street_address, city, state, zip].join(",")
    end
   
end
