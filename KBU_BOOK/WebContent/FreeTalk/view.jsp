<%@ page import="freetalk.FreeTalk" %>
<%@ page import="freetalk.FreeTalkDAO" %>
<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: yongho
  Date: 2019-05-25
  Time: 22:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        <%
            FreeTalkDAO freeTalkDAO = new FreeTalkDAO();
            FreeTalk freeTalk;

            int id = 0;

            if (request.getParameter("id") != null) {
                id = Integer.parseInt(request.getParameter("id"));
            }

            if (id == 0) {
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('유효하지 않은 글 입니다.')");
                script.println("</script>");
                response.sendRedirect("freeTalk.jsp");
            }
            freeTalk = freeTalkDAO.getContent(id);
        %>
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
    <a href="freeTalk.jsp" class="btn btn-success pull-right">글목록</a>
</div>
</body>
</html>
