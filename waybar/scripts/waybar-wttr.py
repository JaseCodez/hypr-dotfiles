#!/usr/bin/env python

import json
import requests
from datetime import datetime
from environs import env

WEATHER_CODES = {
    1: "☀️ ",    # Sunny
    2: "🌞 ",    # Mostly Sunny
    3: "⛅ ",    # Partly Sunny
    4: "🌥️ ",    # Intermittent Clouds
    5: "🌤️ ",    # Hazy Sunshine
    6: "☁️ ",    # Mostly Cloudy
    7: "☁️ ",    # Cloudy
    8: "🌫️ ",    # Dreary (Overcast)
    11: "🌫️ ",   # Fog
    12: "🌧️ ",   # Showers
    13: "🌧️ ",   # Mostly Cloudy w/ Showers
    14: "🌦️ ",   # Partly Sunny w/ Showers
    15: "🌩️ ",   # T-Storms
    16: "⛈️ ",   # Mostly Cloudy w/ T-Storms
    17: "🌩️ ",   # Partly Sunny w/ T-Storms
    18: "🌧️ ",   # Rain
    19: "🌨️ ",   # Flurries
    20: "🌨️ ",   # Mostly Cloudy w/ Flurries
    21: "🌨️ ",   # Partly Sunny w/ Flurries
    22: "❄️ ",    # Snow
    23: "❄️ ",    # Mostly Cloudy w/ Snow
    24: "🧊 ",    # Ice
    25: "🌨️ ",   # Sleet
    26: "❄️ ",    # Freezing Rain
    29: "🌧️❄️ ", # Rain and Snow
    30: "🔥 ",    # Hot
    31: "❄️ ",    # Cold
    32: "🌬️ ",   # Windy
    33: "🌞 ",    # Clear
    34: "🌤️ ",   # Mostly Clear
    35: "⛅ ",    # Partly Cloudy
    36: "🌥️ ",   # Intermittent Clouds
    37: "🌕🌫️ ", # Hazy Moonlight
    38: "☁️ ",    # Mostly Cloudy
    39: "🌦️ ",   # Partly Cloudy w/ Showers
    40: "🌧️ ",   # Mostly Cloudy w/ Showers
    41: "🌩️ ",   # Partly Cloudy w/ T-Storms
    42: "⛈️ ",   # Mostly Cloudy w/ T-Storms
    43: "🌨️ ",   # Mostly Cloudy w/ Flurries
    44: "❄️ ",    # Mostly Cloudy w/ Snow
}

data = {}

env.read_env()
WEATHER_KEY = env("WEATHER_KEY")


location = requests.get("http://ipwho.is/").json()
city_code = requests.get(f'http://dataservice.accuweather.com/locations/v1/cities/search?apikey=%20{WEATHER_KEY}&q={location['city']}').json()



weather2 = requests.get(f"http://dataservice.accuweather.com/currentconditions/v1/{city_code[0]['Key']}?apikey=%20{WEATHER_KEY}").json()

weather = requests.get("https://wttr.in/?format=j1").json()


def format_time(time):
    return time.replace("00", "").zfill(2)


def format_temp(temp):
    return (hour['FeelsLikeC']+"°").ljust(3)


def format_chances(hour):
    chances = {
        "chanceoffog": "Fog",
        "chanceoffrost": "Frost",
        "chanceofovercast": "Overcast",
        "chanceofrain": "Rain",
        "chanceofsnow": "Snow",
        "chanceofsunshine": "Sunshine",
        "chanceofthunder": "Thunder",
        "chanceofwindy": "Wind"
    }

    conditions = []
    for event in chances.keys():
        if int(hour[event]) > 0:
            conditions.append(chances[event]+" "+hour[event]+"%")
    return ", ".join(conditions)

tempint = int(weather['current_condition'][0]['FeelsLikeC'])
extrachar = ''
if tempint > 0 and tempint < 10:
    extrachar = '+'


data['text'] = ' ' + WEATHER_CODES[weather2[0]['WeatherIcon']] + \
    " "+extrachar+str(weather2[0]['Temperature']['Metric']['Value'])+"°"
    

data['tooltip'] = f"<b>{weather2[0]['WeatherText']} {weather2[0]['Temperature']['Metric']['Value']}°</b>\n"
data['tooltip'] += f"Feels like: {weather['current_condition'][0]['FeelsLikeC']}°\n"
data['tooltip'] += f"Wind: {weather['current_condition'][0]['windspeedKmph']}Km/h\n"
data['tooltip'] += f"Humidity: {weather['current_condition'][0]['humidity']}%\n"
for i, day in enumerate(weather['weather']):
    data['tooltip'] += f"\n<b>"
    if i == 0:
        data['tooltip'] += "Today, "
    if i == 1:
        data['tooltip'] += "Tomorrow, "
    data['tooltip'] += f"{day['date']}</b>\n"
    data['tooltip'] += f"⬆️ {day['maxtempC']}° ⬇️ {day['mintempC']}° "
    data['tooltip'] += f"🌅 {day['astronomy'][0]['sunrise']} 🌇 {day['astronomy'][0]['sunset']}\n"
    for hour in day['hourly']:
        if i == 0:
            if int(format_time(hour['time'])) < datetime.now().hour-2:
                continue


print(json.dumps(data))
