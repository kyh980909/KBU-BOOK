<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.lang.*" %>

<% request.setCharacterEncoding("UTF-8");
	String id= (String)session.getAttribute("session_id");
	String msg=request.getParameter("msg");
	if(msg!= null && msg.equals("2")){
		out.println("<script>alert('���̵� �Ǵ� ��й�ȣ�� Ȯ�� �Ͻʽÿ�!');</script>");

	}
%>

<!DOCTYPE html>
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
		<br><a href="Join/join.jsp"><p align="center">회원가입<a> 아이디&비밀번호 찾기 </a></p><br>
		</a>
		</form>
		<a href="FreeTalk/freeTalk.jsp">자유게시판</a>
	</div>
	<br>
	<div class="text-center">
	</div>
</body>
</html>