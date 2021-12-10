<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="edu.skku.wpl2021f.board.BoardDTO"%>
<%@ page import="edu.skku.wpl2021f.board.BoardDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
	String userID = (String) session.getAttribute("userID");
	int boardID = Integer.parseInt(request.getParameter("boardID"));
	int boardIdentity = Integer.parseInt(request.getParameter("boardIdentity"));
	BoardDTO board = new BoardDAO().getBoard(boardID, boardIdentity);
	
	if (!userID.equals(board.getUserID())) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('No permission allowed!');");
		script.println("location.href = 'board.jsp?boardID=" + boardID + "&boardIdentity=" + boardIdentity + "';");
		script.println("</script>");
		script.close();
		return;
	}
	
	BoardDAO boardDAO = new BoardDAO();
	int result = boardDAO.delete(boardID, boardIdentity);
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
		script.println("location.href = 'board.jsp?boardID=" + boardID + "&boardIdentity=" + boardIdentity + "';");
		script.println("</script>");
		script.close();
		return;
	}
%>
