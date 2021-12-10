<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="edu.skku.wpl2021f.board.BoardDAO" %>
<%@ page import="edu.skku.wpl2021f.board.BoardDTO" %>
<%@ page import="edu.skku.wpl2021f.card.CardDTO"%>
<%@ page import="edu.skku.wpl2021f.card.CardDAO"%>
<%@ page import="edu.skku.wpl2021f.comment.CommentDTO"%>
<%@ page import="edu.skku.wpl2021f.comment.CommentDAO"%>
<%@ page import="java.util.ArrayList" %>
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
<style type="text/css">
	a, a:hover {
		color:white;
		text-decoration:none;
	}
</style>
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
	CommentDAO commentDAO = new CommentDAO();
	ArrayList<CommentDTO> list = commentDAO.getList(boardID, boardIdentity);
%>

	<!-- navbar -->
	<jsp:include page="nav.jsp" />

    <!-- content -->
    <section class="container">
		<c:if test="${empty user}">
			<jsp:include page="non-login-alter.jsp" />
		</c:if>

		<c:if test="${not empty user}">
			<div class="mt-5 mb-5">
				<table class="table" style="text-align:center;">
					<thead>
					<tr>
						<th colspan="3" style="text-align:center; font-size:20px;"><%= board.getBoardTitle() %></th>
					</tr>
					</thead>
					<tbody>
					<tr>
						<td style="width:200px;"><b>Author</b></td>
						<td colspan="2" style="text-align:left;"><%= board.getUserNickname() %></td>
					</tr>
					<tr>
						<td><b>Date</b></td>
						<td colspan="2" style="text-align:left;"><%= board.getBoardDate() %></td>
					</tr>
					<tr>
						<td><b>Content</b></td>
						<td colspan="2" style="min-height:200px; text-align:left;"><%= board.getBoardContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
					</tr>
					</tbody>
				</table>
				<%
					if (boardIdentity == 3) {
				%>
				<div class="card mt-5 mb-4" style="text-align:center; vertical-align:middle; width:600px; height:300px; margin:0 auto;">
					<h5 class="card-header card-title"><%= card.getCardTitle() %></h5>
					<p class="card-text"><%= card.getCardContent() %></p>
				</div>
				<%
					}
				%>
			</div>
			<div class="mb-5 row" style="margin:0 auto;">
				<div>
					<a href="${pageContext.request.contextPath}/board?boardIdentity=<%= boardIdentity %>" class="btn btn-success">List</a>
				</div>

				<c:set var="postWriterID" value="<%= board.getUserID() %>" />
				<c:if test="${user.getId() eq postWriterID}">
					<div style="margin-left:auto;">
						<a href="${pageContext.request.contextPath}/update?boardID=<%= boardID %>&boardIdentity=<%= boardIdentity %>" class="btn btn-success">Update</a>
						<a onclick="return confirm('Are you sure you want to delete?')" href="${pageContext.request.contextPath}/delete-action?boardID=<%= boardID %>&boardIdentity=<%= boardIdentity %>" class="btn btn-success">Delete</a>
					</div>
				</c:if>
			</div>
		</c:if>
    </section>
    
    <!-- comment -->
    <div class="container">
		<c:if test="${not empty user}">
			<form method="post" action="${pageContext.request.contextPath}/comment-action?userID=${user.getId()}&userNickname=${user.getNickname()}&boardID=<%= boardID %>&boardIdentity=<%= boardIdentity %>">
				<div class="card card-header">
					<i class="fa fa-comment">Comment</i>
				</div>
				<div class="card card-body mb-5">
					<ul class="list-group list-group-flush">
						<li class="list-group-item">
							<textarea class="form-control" name="commentContent" rows="3" placeholder="Leave a comment"></textarea>
							<input type="submit" class="btn btn-primary mt-3" value="Post">
						</li>
					</ul>
				</div>
			</form>
			<%
				for (int i = 0; i < list.size(); i++) {
			%>
			<div class="card card-header bg-light">
				<table>
					<tr>
						<td><font size="4"><%= list.get(i).getUserNickname() %></font></td>
					</tr>
					<tr>
						<td><font size="2"><%= list.get(i).getCommentDate() %>&nbsp
							<c:set var="commentWriterID" value="<%= list.get(i).getUserID() %>" />
							<c:if test="${user.getId() eq commentWriterID}">
								<span class="badge badge-dark hyperlink"><a onclick="return confirm('Are you sure you want to delete?')" href="${pageContext.request.contextPath}/comment-delete-action?boardID=<%= list.get(i).getBoardID() %>&boardIdentity=<%= list.get(i).getBoardIdentity() %>&commentID=<%= list.get(i).getCommentID() %>">X</a></span>
							</c:if>
						</font>
						</td>
					</tr>
				</table>
			</div>
			<div class="card card-body mb-2">
				<p class="card-text"><%= list.get(i).getCommentContent() %></p>
			</div>
			<%
				}
			%>
		</c:if>
	</div>

<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>
