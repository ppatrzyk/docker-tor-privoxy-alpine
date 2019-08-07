# tor-privoxy-alpine

Docker image with Tor and Privoxy on Alpine Linux.

Buuild and run:

```
docker image build . -t torimage
docker run -d -p 8118:8118 -p 9050:9050 torimage
```

Requests through Python:

```Python
import requests

session = requests.session()
session.proxies = {
	'http':  'socks5://127.0.0.1:9050',
	'https': 'socks5://127.0.0.1:9050'
}

response = session.get('http://ip-api.com/json/')
print(response.content)
```
