<%--
  Created by IntelliJ IDEA.
  User: yongho
  Date: 2019-05-24
  Time: 01:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="freetalk.FreeTalkDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="freetalk" class="freetalk.FreeTalk" scope="page">
    <jsp:setProperty name="freetalk" property="title" param="title"/>
    <jsp:setProperty name="freetalk" property="content" param="content"/>
    <jsp:setProperty name="freetalk" property="ip" param="ip"/>
</jsp:useBean>
<jsp:useBean id="bMgr" class="freetalk.BoardMgr"/>
<html>
<head>
    <title>KBU BOOK</title>
</head>
<body>
<%
    FreeTalkDAO freeTalkDAO = new FreeTalkDAO();
    freeTalkDAO.write(freetalk.getTitle(), "관리자", freetalk.getContent(), freetalk.getIp());
    response.sendRedirect("list.jsp");

/*     request.setCharacterEncoding("utf-8");
    bMgr.insertBoard(request);
    response.sendRedirect("list.jsp"); */
%>
</body>
</html>
