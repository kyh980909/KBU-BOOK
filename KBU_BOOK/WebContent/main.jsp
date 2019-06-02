<%--
  Created by IntelliJ IDEA.
  User: HWJ
  Date: 2019-05-31
  Time: 오전 12:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<% request.setCharacterEncoding("UTF-8"); %>

<html>
<head>
    <title>KBU BOOK</title>
</head>
<body>
<jsp:include page="top.jsp"/>

로그인성공<br>
<%= session.getAttribute("session_id")%> 님 환영합니다!
<a href="Login/logoutProc.jsp" >로그아웃</a>
</body>
</html>
