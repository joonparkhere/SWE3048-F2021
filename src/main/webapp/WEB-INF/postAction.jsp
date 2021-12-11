<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="edu.skku.wpl2021f.user.UserDAO" %>
<%@ page import="edu.skku.wpl2021f.board.BoardDTO"%>
<%@ page import="edu.skku.wpl2021f.board.BoardDAO"%>
<%@ page import="edu.skku.wpl2021f.card.CardDTO"%>
<%@ page import="edu.skku.wpl2021f.card.CardDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
	long userID = 0L;
	String userNickname = "";
	int boardIdentity = Integer.parseInt(request.getParameter("boardIdentity"));
	String boardTitle = "";
	String boardContent = "";
	String cardTitle = "";
	String cardContent = "";

	if (request.getParameter("userID") != "") {
		userID = Long.parseLong(request.getParameter("userID"));
	}
	if (request.getParameter("userNickname") != "") {
		userNickname = request.getParameter("userNickname");
	}
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
	int boardResult = board.write(boardIdentity, boardTitle, userID, userNickname, boardContent);
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
		}
		else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("let contextPath = location.pathname.substring(0, location.pathname.indexOf('/', 2))");
			script.println("location.href = contextPath + '/board?boardIdentity="+boardIdentity+"';");
			script.println("</script>");
			script.close();
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
		}
		else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("let contextPath = location.pathname.substring(0, location.pathname.indexOf('/', 2))");
			script.println("location.href = contextPath + '/board?boardIdentity=" + boardIdentity + "';");
			script.println("</script>");
			script.close();
		}
	}
%>
