<%--
  Created by IntelliJ IDEA.
  User: HWJ
  Date: 2019-06-04
  Time: 오전 1:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="kbu.memberDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%  String std_id = request.getParameter("std_id");
    String name = request.getParameter("name");
    String grade = request.getParameter("grade");
    String department = request.getParameter("department");
    kbu.memberDAO d = memberDAO.getInstance();
    String NAME = d.search_student(std_id, name, grade, department);

%>
<html>
<head>
    <title>KBUBOOK JOIN</title>
</head>
<body>

<div align="center">
    <serach>학번 인증 하기</serach>
    <hr></hr>
    <%=NAME%>
    <b><%=std_id%></b>님의 학적 정보 입니다.
    <br>이름: <id><%=name%></id></br>
    <br> 학년: <%=grade%> 학년 </br>
    <br>학과: <%=department%> 과 </br>
    <p><input type="submit" value="확인" name="ok" class="btn btn-info"> <input type="button" value="닫기" name="exit" onclick="window.close()" class="btn btn-info"></p>

</div>

</body>
</html>
