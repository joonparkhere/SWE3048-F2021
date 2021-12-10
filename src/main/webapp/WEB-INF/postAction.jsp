<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="edu.skku.wpl2021f.user.UserDAO" %>
<%@ page import="edu.skku.wpl2021f.board.BoardDTO"%>
<%@ page import="edu.skku.wpl2021f.board.BoardDAO"%>
<%@ page import="edu.skku.wpl2021f.card.CardDTO"%>
<%@ page import="edu.skku.wpl2021f.card.CardDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
	String userID = (String) session.getAttribute("userID");
	int boardIdentity = Integer.parseInt(request.getParameter("boardIdentity"));
	String boardTitle = "";
	String boardContent = "";
	String cardTitle = "";
	String cardContent = "";
	
	if (request.getParameter("boardTitle") != "") {
		boardTitle = (String) request.getParameter("boardTitle");
	}
	if (request.getParameter("boardContent") != "") {
		boardContent = (String) request.getParameter("boardContent");
	}
	if (request.getParameter("cardTitle") != "") {
		cardTitle = (String) request.getParameter("cardTitle");
	}
	if (request.getParameter("cardContent") != "") {
		cardContent = (String) request.getParameter("cardContent");
	}
	if (boardIdentity == 3) {
		if (boardTitle == "" || boardContent == "" || cardTitle == "" || cardContent == "") {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('There is something unfilled!');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
			return;
		}
	}
	else {
		if (boardTitle == "" || boardContent == "") {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('There is something unfilled!');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
			return;
		}
	}
	
	BoardDAO board = new BoardDAO();
	UserDAO user = new UserDAO();
	int boardResult = board.write(boardIdentity, boardTitle, userID, user.findNickname(userID), boardContent);
	if (boardIdentity == 3) {
		CardDAO card = new CardDAO();
		int cardResult = card.write(board.getNext(boardIdentity)-1, cardTitle, cardContent);
		if (boardResult == -1 || cardResult == -1) {
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
			script.println("location.href = 'board.jsp?boardIdentity="+boardIdentity+"';");
			script.println("</script>");
			script.close();
			return;
		}
	}
	else {
		if (boardResult == -1) {
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
			script.println("location.href = 'board.jsp?boardIdentity="+boardIdentity+"';");
			script.println("</script>");
			script.close();
			return;
		}
	}
%>
