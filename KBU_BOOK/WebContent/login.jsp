<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>KBU TIME</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/signin.css">
</head>
<body>
	<header class="text-center">
		<h1>KBU TIME</h1>
	</header>
	<br>
	<div class="container">
		<form class="form-signin" method="post">
			<input class="form-control" type="text" placeholder="아이디를 입력하세요"><br>
			<input class="form-control" type="password" placeholder="비밀번호를 입력하세요"><br>
			<input class="btn btn-lg btn-primary btn-block" type="submit"
				value="로그인">
		<br>아이디가 없다면? <a href="/KBU_Community_SIte/Register.jsp">회원가입</a><br>
		</form>
	</div>
	<br>
	<div class="text-center">
		<img src="img/logo_kor.png" style="width: 30%; height: 50%;">
	</div>
</body>
</html>