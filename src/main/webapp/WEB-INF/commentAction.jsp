<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="edu.skku.wpl2021f.user.UserDAO" %>
<%@ page import="edu.skku.wpl2021f.comment.CommentDAO"%>
<%@ page import="edu.skku.wpl2021f.comment.CommentDTO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
	long userID = 0L;
	String userNickname = "";
	int boardID = Integer.parseInt(request.getParameter("boardID"));
	int boardIdentity = Integer.parseInt(request.getParameter("boardIdentity"));
	String commentContent = "";

	/* manage input variables */
	if (request.getParameter("userID") != "") {
		userID = Long.parseLong(request.getParameter("userID"));
	}
	if (request.getParameter("userNickname") != "") {
		userNickname = request.getParameter("userNickname");
	}
	if (request.getParameter("commentContent") != "") {
		commentContent = (String) request.getParameter("commentContent");
	}
	
	/* manage unfilled variables */
	if (commentContent == "") {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('There is something unfilled!');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}

	/* write comment with given variables */
	CommentDAO comment = new CommentDAO();
	int result = comment.write(boardID, boardIdentity, userID, userNickname, commentContent);
	if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('Failed!');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
	}
	else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("let contextPath = location.pathname.substring(0, location.pathname.indexOf('/', 2))");
		script.println("location.href = contextPath + '/view?boardID=" + boardID + "&boardIdentity=" + boardIdentity + "';");
		script.println("</script>");
		script.close();
	}
%>
