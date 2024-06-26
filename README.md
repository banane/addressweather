
# addressweather

# README

**Setup:**
1. This app uses [openweatherapi.com](https://openweathermap.org/current)
2. To use the app, get an API key and set a local environment variable to the key: 

`export WEATHER_API_KEY="abcdef"`

In your .zsh or terminal session.


**Information**
- This app uses Rails 7, sqlite, Rspec
- This app uses VCR gem in tests to record http calls during tests.
- This app uses the [Geocoder gem](https://github.com/alexreisner/geocoder) to detrmine latitude and longitude of each postal/mailing address.


**User Guide**
<img width="590" alt="front-page" src="https://github.com/banane/addressweather/assets/94928/1f735456-1722-4c2b-9bc3-36dd349c30d3">

1. Add street address
2. Click "Save"
3. Your new address will show on a new page with its latest weather.

OR

<img width="718" alt="show-page" src="https://github.com/banane/addressweather/assets/94928/8a2ed97a-c86a-46c3-a369-25a7124d0cd6">


1. On front page, see list of addresses at top of front page
2. Pick one, click "Update weather for address"

If your weather was pulled in the last 30 minutes for this zip code, it will have 'from cache: true' designation.

**Coding Assignment**
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

