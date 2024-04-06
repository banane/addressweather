FactoryBot.define do
    factory :address do
      street_address { "690 Chestnut St" }
      state { "CA" }
      city { "San Francisco" }
      zip {"94133"}
    end
end