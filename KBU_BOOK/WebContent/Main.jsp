<%--
  Created by IntelliJ IDEA.
  User: HWJ
  Date: 2019-05-31
  Time: 오전 12:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=EUC-KR" pageEncoding="EUC-KR" language="java" %>
<% request.setCharacterEncoding("EUC-KR"); %>

<html>
<head>
    <title>KBUBook</title>
</head>
<body>
로그인성공<br>
<%= session.getAttribute("session_id")%> 님 환영합니다!
로그아웃
</body>
</html>
