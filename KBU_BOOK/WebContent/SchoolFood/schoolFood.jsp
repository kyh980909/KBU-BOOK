<%--
  Created by IntelliJ IDEA.
  User: yongho
  Date: 2019-06-03
  Time: 20:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="schoolfood.Daily" %>
<%@ page import="schoolfood.Dinner" %>
<%@ page import="schoolfood.Fix" %>
<%@ page import="schoolfood.Lunch" %>

<jsp:useBean id="foodDAO" class="schoolfood.SchoolFoodDAO"/>
<%
    Lunch lunchList = foodDAO.getTodayLunch();
    Dinner dinnerList = foodDAO.getTodayDinner();
    Fix fixList = foodDAO.getTodayFix();
    Daily dailyList = foodDAO.getTodayDaily();
%>
<jsp:include page="../top.jsp"/>

<html>
<head>
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/table.css">

    <title>KBU BOOK</title>
</head>
<body>
<table class="schoolfood">
    <thead>
    <tr>
        <td>
            <%=lunchList.getDate()%>
            <br>
            <%=lunchList.getDay()%>
        </td>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>
            <% for (String lunch : lunchList.getFood()) { %>
            <%=lunch%><br>
            <%}%>
        </td>
    </tr>
    <tr>
        <td>
            <% for (String dinner : dinnerList.getFood()) { %>
            <%=dinner%><br>
            <%}%>
        </td>
    </tr>
    <tr>
        <td>
            <% for (String fix : fixList.getFood()) { %>
            <%=fix%><br>
            <%}%>
        </td>
    </tr>
    <tr>
        <td>
            <%=dailyList.getFood()%><br>
        </td>
    </tr>
    </tbody>
</table>
<br>
<jsp:include page="../footer.jsp"/>
</body>
</html>