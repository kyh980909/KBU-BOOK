<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<% request.setCharacterEncoding("UTF-8");
    String id= (String)session.getAttribute("session_id");
    String msg=request.getParameter("msg");
    if(msg!= null && msg.equals("2")){
        out.println("<script>alert('���̵� �Ǵ� ��й�ȣ�� Ȯ�� �Ͻʽÿ�!');</script>");

    }
%>

<!DOCTYPE html>
<style>
@import "css/style.css";
</style>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>KBU BOOK</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/signin.css">
</head>
<body onload="document.Login.id.focus();">
<header class="text-center">
    <h1><img src="img/Logo.png" width="1192" height="363"/></h1>
</header>
<br>
<div class="container">
    <form class="form-signin" method="post" name="Login" action="loginProc.jsp">
        <input class="form-control" type="text" name="id" placeholder="아이디를 입력하세요!"><br>
        <input class="form-control" type="password" name="pwd" placeholder="비밀번호를 입력하세요!"><br>
        <input class="btn btn-lg btn-primary btn-block" type="submit" value="로그인">
        <br><a href="Join/join.jsp"><p align="center">회원가입<a href='Login/s_id.jsp' onclick="window.open(this.href,'IDã��','toolbar=no, location=center, status=no, resizable=no, width=800, height=200'); return false;"> ���̵�&��й�ȣ ã�� </a></p><br>
	</a></p><br>
    </a>
    </form>
    <a href="FreeTalk/freeTalk.jsp">자유게시판</a>
</div>
<br>
<div class="text-center">
</div>
<p align="center">
	<jsp:include page="Footer.jsp"/>
</p>
</body>
</html>