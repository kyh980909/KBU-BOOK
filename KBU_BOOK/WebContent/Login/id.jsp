<%--
  Created by IntelliJ IDEA.
  User: HWJ
  Date: 2019-06-01
  Time: 오후 8:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="kbu.MemberDAO" %>
<%@ page contentType="text/html;charset=EUC-KR" pageEncoding="EUC-KR" language="java" %>
<jsp:useBean id="MemberDAO" class="kbu.MemberDAO" />
<% request.setCharacterEncoding("EUC-KR");%>

<%  String std_id = request.getParameter("std_id");
    String email = request.getParameter("email");
    kbu.MemberDAO dao = kbu.MemberDAO.getInstance();
    String ID = dao.se_id(std_id, email);
    %>
<html>
<link rel="stylesheet" href="../css/bootstrap.min.css"><!--부트스트랩 css를 불러옴-->

<style>
    @import "../css/style.css";
    body{background-color: rgba(243,206,90,0.53);}
</style>
<head>
    <title>KBUBOOK SEARCH ID</title>
</head>
<body>
<div align="center">
    <serach>아이디 & 비밀번호 찾기</serach>
    <hr></hr>
<% if(ID!= null){%>
    <b><%=std_id%></b>님의 아이디는 <id> <%=ID%> </id>입니다! <br>비밀번호는 관리자에게 문의 하십시오. </br>
    <p><input type="button" value="닫기" name="exit" onclick="window.close()" class="btn btn-danger"></p> <%} else
    {%>
    <b> <%= std_id%></b>님의 아디디는 없습니다! 다시 찾거나, 회원가입을 하세요.
    <p><input type="button" value="아이디 다시찾기" name="re" onclick="history.back()" class="btn btn-danger"></p><%
    } %>
</div>
</body>
</html>
