<<<<<<< HEAD
# addressweather
=======
# README

Setup:
1. uses openweatherapi - get an API key and set a local environment variable to the key: 
``` export WEATHER_API_KEY="abcdef"```
In your .zsh or terminal session.


Infomration
- Uses rails 7
- Uses VCR gem to record http calls during tests.
- Uses Geocoder gem to detrmine latitude and longitude of each postal address.


Coding Assignment
Requirements:
- Must be done in Ruby on Rails
- Accept an address as input
- Retrieve forecast data for the given address. This should include, at minimum, the
current temperature (Bonus points - Retrieve high/low and/or extended forecast)
- Display the requested forecast details to the user
- Cache the forecast details for 30 minutes for all subsequent requests by zip codes.
Display indicator if result is pulled from cache.
Assumptions:
- This project is open to interpretation
- Functionality is a priority over form
- If you get stuck, complete as much as you can
Submission:
- Use a public source code repository (GitHub, etc) to store your code
- Send us the link to your completed code

* ...
>>>>>>> 7ac3bae (First commit)
