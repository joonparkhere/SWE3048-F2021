<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="edu.skku.wpl2021f.board.BoardDTO"%>
<%@ page import="edu.skku.wpl2021f.board.BoardDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
	int boardID = Integer.parseInt(request.getParameter("boardID"));
	int boardIdentity = Integer.parseInt(request.getParameter("boardIdentity"));
	
	/* delete the post */
	BoardDAO boardDAO = new BoardDAO();
	int result = boardDAO.delete(boardID, boardIdentity);
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
		script.println("location.href = contextPath + '/board?boardID=" + boardID + "&boardIdentity=" + boardIdentity + "';");
		script.println("</script>");
		script.close();
	}
%>
