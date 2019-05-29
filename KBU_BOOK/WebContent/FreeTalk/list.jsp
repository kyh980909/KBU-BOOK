<%@ page import="freetalk.FreeTalk" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.util.Vector" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<jsp:useBean id="bMgr" class="freetalk.BoardMgr"/>
<%
    request.setCharacterEncoding("UTF-8");

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

    totalRecord = bMgr.getTotalCount(keyField, keyWord);
    totalPage = (int) Math.ceil((double) totalPage / numPerPage);
    nowBlock = (int) Math.ceil((double) nowPage / pagePerBlock);
    totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);

%>
<html>
<head>
    <title>KBU BOOK</title>
    <script type="text/javascript">
        function list() {
            document.listFrm.action = "list.jsp";
            document.listFrm.submit();
        }

        function pageing(page) {
            document.readFrm.nowPage.value = page;
            document.readFrm.submit();
        }

        function block(value) {
            document.readFrm.nowPage.value =
            <%=pagePerBlock%>*
            (value - 1) + 1;
            document.readFrm.submit();
        }

        function read(num) {
            document.readFrm.num.value = num;
            document.readFrm.action = "view.jsp?id="+num;
            document.readFrm.submit();
        }

        function check() {
            if (document.searchFrm.keyWord.value == "") {
                alert("검색어를 입력하세요.");
                document.searchFrm.keyWord.focus();
                return;
            }
            document.searchFrm.submit();
        }
    </script>
</head>
<body>
<div align="center">
    <br>
    <h2>게시판</h2>
    <br>
    <table style="align:center; width: 960px;">
        <tr>
            <td>Total : <%=totalRecord%>Articles(<font color="red">
                <%=nowPage%>/<%=totalPage%>Pages</font>)
            </td>
        </tr>
    </table>
    <table style="width: 960px; cellpadding:3; align:center">
        <tr>
            <td align="center" colspan="2">
                <%
                    list = bMgr.getBoardList(keyField, keyWord, start, end);
                    listSize = list.size();
                    if (list.isEmpty()) {
                        out.println("등록된 게시물이 없습니다.");
                    } else {
                %>
                <table style="width:100%; cellpadding:2; cellspacing:0; align:center">
                    <tr align="center" bgcolor="#e9e9e9" height="120%">
                        <td width="10%">번 호</td>
                        <td width="50%">제 목</td>
                        <td width="15%">이 름</td>
                        <td width="15%">날 짜</td>
                        <td width="10%">조회수</td>
                    </tr>
                    <%
                        for (int i = 0; i < numPerPage; i++) {
                            if (i == listSize)
                                break;

                            FreeTalk freeTalk = list.get(i);
                            int num = freeTalk.getId();
                            String writer = freeTalk.getWriter();
                            String title = freeTalk.getTitle();
                            Date date = freeTalk.getDate();
                            int count = freeTalk.getCount();
                    %>
                    <tr>
                        <td align="center">
                            <%=totalRecord - ((nowPage - 1) * numPerPage) - i%>
                        </td>
                        <td>
                            <a href="view.jsp?id=<%=list.get(i).getId()%>"><%=title%>
                            </a>
                        </td>
                        <td align="center"><%=writer%>
                        </td>
                        <td align="center"><%=date%>
                        </td>
                        <td align="center"><%=count%>
                        </td>
                    </tr>
                    <%}%>
                </table>
                <%}%>
            </td>
        </tr>
        <tr>
            <td colspan="2"><br><br></td>
        </tr>
        <tr>
            <td>
                <%
                    int pageStart = (nowBlock - 1) * pagePerBlock + 1;
                    int pageEnd = ((pageStart + pagePerBlock) <= totalPage) ? (pageStart + pagePerBlock) :
                            totalPage + 1;
                    if (totalPage != 0) {
                        if (nowBlock > 1) {%>
                <a href="javascript:block('<%=nowBlock-1%>')">prev...</a><%}%>&nbsp; <%for (; pageStart < pageEnd; pageStart++) {%>
                <a href="javascript:pageing('<%=pageStart%>')">
                    <% if (pageStart == nowPage) {%><font color="blue"><%}%>
                    [<%=pageStart%>]
                    <% if (pageStart == nowPage) {%></font> <%}%></a>
                <%}//for%>&nbsp;
                <%if (totalBlock > nowBlock) {%>
                <a href="javascript:block('<%=nowBlock+1%>')">.....next</a> <%}%>&nbsp;
                <%}%>
            </td>
            <td align="right">
                <a href="write.jsp">[글쓰기]</a>
                <a href="javascript:list()">[처음으로]</a>
            </td>
        </tr>
    </table>
    <hr width="960"/>
    <form name="searchFrm" method="get" action="list.jsp">
        <table style="width:960px; cellpadding:4; cellspacing:0">
            <tr>
                <td align="center" valign="bottom">
                    <select name="keyField" size="1">
                        <option value="writer"> 이 름</option>
                        <option value="title"> 제 목</option>
                        <option value="content"> 내 용</option>
                    </select>
                    <input size="16" name="keyWord">
                    <input type="button" value="찾기" onClick="javascript:check()"> <input type="hidden" name="nowPage"
                                                                                         value="1">
                </td>
            </tr>
        </table>
    </form>
    <form name="listFrm" method="post">
        <input type="hidden" name="reload" value="true">
        <input type="hidden" name="nowPage" value="1">
    </form>
    <form name="readFrm" method="get">
        <input type="hidden" name="num">
        <input type="hidden" name="nowPage" value="<%=nowPage%>">
        <input type="hidden" name="keyField" value="<%=keyField%>">
        <input type="hidden" name="keyWord" value="<%=keyWord%>">
    </form>
</div>
</body>
</html>