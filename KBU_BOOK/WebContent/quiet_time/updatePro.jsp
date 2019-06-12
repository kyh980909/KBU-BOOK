<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"%>
<%@page import="quiet_time.Quiet_time"%>
<jsp:useBean id="bMgr" class="quiet_time.Quiet_timeMgr" />
<%
request.setCharacterEncoding("EUC-KR");
Quiet_time bean = (Quiet_time) session.getAttribute("bean");
String nowPage = request.getParameter("nowPage");
Quiet_time upBean = new Quiet_time();
upBean.setIdx(Integer.parseInt(request.getParameter("num")));
upBean.setMem_name(request.getParameter("name"));
upBean.setTitle(request.getParameter("title"));
upBean.setContent(request.getParameter("content"));
upBean.setPass(request.getParameter("pass"));
upBean.setIp(request.getParameter("ip"));
String upPass = upBean.getPass();
String inPass = bean.getPass();
if (upPass.equals(inPass)) {
bMgr.updateBoard(upBean);
String url = "read.jsp?nowPage=" + nowPage + "&num=" + upBean.getIdx();
response.sendRedirect(url);
} else {
out.println("<script>");
out.println("alert('입력하신 비밀번호가 아닙니다.');");
out.println("history.back();");
out.println("</script>");
}
%>