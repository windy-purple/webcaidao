<%-- 
@author qiyulin @date 2019 09 22  
实现无依赖jar文件上传
可支持windows 和 linux 亲测无错误
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.StringReader"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.File"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%!
//换行符 文件上传的换行符和系统无关！！！！
public static String LINE_SEPARATOR = "\r\n"; //System.getProperty("line.separator")
//提取上传的文件头信息
private FileHeadInfo extractFileHead(String content) throws IOException {
    BufferedReader reader = new BufferedReader(new StringReader(content));
    String multipartDelimiter, fileName, contentType,lineRead;
    if ((lineRead = reader.readLine()) != null) {
        //读取的第一行是一个分割符
        multipartDelimiter = lineRead;
        //对分隔符分割 获取有用信息
        String strs[] = content.split(multipartDelimiter);
        String avial = strs[strs.length-2];
        reader = new BufferedReader(new StringReader(avial));
        StringBuilder sb =new StringBuilder(LINE_SEPARATOR);
        reader.readLine();//第一行空白
        if ((lineRead = reader.readLine()) != null) {
            //读取的第二行为：Content-Disposition: form-data; name="file1"; filename="320_442.png"
            fileName = new File(lineRead.split(";")[2].split("=")[1].replace('"', ' ').trim()).getName();
            sb.append(lineRead+LINE_SEPARATOR);
            //以上为获取filename
            if ((lineRead = reader.readLine()) != null) {
                //第三行为：Content-Type: image/png
                contentType = lineRead.split(":")[1].trim();
                sb.append(lineRead+LINE_SEPARATOR);
                //空白行
                sb.append(LINE_SEPARATOR);
                //返回上传文件头的实体类
                int start = 0;
                for(int i=0;i<(strs.length-2);i++){
                    String ss =  multipartDelimiter+strs[i];
                    start+=ss.getBytes().length;
                }
                start+=sb.toString().getBytes().length;
                return new FileHeadInfo(multipartDelimiter,fileName, contentType,start);
            }
        }
    }
    return null;
}

//根目录URL
private String ROOT(HttpServletRequest request){
    String path = request.getRequestURI().substring(0,request.getRequestURI().lastIndexOf("/"));
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    return basePath;
}

//根目录物理路径
private String PATH(HttpServletRequest request){
    String s = request.getContextPath();
    String uri = request.getRequestURI();
    int last = uri.replace(s,"").lastIndexOf("/");
    String mid ="";
    if(last!=0) mid = uri.replace(s,"").substring(1,last)+File.separator;
    String root = request.getSession().getServletContext().getRealPath("/")+mid;
    return root;
}
//uuid文件名
private String UUID(){
     UUID uuid = UUID.randomUUID();
     return uuid.toString().replace("-","").toLowerCase().substring(8,24);
}
//提取的上传文件信息
class FileHeadInfo {
    private String multipartDelimiter;
    //文件名
    private String originalFileName;
    //文件的 content type
    private String contentType;
    //文件的数据 start bytes.length
    private int dataStart;
    public FileHeadInfo(String _multipartDelimiter,String _original_file_name
        ,String _content_type,int _data_start) {
        multipartDelimiter = _multipartDelimiter;
        originalFileName = _original_file_name;
        contentType = _content_type;
        dataStart = _data_start;
    }
}
%>
<%
if(request.getMethod().equals("POST")){
    InputStream inputStream = request.getInputStream();
    if (inputStream.available()!=-1) {
        //判断文件大小
        if (request.getContentLength() > 5000000) {//5M
            PrintWriter pw = response.getWriter();
            pw.print("{\"status\":2,\"info\":\"file length is too large\"}");
            pw.close();
            return;
        }
        //建立缓冲区
        ByteArrayOutputStream byteOutput = new ByteArrayOutputStream(request.getContentLength());
        if (inputStream != null) {
            int i =0;
            byte [] b = new byte[2048];
            while((i = inputStream.read(b))!= -1){
                 byteOutput.write(b, 0, i);
            }
        }
        //字节数组
        byte requestContent [] =byteOutput.toByteArray();
        //转为字符串
        String requestContentAsString =new String(requestContent);
        //获取报头所携带的文件信息
        FileHeadInfo headerBean = extractFileHead(requestContentAsString);
        //检查文件的扩展名
        if (!(headerBean.originalFileName.toLowerCase().indexOf(".jpg") !=-1||
            headerBean.originalFileName.toLowerCase().indexOf(".png") !=-1||
            headerBean.originalFileName.toLowerCase().indexOf(".gif") !=-1||
            headerBean.originalFileName.toLowerCase().indexOf(".bmp") !=-1||
            headerBean.originalFileName.toLowerCase().indexOf(".xls") !=-1)
            ){
            PrintWriter pw = response.getWriter();
            pw.print("{\"status\":3,\"info\":\"extension not allowed\"}");
            pw.close();
            return;
        }
        //检查文件的content type
        if (!("application/vnd.ms-excel".equals(headerBean.contentType)||
                "image/jpeg".equals(headerBean.contentType)||
                "image/png".equals(headerBean.contentType)||
                "image/gif".equals(headerBean.contentType)||
                "image/bmp".equals(headerBean.contentType)
            )){
            PrintWriter pw = response.getWriter();
            pw.print("{\"status\":4,\"info\":\"content type is invalid\"}");
            pw.close();
            return;
        }
        //获取文件内容
        String root = PATH(request)+"uploads"+File.separator;
        String yyyymm= new SimpleDateFormat("yyyy-MM").format(new Date());
        File path = new File(root+yyyymm);
        String filename =UUID()+headerBean.originalFileName.substring(headerBean.originalFileName.lastIndexOf("."));
        if(!path.exists()) path.mkdir();
        //把文件写到本地
        FileOutputStream fileOut = new FileOutputStream(new File(path,filename));
        //wirte
        int end =requestContent.length-headerBean.dataStart-headerBean.multipartDelimiter.getBytes().length-"--".getBytes().length-LINE_SEPARATOR.getBytes().length;
        fileOut.write(requestContent,headerBean.dataStart,end);
        fileOut.flush();
        fileOut.close();
        //out
        PrintWriter pw = response.getWriter();
        pw.print("{\"status\":1,\"info\":\""+ROOT(request)+"uploads/"+yyyymm+"/"+filename+"\"}");
        pw.close();
    }else{
        PrintWriter pw = response.getWriter();
        pw.print("{\"status\":0,\"info\":\"file can not be empty\"}");
        pw.close();
    }   
}
%>