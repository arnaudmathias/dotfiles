#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import json
import gdax
import datetime

pricedb_path = os.environ['HOME'] + os.sep + ".pricedb"

client = gdax.PublicClient()
eth_price = client.get_product_ticker(product_id='ETH-EUR')["price"]
btc_price = client.get_product_ticker(product_id='BTC-EUR')["price"]

pricedb_file = file(pricedb_path,"a")
current_time = datetime.datetime.now()

with open(pricedb_path, "a") as file:
    file.write("P " + current_time.strftime("%Y/%m/%d %H:%M:%S") + " BTC " + str(btc_price) + "€\n")
    file.write("P " + current_time.strftime("%Y/%m/%d %H:%M:%S") + " ETH " + str(eth_price) + "€\n")
