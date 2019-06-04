<%--
  Created by IntelliJ IDEA.
  User: yongho
  Date: 2019-06-03
  Time: 20:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Vector" %>
<%@ page import="schoolfood.Lunch" %>
<jsp:useBean id="lunchDAO" class="schoolfood.SchoolFoodDAO"/>
<%
    Vector<Lunch> lunchList = lunchDAO.getLunch();

%>

<html>
<head>
    <link rel="stylesheet" href="../css/bootstrap.css">

    <title>KBU BOOK</title>
</head>
<body>
<table class="table table-hover">
    <thead>
    <tr>
        <td>월</td>
    </tr>
    </thead>
    <tbody>
    <%
        for (int i = 0; i < lunchList.size(); i++) {
            String[] food = new String[6];
            String day = lunchList.get(i).getDay();
            food = lunchList.get(i).getFood();
    %>
    <tr>
        <%for (int j = 0; j < food.length; j++) {%>
        <td><%=food[j]%></td>
        <%}%>
    </tr>
    </tbody>
    <%}%>
</table>
</body>
</html>
