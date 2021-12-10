<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="edu.skku.wpl2021f.comment.CommentDAO"%>
<%@ page import="edu.skku.wpl2021f.comment.CommentDTO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
	int boardID = Integer.parseInt(request.getParameter("boardID"));
	int boardIdentity = Integer.parseInt(request.getParameter("boardIdentity"));
	int commentID = Integer.parseInt(request.getParameter("commentID"));
	
	CommentDAO comment = new CommentDAO();
	int result = comment.delete(boardID, boardIdentity, commentID);
	if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('Failed!');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("let contextPath = location.pathname.substring(0, location.pathname.indexOf('/', 2))");
		script.println("location.href = contextPath + '/view?boardID=" + boardID + "&boardIdentity=" + boardIdentity+"';");
		script.println("</script>");
		script.close();
//		return;
	}
%>
