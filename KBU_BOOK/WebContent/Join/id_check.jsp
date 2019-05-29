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
<style>
    @import "../css/style.css";
</style>
<script>
    function submit_id() {
        opener.document.form.idcheck.value="check_id"; //아이디 중복 확인 결과를 회원가입 페이지에 전달 함.
        opener.document.form.id.value="<%=id%>";// 팝업창을 통해 아이디를 입력후 자동으로 회원가입 페이지 아이디 폼에 입력됨.
        self.close();
    }
    function checkid() { //id값 확인
        var id = document.getElementById("uid").value;
        if ((id < "0" || id > "9") && (id < "A" || id > "Z") && (id < "a" || id > "z")) {
            alert("아이디는 한글 및 특수문자는 사용할 수 없습니다!\n 다시 확인후 입력을 해주시기 바랍니다!!");
            location.reload();
        }

    }

</script>
<html>
<head>
    <title>KBUBook_Join_Idcheck</title>
</head>
<body onload="document.check.id.focus();">
<div align="center">
    <br/><id><%=id%></id>
    <% if(result){
        out.println("는 이미 사용중인 아이디 입니다.<p/> 새로운 아이디를 입력하세요! <p/>"); %>

    <form name="check" method="post" action="id_check.jsp">
        <input type="text" size="50" value="" placeholder="중복확인 해주셈." name="id" class="text-form" id="uid" required> <input type="submit" value="중복확인" onclick="checkid(this.check)">
    </form>
      <%  }else {
            out.println("는 사용 가능한 아이디 입니다!<p/>"); %>
    <input type="button" value="ID사용하기!" onclick="submit_id()">
    <%}%>
    <br>id중복테스트</br>

</div>
</body>
</html>
