class Weather < ApplicationRecord
    belongs_to :address

    def created_at_formatted
        created_at.in_time_zone("Pacific Time (US & Canada)").strftime("%b %d, %Y %I:%M:%S %p %Z")
    end    
end
