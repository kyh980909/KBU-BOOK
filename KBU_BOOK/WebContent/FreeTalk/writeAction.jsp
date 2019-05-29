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
<% request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="freetalk" class="freetalk.FreeTalk" scope="page">
    <jsp:setProperty name="freetalk" property="title" param="title"/>
    <jsp:setProperty name="freetalk" property="content" param="content"/>
</jsp:useBean>
<jsp:useBean id="bMgr" class="freetalk.BoardMgr"/>
<html>
<head>
    <title>KBU BOOK</title>
</head>
<body>
<%
//    FreeTalkDAO freeTalkDAO = new FreeTalkDAO();
//    int result = freeTalkDAO.write(freetalk.getTitle(), "admin", freetalk.getContent());
//    if (result == -1) {
//        PrintWriter script = response.getWriter();
//        script.println("<script>");
//        script.println("alert('글작성 실')");
//        script.println("history.back()");
//        script.println("<script>");
//    } else {
//        PrintWriter script = response.getWriter();
//        response.sendRedirect("freeTalk.jsp");
//    }

    request.setCharacterEncoding("UTF-8");
    bMgr.insertBoard(request);
    response.sendRedirect("list.jsp");
%>
</body>
</html>
