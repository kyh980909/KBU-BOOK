<%--
  Created by IntelliJ IDEA.
  User: HWJ
  Date: 2019-06-04
  Time: 오전 1:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="kbu.MemberDAO" %>
<%@ page import="kbu.Member" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String std_id = request.getParameter("std_id");
    MemberDAO d = MemberDAO.getInstance();

    Member member = new Member();
    member = d.search_student(std_id);
    
%>
<html>
<head>
    <title>KBUBOOK JOIN</title>
</head>
<body>

<div align="center">
    <serach>학번 인증 하기</serach>
    <hr>
    <b><%=std_id%></b>님의 학적 정보 입니다.
    <br>이름: <id><%=member.getName()%></id></br>
    <br> 학년: <%=member.getGrade()%> 학년 </br>
    <br>학과: <%=member.getDepartment()%> 과 </br>
    <p><input type="submit" value="확인" name="ok" class="btn btn-info"> <input type="button" value="닫기" name="exit" onclick="window.close()" class="btn btn-info"></p>

</div>

</body>
</html>
