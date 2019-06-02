<%--
  Created by IntelliJ IDEA.
  User: yongho
  Date: 2019-05-23
  Time: 21:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="freetalk.FreeTalk" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.util.Vector" %>

<jsp:useBean id="freetalk" class="freetalk.FreeTalkDAO"/>

<%
    if (session.getAttribute("session_id") != null) {
%>

<%
    request.setCharacterEncoding("utf-8");

    int totalRecord = 0;
    int numPerPage = 10;
    int pagePerBlock = 15;

    int totalPage = 1;
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
    totalPage = (int) Math.ceil((double) totalRecord / numPerPage);
    nowBlock = (int) Math.ceil((double) nowPage / pagePerBlock);
    totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);
%>
<jsp:include page="../top.jsp"/>
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

    <script type="text/javascript">
        function block(value) {
            document.readFrm.nowPage.value =
            <%=pagePerBlock%>*
            (value - 1) + 1;
            document.readFrm.submit();
        }

        function paging(page) {
            document.readFrm.nowPage.value = page;
            document.readFrm.submit();
        }
    </script>
</head>
<body>
<div style="margin: 0 50px 0 50px">
    <table style="align: center; width: 960px;">
        <tr>
            <td>Total : <%=totalRecord%> Articles( <font color="red"><%=nowPage%>/<%=totalPage%> Pages
            </font>)
            </td>
        </tr>
    </table>
    <%
        list = freetalk.getList(keyField, keyWord, start, end);  // DB 에서 글 목록을 받아서 리스트에 저장
        listSize = list.size(); // 리스트에 길이를 저장
        if (list.isEmpty()) {   // 리스트가 비어 있을
    %>
    <h2 class="text-center">등록된 게시물이 없습니다.</h2>
    <%
    } else {
    %>
    <table class="table table-hover">
        <colgroup>
            <col width="10%"/>
            <col width="*"/>
            <col width="20%"/>
            <col width="15%"/>
            <col width="10%"/>
        </colgroup>
        <thead>
        <tr>
            <td align="center">번 호</td>
            <td align="center">제 목</td>
            <td align="center">이 름</td>
            <td align="center">날 짜</td>
            <td align="center">조회수</td>
        </tr>
        </thead>
        <tbody>
        <%
            for (int i = 0; i < listSize; i++) {
                int id = list.get(i).getId();
                String writer = list.get(i).getWriter();
                String title = list.get(i).getTitle();
                Date date = list.get(i).getDate();
                int count = list.get(i).getCount();
        %>
        <tr>
            <td align="center"><%=totalRecord - ((nowPage - 1) * numPerPage) - i%>
            </td>
            <td><a href="view.jsp?id=<%=id%>"><%=title%>
            </a></td>
            <td align="center"><%=writer%>
            </td>
            <td align="center"><%=date%>
            </td>
            <td align="center"><%=count%>
            </td>
        </tr>
        <%}%>
        </tbody>
    </table>
    <%}%>
    <div class="text-center">
    <%
        int pageStart = (nowBlock - 1) * pagePerBlock + 1; //하단 페이지 시작번호
        int pageEnd = ((pageStart + pagePerBlock) <= totalPage) ? (pageStart + pagePerBlock) : totalPage + 1; //하단 페이지 끝번호
        if (totalPage != 0) {
            if (nowBlock > 1) {%>
    <a href="javascript:block('<%=nowBlock-1%>')">prev...</a>
    <%}%>&nbsp;
    <% for (; pageStart < pageEnd; pageStart++) {%>
    <a href="javascript:paging('<%=pageStart %>')"><%if (pageStart == nowPage) {%><font color="blue"><%}%>
        [<%=pageStart %>]
        <%if (pageStart == nowPage) {%></font> <%}%></a>
    <%}//for%>&nbsp;
    <%if (totalBlock > nowBlock) {%>
    <a href="javascript:block('<%=nowBlock+1%>')">.....next</a> <%}%>&nbsp;
    <%}%>
    </div>
    <a href="write.jsp" class="btn btn-success pull-right">글쓰기</a>
</div>
<form name="readFrm" method="get">
    <input type="hidden" name="num">
    <input type="hidden" name="nowPage" value="<%=nowPage%>">
    <input type="hidden" name="keyField" value="<%=keyField%>">
    <input type="hidden" name="keyWord" value="<%=keyWord%>">
</form>

<%} else {
        out.print("<script>alert('로그인을 해주세요.'); location.href='../index.jsp';</script>");
}%>
</body>
</html>