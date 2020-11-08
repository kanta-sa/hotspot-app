Geocoder.configure(

  # street address geocoding service (default :nominatim)
  lookup: :google,

  # IP address geocoding service (default :ipinfo_io)
  # ip_lookup: :maxmind,

  # to use an API key:
  api_key: 'AIzaSyB9BjsXAH0J8QloCXizs2999uC8OOEtywo',

  # geocoding service request timeout, in seconds (default 3):
  timeout: 5,

  # set default units to kilometers:
  units: :km
)
