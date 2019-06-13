<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"%>
<jsp:useBean id="bMgr" class="quiet_time.Quiet_timeMgr" />
<%
request.setCharacterEncoding("EUC-KR");
bMgr.insertBoard(request);
response.sendRedirect("../quiet_time/list.jsp");
%>