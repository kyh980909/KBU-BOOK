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
<%@ page import="java.util.Vector" %>

<%
    if (session.getAttribute("session_id") != null) {
%>

<jsp:useBean id="foodDAO" class="schoolfood.SchoolFoodDAO"/>
<%
    Vector<Lunch> lunchList = foodDAO.getLunch();
    Vector<Dinner> dinnerList = foodDAO.getDinner();
    Vector<Fix> fixList = foodDAO.getFix();
    Vector<Daily> dailyList = foodDAO.getDaily();
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
        <% for (Lunch lunch : lunchList) { %>
        <td>
            <%=lunch.getDate()%>
            <%=lunch.getDay()%>
        </td>
        <%}%>
    </tr>
    </thead>
    <tbody>
    <tr>
        <% for (Lunch lunch : lunchList) { %>
        <td>
            <%for (String food : lunch.getFood()) {%>
            <%=food%><br>
            <%}%>
        </td>
        <%}%>
    </tr>
    <tr>
        <% for (Dinner dinner : dinnerList) { %>
        <td>
            <%for (String food : dinner.getFood()) {%>
            <%=food%><br>
            <%}%>
        </td>
        <%}%>
    </tr>
    <tr>
        <% for (Fix fix : fixList) { %>
        <td>
            <%for (String food : fix.getFood()) {%>
            <%=food%><br>
            <%}%>
        </td>
        <%}%>
    </tr>
    <tr>
        <% for (Daily daily : dailyList) { %>
        <td>
            <%=daily.getFood()%><br>
        </td>
        <%}%>
    </tr>
    </tbody>
</table>

<%
    } else {
        out.print("<script>alert('로그인을 해주세요.'); location.href='../index.jsp';</script>");
    }
%>
<br>
<jsp:include page="../footer.jsp"/>
</body>
</html>