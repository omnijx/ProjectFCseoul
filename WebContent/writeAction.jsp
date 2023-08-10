<%@page import="News.NewsDAO"%>
<%@page import="News.NewsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%
	String savePath = request.getServletContext().getRealPath("NewsImageUpload2");
	int maxSize = 15*1024*1024;
	
	MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "utf-8", new DefaultFileRenamePolicy());
	
	String fileName = multi.getFilesystemName("fileName");
	String Title = multi.getParameter("title");
	String Content = multi.getParameter("textContent");
	
	String m_fileFullPath = savePath + "/" +fileName;
	String realfile = "NewsImageUpload2/"+ fileName;
	NewsDAO newsDao = new NewsDAO();
	newsDao.insertNews(Title, Content, m_fileFullPath,realfile);
%>
<script>
	location.href = "FcController?command=news";
</script>