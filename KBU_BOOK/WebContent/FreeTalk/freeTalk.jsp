<%--
  Created by IntelliJ IDEA.
  User: yongho
  Date: 2019-05-23
  Time: 21:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="freetalk.FreeTalk" %>
<%@ page import="freetalk.FreeTalkDAO" %>
<%@ page import="java.util.ArrayList" %>

<html>
<head>
    <link rel="stylesheet" href="../css/bootstrap.css">
    <title>KBU BOOK</title>
    <style type="text/css">
        a, a:hover {
            color: #000;
            text-decoration-line: none;
        }
    </style>
</head>
<body>
<h1 class="text-center">KBU BOOK</h1>
<hr>
<div style="margin: 0 50px 0 50px">
    <table class="table table-hover">
        <thead>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
        </tr>
        </thead>
        <tbody>
        <%
            FreeTalkDAO freeTalkDAO = new FreeTalkDAO();
            ArrayList<FreeTalk> list = freeTalkDAO.getList();
            for(int i = 0; i < list.size(); i++) {
        %>
        <tr>
            <td><%= list.get(i).getId()%></td>
            <td><a href="view.jsp?id=<%=list.get(i).getId()%>"><%= list.get(i).getTitle()%></a></td>
            <td><%= list.get(i).getWriter()%></td>
            <td><%= list.get(i).getDate()%></td>
        </tr>
        <% } %>
        </tbody>
    </table>
    <a href="write.jsp" class="btn btn-success pull-right">글쓰기</a>
</div>
</body>
</html>
