<%--
  Created by IntelliJ IDEA.
  User: HWJ
  Date: 2019-06-10
  Time: 오후 9:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8" language="java" %>
<link rel="stylesheet" href="../css/bootstrap.min.css"><!--부트스트랩 css를 불러옴-->
<style>
    @import "../css/style.css";
    body{
        background-color: rgba(69, 255, 57, 0.06);
    }
</style>

<%@ page import="kbu.Member"%>
<jsp:useBean id="MemberDAO" class="kbu.MemberDAO" />
<% String id = (String)session.getAttribute("session_id");
    Member mem = MemberDAO.getmember(id);
if(id == null){
    %>
<script>
    alert("로그인을 하셔야 회원정보 수정이 가능 합니다!");
    location.href ="../index.jsp";
</script><%
} else  if(id != null){

}%>
<script>
    function check(f) {
        if(! f.pwd.value){
            alert("변경할 비밀번호를 입력하십시오!");
            return false;
            exit();
            location.reload();

        }
       if(f.pwd.value==f.now_pwd.value){
            alert("변경할 비밀번호가 동일합니다. \n 다른 비밀번호를 입력하세요!");
            return false;
           location.reload();
        }

    }
    function delmember() {
       var ans = confirm("정말로 탈퇴 하시겠습니까?");
        if(ans==true){
            location.href="delete.jsp";
        }
        if(ans==false){
            return;
        }
    }
</script>
<html>
<head>
    <title>KBUBook UserUpdate Page</title>
</head>
<body>
<jsp:include page="../top.jsp"/>

<div align="center">
    <form name="rejoin" method="post" action="update.jsp" onsubmit="">
    <p> 회원정보 수정 페이지</p>
        <p> 학번:<b><%=mem.getStd_id()%></b> </p>
        <p> 회원가입 날짜:<b><%= mem.getJoin_date()%></b></p>
        <p> 아이디: <b><%=id%></b> </p>
    <p> 학교 아이디: <input type="email" name="email" value="<%=mem.getEmail()%>" class="text-form" readonly> </p>
        <p><br> <b>회원정보 수정은 비밀번호, 휴대전화번호만 가능 하며 더이상 사용하지 않을경우 회원탈퇴 할 수 있습니다.</b> </p>
    <p> 비밀번호: <input type="password" name="pwd" value="<%=mem.getPwd()%>" class="text-form" required > <input type="hidden" value="<%=mem.getPwd()%>" name="now_pwd"> </p>
    <p> 휴대전화 번호: <input type="tel" name="tel" value="<%=mem.getTel()%>" class="text-form" required> </p>
    <p><input type="submit" name="re_join" value="정보수정" onclick="check(this.form)" class="btn btn-primary" > <input type="button" name="del_member" value="회원탈퇴" onclick="delmember(this.rejoin)" class="btn btn-danger"> </p>
    </form>
</div>

</body>
</html>
