#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import requests

proxies = {
    "http": "http://127.0.0.1:8080",
    "https": "http://127.0.0.1:8080"
}

def main():
    try:
    	# produce some traffic
        [requests.get(
            f"http://localhost:8081/etc/machine-id", proxies=proxies
        ) for i in range(0,5)]

		# send sensitive data
        requests.post(
            "http://localhost:8081", 
            data={'username': 'test_user', 'password': 'c3RyMG5ncEBzc3cwcmQ='}, # base64 encoded str0ngp@ssw0rd
            proxies=proxies
        )
    except requests.exceptions.ConnectionError:
        print("Connection refused")

if __name__ == "__main__":
    main()

