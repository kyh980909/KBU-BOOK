<%--
  Created by IntelliJ IDEA.
  User: HWJ
  Date: 2019-05-31
  Time: 오전 12:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="schoolfood.Daily" %>
<%@ page import="schoolfood.Dinner" %>
<%@ page import="schoolfood.Fix" %>
<%@ page import="schoolfood.Lunch" %>

<%
    if (session.getAttribute("session_id") != null) {
%>

<jsp:useBean id="foodDAO" class="schoolfood.SchoolFoodDAO"/>
<%
    Lunch lunchList = foodDAO.getTodayLunch();
    Dinner dinnerList = foodDAO.getTodayDinner();
    Fix fixList = foodDAO.getTodayFix();
    Daily dailyList = foodDAO.getTodayDaily();
%>
<jsp:include page="top.jsp"/>

<html>
<head>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/table.css">

    <title>KBU BOOK</title>
</head>
<body>
<div class="text-center">
<h1><b>오늘의 학식</b></h1>
</div>
<br>
<table class="schoolfood">
    <colgroup>
        <col width="30%"/>
        <col width="70%"/>
    </colgroup>
    <thead>
    <tr>
        <td colspan="2">
            <%=lunchList.getDate()%>
            <br>
            <%=lunchList.getDay()%>
        </td>
    </tr>
    </thead>
    <tbody>
    <tr>
        <th><br><br>중식</th>
        <td>
            <% for (String lunch : lunchList.getFood()) { %>
            <%=lunch%><br>
            <%}%>
        </td>
    </tr>
    <tr>
        <th><br><br>석식</th>
        <td>
            <% for (String dinner : dinnerList.getFood()) { %>
            <%=dinner%><br>
            <%}%>
        </td>
    </tr>
    <tr>
        <th>고정메뉴</th>
        <td>
            <% for (String fix : fixList.getFood()) { %>
            <%=fix%><br>
            <%}%>
        </td>
    </tr>
    <tr>
        <th>데일리메뉴</th>
        <td>
            <%=dailyList.getFood()%><br>
        </td>
    </tr>
    </tbody>
</table>

<%
    } else {
        out.print("<script>alert('로그인을 해주세요.'); location.href='../index.jsp';</script>");
    }
%>
<br>
<jsp:include page="footer.jsp"/>
</body>
</html>