#!/bin/python
import time
#import urllib
from urllib.parse import urlparse
import hmac
import hashlib
import base64

def get_auth_token(sb_name, eh_name, sas_name, sas_value):
    """
    Returns an authorization token dictionary 
    for making calls to Event Hubs REST API.
    """
    uri = urlparse(f"https://{sb_name}.servicebus.windows.net/{eh_name}")
    
    sas = sas_value.encode('utf-8')
    expiry = str(int(time.time() + 10000))
    string_to_sign = f"{uri}\n{expiry}".encode('utf-8')
    signed_hmac_sha256 = hmac.HMAC(sas, string_to_sign, hashlib.sha256)
    signature = urlparse(base64.b64encode(signed_hmac_sha256.digest()))
    return  {"sb_name": sb_name,
             "eh_name": eh_name,
             "token":'SharedAccessSignature sr={}&sig={}&se={}&skn={}' \
                     .format(uri, signature, expiry, sas_name)
            }

print ( get_auth_token('sapps-eventdriven-servicebus', 'upper-case', 'listner', 'ZlgMkVC4TmEMpS8QFPth1TrdHC98mb1YL+ASbJuUQeU=')['token'] )

