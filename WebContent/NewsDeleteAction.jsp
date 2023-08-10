<%@page import="News.NewsDAO"%>
<%@page import="News.NewsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int seq = Integer.parseInt(request.getParameter("seq"));
	NewsDAO newsDao = new NewsDAO();
	newsDao.DeleteNews(seq);
%>
<script>
	alert("삭제되었습니다!");
	location.href = "FcController?command=news";
</script>