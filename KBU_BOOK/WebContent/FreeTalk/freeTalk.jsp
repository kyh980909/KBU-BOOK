<%--
  Created by IntelliJ IDEA.
  User: yongho
  Date: 2019-05-23
  Time: 21:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="freetalk.FreeTalk"%>
<%@ page import="freetalk.FreeTalkDAO"%>
<%@ page import="java.util.Vector"%>
<%@ page import="java.sql.Date"%>

<jsp:useBean id="freetalk" class="freetalk.FreeTalkDAO"/>

<%
    request.setCharacterEncoding("utf-8");

    int totalRecord = 0;
    int numPerPage = 10;
    int pagePerBlock = 15;

    int totalPage = 0;
    int totalBlock = 0;

    int nowPage = 1;
    int nowBlock = 1;

    int start = 0;
    int end = 0;

    int listSize = 0;

    String keyWord = "", keyField = "";
    Vector<FreeTalk> list = null;

    if (request.getParameter("keyWord") != null) {
        keyWord = request.getParameter("keyWord");
        keyField = request.getParameter("keyField");
    }

    if (request.getParameter("reload") != null) {
        if (request.getParameter("reload").equals("true")) {
            keyWord = "";
            keyField = "";
        }
    }

    if (request.getParameter("nowPage") != null) {
        nowPage = Integer.parseInt(request.getParameter("nowPage"));
    }

    start = (nowPage * numPerPage) - numPerPage;
    end = numPerPage;

    totalRecord = freetalk.getTotalCount(keyField, keyWord);
    totalPage = (int) Math.ceil((double) totalPage / numPerPage);
    nowBlock = (int) Math.ceil((double) nowPage / pagePerBlock);
    totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);
%>
<html>
<head>
<link rel="stylesheet" href="../css/bootstrap.css">
<title>KBU BOOK</title>
<style type="text/css">
a, a:hover {
	color: #000;
	text-decoration-line: none;
}
</style>
</head>
<body>
	<h1 class="text-center">KBU BOOK</h1>
	<hr>
	<table style="align: center; width: 960px;">
		<tr>
			<td>Total : <%=totalRecord%>Articles(<font color="red"> <%=nowPage%>/<%=totalPage%>Pages
			</font>)
			</td>
		</tr>
	</table>
	<div style="margin: 0 50px 0 50px">
		<table class="table table-hover">
			<thead>
				<tr>
					<td>번 호</td>
					<td>제 목</td>
					<td>이 름</td>
					<td>날 짜</td>
					<td>조회수</td>
				</tr>
			</thead>
            <tbody>
            <%
                list = freetalk.getList();
                for (int i = 0; i < list.size(); i++) {
                    int num = list.get(i).getId();
                    String writer = list.get(i).getWriter();
                    String title = list.get(i).getTitle();
                    Date date = list.get(i).getDate();
                    int count = list.get(i).getCount();
            %>
			<tr>
				<td align="center"><%=totalRecord - ((nowPage - 1) * numPerPage) - i%>
				</td>
				<td><a href="view.jsp?id=<%=list.get(i).getId()%>"><%=title%>
				</a></td>
				<td align="center"><%=writer%></td>
				<td align="center"><%=date%></td>
				<td align="center"><%=count%></td>
			</tr>
            <%}%>
            </tbody>
		</table>
		<a href="write.jsp" class="btn btn-success pull-right">글쓰기</a>
	</div>
</body>
</html>
