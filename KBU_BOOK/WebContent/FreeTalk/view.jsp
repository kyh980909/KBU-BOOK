<%--
  Created by IntelliJ IDEA.
  User: yongho
  Date: 2019-05-25
  Time: 22:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="freetalk.FreeTalk" %>
<jsp:useBean id="ftDAO" class="freetalk.FreeTalkDAO" />

<%
    int id = Integer.parseInt(request.getParameter("id"));  // 글 번호 가져오
    ftDAO.upCount(id);   // 조회수 증가

    FreeTalk freeTalk = ftDAO.getContent(id);


    session.setAttribute("freeTalk", freeTalk);
%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="../css/bootstrap.css">
    <title>KBU BOOK</title>
</head>
<body>
<h1 class="text-center">KBU BOOK</h1>
<hr>
<h3 class="text-center">게시글</h3><br>
<div class="container">
    <table class="table table-striped" style="text-align: center; border: 1px #dddddd;">
        <colgroup>
            <col width="10%"/>
            <col width="*"/>
        </colgroup>
        <tbody>
        <tr>
            <td>제목</td>
            <td colspan="2" style="text-align: left"><%=freeTalk.getTitle()%>
            </td>
        </tr>
        <tr>
            <td>작성자</td>
            <td style="text-align: left"><%=freeTalk.getWriter()%>
            </td>
        </tr>
        <tr>
            <td>조회수</td>
            <td style="text-align: left"><%=freeTalk.getCount()%>
            </td>
        </tr>
        <tr>
            <td>작성일</td>
            <td style="text-align: left"><%=freeTalk.getDate()%>
            </td>
        </tr>
        <tr>
            <td>내용</td>
            <td style="min-height: 200px; text-align: left"><%=freeTalk.getContent()%>
            </td>
        </tr>
        </tbody>
    </table>
    <div class="pull-right">
        <a href="freeTalk.jsp" class="btn btn-success">글목록</a>
        <a href="update.jsp?id=<%=id%>" class="btn btn-primary">글수정</a>
        <a href="delete.jsp?id=<%=id%>" class="btn btn-danger" onclick="return confirm('글을 삭제하시겠습니까?')">글삭제</a>
    </div>
</div>
</body>
</html>
