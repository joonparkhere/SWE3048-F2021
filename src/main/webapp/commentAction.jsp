<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="edu.skku.wpl2021f.user.UserDAO" %>
<%@ page import="edu.skku.wpl2021f.comment.CommentDAO"%>
<%@ page import="edu.skku.wpl2021f.comment.CommentDTO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
	String userID = (String) session.getAttribute("userID");
	int boardID = Integer.parseInt(request.getParameter("boardID"));
	int boardIdentity = Integer.parseInt(request.getParameter("boardIdentity"));
	String commentContent = "";
	
	if (request.getParameter("commentContent") != "") {
		commentContent = (String) request.getParameter("commentContent");
	}
	if (commentContent == "") {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('There is something unfilled!');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
	UserDAO user = new UserDAO();
	CommentDAO comment = new CommentDAO();
	int result = comment.write(boardID, boardIdentity, userID, user.findNickname(userID), commentContent);
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
		script.println("location.href = 'view.jsp?boardID="+boardID+"&boardIdentity="+boardIdentity+"';");
		script.println("</script>");
		script.close();
		return;
	}
%>
