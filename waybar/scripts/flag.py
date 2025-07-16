#!/usr/bin/env python
import requests
location = requests.get("http://ipwho.is/").json()
city_code = requests.get(f'https://ipinfo.io/{location['ip']}/json').json()
print(city_code['city'] + " " + location['flag']['emoji'])
