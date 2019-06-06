<%--
  Created by IntelliJ IDEA.
  User: yongho
  Date: 2019-05-25
  Time: 22:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="freetalk.FreeTalk" %>
<%@ page import="freetalk.FreeTalkComment" %>
<%@ page import="java.util.Vector" %>
<jsp:useBean id="ftDAO" class="freetalk.FreeTalkDAO"/>


<%
    if (session.getAttribute("session_id") != null) {
%>

<%
    int id = Integer.parseInt(request.getParameter("id"));  // 글 번호 가져오기
    String userId = session.getAttribute("session_id").toString(); // 현재 로그인한 사용자의 아이디 저장

    ftDAO.upCount(id);   // 조회수 증가

    FreeTalk freeTalk = ftDAO.getContent(id);

    session.setAttribute("freeTalk", freeTalk);

    Vector<FreeTalkComment> list = null;
%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/style.css">
    <title>KBU BOOK</title>
</head>
<body>
<h1 class="text-center">KBU BOOK</h1>
<hr style="background: #b2dba1">
<h3 class="text-center">게시글</h3><br>
<div class="container" style="margin-bottom: 30px">
    <table class="table table-bordered" style="border: 2px solid #b2dba1">
        <thead>
        <tr>
            <th colspan="2" style="font-size: 20px; border: 2px solid #b2dba1">&nbsp;&nbsp;<%=freeTalk.getTitle()%>
            </th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td colspan="2">
                작성자 : <%=freeTalk.getWriter()%>&nbsp;&nbsp;&nbsp;&nbsp;
                작성일 : <%=freeTalk.getDate()%>&nbsp;&nbsp;&nbsp;&nbsp;
                조회수 : <%=freeTalk.getCount()%>&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
        </tr>
        </tbody>
        <tfoot>
        <tr>
            <td style="padding: 20px; text-align: left; border: 2px solid #b2dba1"><%=freeTalk.getContent()%>
            </td>
        </tr>
        </tfoot>
    </table>
    <form method="post" action="viewAction.jsp?id=<%=id%>">
        <div class="comment-form">
            <div class="user-info-form" id="wrapper">
                <div id="cell">
                    <%=userId%>
                </div>
            </div>
            <br>
            <textarea name="comment" style="resize: none; width: 100%; height: 100px; padding: 13px;"
                      placeholder="댓글을 입력하세요."></textarea>
            <br>
            <br>
            <input type="submit" class="btn btn-success pull-right" value="댓글작성">
            <input type="hidden" name="writer" value=<%=session.getAttribute("session_id")%>>
            <input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>">
        </div>
    </form>
    <br>
    <div class="comment_box">
        <ul style="list-style: none;">
            <%
                list = ftDAO.getCommentList(id);  // DB 에서 글 목록을 받아서 리스트에 저장
                if (!list.isEmpty()) {   // 리스트가 비어 있을
                    for (FreeTalkComment ftk : list) {
            %>
            <li>

                <div class="cmt_nickbox"><%=ftk.getWriter()%>
                </div>
                <div class="cmt_txtbox"><%=ftk.getContent()%>
                </div>
                <div class="pull-right"><%=ftk.getIp()%>
                </div>
            </li>
            <%}%>
            <%}%>
        </ul>
    </div>
    <div class="pull-right">
        <a href="freeTalk.jsp" class="btn btn-success">글목록</a>
        <% if (freeTalk.getWriter().equals(userId)) { // 작성자와 로그인 한사람이 같을 경우 글수정, 글삭제 버튼 보이게 하기 %>
        <a href="update.jsp?id=<%=id%>" class="btn btn-primary">글수정</a>
        <a href="delete.jsp?id=<%=id%>" class="btn btn-danger" onclick="return confirm('글을 삭제하시겠습니까?')">글삭제</a>
        <%}%>
    </div>
</div>
</body>
</html>
<%
    } else {
        out.print("<script>alert('로그인을 해주세요.'); location.href='../index.jsp';</script>");
    }
%>