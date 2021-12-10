<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="edu.skku.wpl2021f.board.BoardDAO" %>
<%@ page import="edu.skku.wpl2021f.board.BoardDTO" %>
<%@ page import="edu.skku.wpl2021f.card.CardDAO" %>
<%@ page import="edu.skku.wpl2021f.card.CardDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<title>Study Group</title>
</head>
<body>
<%
	int boardID = 0;
	if (request.getParameter("boardID") != null) {
		boardID = Integer.parseInt(request.getParameter("boardID"));
	}
	int boardIdentity = 1;
	if (request.getParameter("boardIdentity") != null) {
		boardIdentity = Integer.parseInt(request.getParameter("boardIdentity"));
	}
	BoardDTO board = new BoardDAO().getBoard(boardID, boardIdentity);
	CardDTO card = new CardDAO().getCard(boardID);
%>

	<!-- navbar -->
	<jsp:include page="nav.jsp" />

    <!-- content -->
    <section class="container">
		<c:if test="${empty user}">
			<jsp:include page="non-login-alter.jsp" />
		</c:if>

		<c:set var="writerID" value="<%= board.getUserID() %>" />
		<c:if test="${user.getId() ne writerID}">
			<jsp:include page="non-proper-credential-alter.jsp" />
		</c:if>

		<c:if test="${not empty user}">
			<div class="mt-5">
				<form method="post" action="${pageContext.request.contextPath}/update-action?boardID=<%= boardID %>&boardIdentity=<%= boardIdentity %>">
					<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
						<thead>
						<tr>
							<th style="background-color:#eeeeee; text-align:center;">Format</th>
						</tr>
						</thead>
						<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="Title" name="boardTitle" maxlength="50" value="<%= board.getBoardTitle() %>"></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="Content" name="boardContent" maxlength="2048" style="height: 400px;"><%= board.getBoardContent() %></textarea></td>
						</tr>
						</tbody>
					</table>
					<%
						if (boardIdentity == 3) {
					%>
					<div class="mt-2 mb-5" style="text-align:center; vertical-align:middle; width:600px; height:300px; margin:0 auto;">
						<input type="text" class="form-control card-header card-title" placeholder="Card Title" name="cardTitle" maxlength="50" value="<%= card.getCardTitle() %>">
						<textarea class="form-control card-text" placeholder="Card Content" name="cardContent" maxlength="2048" style="height: 250px;"><%= card.getCardContent() %></textarea>
					</div>
					<%
						}
					%>
					<input type="submit" class="btn btn-success pull-right" value="Update">
				</form>
			</div>
		</c:if>
    </section>

<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>
