#! /usr/bin/env python

import httplib, urllib
import sys
import pandas as pd
import json

# read API key
keyfile = open('tesco_api_key.txt')
key = keyfile.readline().strip()

def get_groceries(q,off,lmt):
    # get first 100 and total number of results

    df_all = pd.DataFrame()
    total = 0
    params = urllib.urlencode({ })
    headers = {
        # Request headers
        'Ocp-Apim-Subscription-Key':  key,
    }
    try:
        conn = httplib.HTTPSConnection('dev.tescolabs.com')
        conn.request("GET",
                        "/grocery/products/?query=" + q + "&offset=" +
                        str(off) + "&limit=" + lmt + "&%s" % params, "{body}",
                        headers)
        response = conn.getresponse()
        data = response.read()
        j = json.loads(data)
        df = pd.DataFrame(j['uk']['ghs']['products']['results'])
        df_all = df_all.append(df)
        total = j['uk']['ghs']['products']['totals']['all']
        print "There are {}  {} products".format(str(total), q)
        conn.close()
    except Exception as e:
        print(e)

    remain = total

    while remain > 0:
        try:
            off += 100
            conn = httplib.HTTPSConnection('dev.tescolabs.com')
            conn.request("GET",
                        "/grocery/products/?query=" + q + "&offset=" +
                        str(off) + "&limit=" + lmt + "&%s" % params, "{body}",
                        headers)
            response = conn.getresponse()
            data = response.read()
            j = json.loads(data)
            df = pd.DataFrame(j['uk']['ghs']['products']['results'])
            df_all = df_all.append(df)
            print "{} products remaining to fetch".format(remain)
            remain -= 100
            conn.close()
        except Exception as e:
            print(e)

    return df_all


args = sys.argv
q = args[1]
off = 100
lmt = '100'
df_all = get_groceries(q,off,lmt)
df_all.to_csv('data/' + q + '.csv', encoding='utf-8', sep='\t')
