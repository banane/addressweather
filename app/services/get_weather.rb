# This class/service
# get weather from openweathermap API
# First, put your api key in an env var called WEATHER_API_KEY

require 'net/http'

class GetWeather < ActiveInteraction::Base
    object :address, class: 'Address'

    def execute
        get_weather
    end

    private

    def get_weather
        uri = "https://api.openweathermap.org/data/2.5/weather?units=imperial&lat="
        uri += address.latitude.to_s + "&lon=" + address.longitude.to_s
        uri += "&appid="+ ENV["WEATHER_API_KEY"]
        res = Net::HTTP.get_response(URI.parse(uri))
        json_resp =  res.body if res.is_a?(Net::HTTPSuccess)
        weatherJson = JSON.parse(json_resp)

        # store response
        weather = Weather.new
        weather.address = address
        weather.description = weatherJson["weather"][0]["description"]
        weather.temperature_f = weatherJson["main"]["temp"]
        weather.humidity = weatherJson["main"]["humidity"]
        weather.visibility = weatherJson["visibility"]
        weather.save
    end
end
