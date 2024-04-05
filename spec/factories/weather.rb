FactoryBot.define do
    factory :weather do
      description { "Sunny no clouds" }
      humidity { 55 }
      temperature_f { 44 }
      visibility { 10000 }
    end
end