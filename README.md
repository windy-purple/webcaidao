# webcaidao
WEB版菜刀
1、安装说明：将zip文件解压，将purple文件夹拷贝到ROOT目录下即可

2、启动程序前一定要开启mysql数据库，第一次启动程序，先进入init.jsp文件对对整个程序进行初始化，配置数据库，例如127.0.0.1:8080/purple/init.jsp

3、初始化完成后，点击跳转即可进入登录界面，初始密码为password，暂未提供修改密码接口，需要修改密码，请到数据库purple.users替换md5密文（大写）

4、第二次进入程序，url直接指定为login.jsp即可，例如127.0.0.1:8080/purple/login.jsp

5、安装程序前，请自行配置好jstl标签库和mysql连接包，懒得自己动手的，请将解压后的WEN-INF文件替换掉ROOT目录下的WEB-INF即可

6、在个人中心添加url时，必须有http://或https://，该版本不支持自动校验功能

7、数据库功能采用pdo，目标机必须配置有pdo才可使用

8、该版本暂时只支持目标机为php、windows系统

9、对程序初始化之前，请确认数据库用户名密码为root root，不是请自行到相关jsp文件中更改数据库连接信息

10、purple文件夹下面的code文件夹存放着该程序所有源码，如果想要完整阅读，请了解以下知识：jsp/jstl/java/python/ajax/html/js/css

11、底层数据抓取使用python编写，为防止python运行环境不匹配，已经将py文件封装成了exe文件，使用程序在使用时会弹出dos窗口是正常的，这意味着改程序只能部署在windows服务器上

12、相关tomcat服务器文件夹下面已经在zip文件夹下面，部署tomcat前请检查环境变量是否有JAVA_HOME

13、本程序仅供学习研究使用，不得用于商业以及非法用途

14、程序最终解释权归作者windy_ll所有

15、github地址：

16、文件下载功能下载中文文件可能会出错，原因是本版本底层模块对传输post中文数据暂时木有做相关处理
