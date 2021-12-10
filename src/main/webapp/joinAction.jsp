<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="edu.skku.wpl2021f.user.UserDTO"%>
<%@ page import="edu.skku.wpl2021f.user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
	String userID = "";
	String userPassword = "";
	String userNickname = "";
	if (request.getParameter("userID") != "") {
		userID = (String) request.getParameter("userID");
	}
	if (request.getParameter("userPassword") != "") {
		userPassword = (String) request.getParameter("userPassword");
	}
	if (request.getParameter("userNickname") != "") {
		userNickname = (String) request.getParameter("userNickname");
	}
	if (userID == "" || userPassword == "" || userNickname == "") {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('There is something unfilled!');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	UserDAO userDAO = new UserDAO();
	int result = userDAO.join(userID, userPassword, userNickname);
	if (result == 1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('You signed up successfully!');");
		script.println("location.href = 'board.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
%>
