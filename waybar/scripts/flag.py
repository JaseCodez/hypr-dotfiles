#!/usr/bin/env python
import requests
location = requests.get("http://ipwho.is/").json()
print(location['flag']['emoji'])
