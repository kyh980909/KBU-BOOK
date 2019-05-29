<%--
  Created by IntelliJ IDEA.
  User: HWJ
  Date: 2019-05-28
  Time: 오전 1:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=EUC-KR" language="java" %>
<jsp:useBean id="memberDAO" class="member.memberDAO" />
<% request.setCharacterEncoding("EUC-KR");%>

<%   String id = request.getParameter("id");
    boolean result = memberDAO.checkId(id); %>
아이디값 확인: <%=result%>

<html>
<head>
    <title>KBUBook_Join_Idcheck</title>
</head>
<body>
<div align="center">
    <br/><b><%=id%></b>
    <% if(result){
        out.println("는 이미 사용중인 아이디 입니다. 새로운 아이디를 입력하세요! <p/>");}
        else {
            out.println("는 사용 가능한 아이디 입니다!<p/>");
    } %>
    id중복테스트
    <a href="#" onclick="self.close()">닫는다</a>
</div>
</body>
</html>
