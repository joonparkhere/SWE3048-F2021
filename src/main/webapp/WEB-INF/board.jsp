<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="edu.skku.wpl2021f.board.BoardDAO" %>
<%@ page import="edu.skku.wpl2021f.board.BoardDTO" %>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/background.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/hyperlink.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/button.css">
<title>Study Group</title>
</head>
<body>
<%
	int boardIdentity = 1;
	if (request.getParameter("boardIdentity") != null) {
		boardIdentity = Integer.parseInt(request.getParameter("boardIdentity"));
	}
	int pageNumber = 1;
	if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
	BoardDAO boardDAO = new BoardDAO();
	ArrayList<BoardDTO> list = boardDAO.getList(pageNumber, boardIdentity);
%>

    <!-- navbar -->
    <jsp:include page="nav.jsp" />

    <!-- content -->
    <section class="container-fluid">
		<div class="mt-5 mb-3">
			<div class="boardBackground">
			<%
				if (boardIdentity == 1) {
			%>
				<h1>Free Board</h1>
			<%
				}
				else if (boardIdentity == 2) {
			%>
				<h1>Q&A</h1>
			<%
				}
				else {
			%>
				<h1>Recruiting</h1>
			<%
				}
			%>
			</div>
			<table class="table" style="text-align:center;">
				<thead>
					<th text-align:center;">#</th>
					<th text-align:center;">Title</th>
					<th text-align:center;">Author</th>
					<th text-align:center;">Date</th>
				</thead>
				<tbody>
				<%
					for (int i = 0; i < list.size(); i++) {
				%>
					<tr>
						<td>
							<%= list.get(i).getBoardID() %>
						</td>
						<td>
							<a href="${pageContext.request.contextPath}/view?boardID=<%= list.get(i).getBoardID() %>&boardIdentity=<%= boardIdentity %>">
								<%= list.get(i).getBoardTitle() %>
							</a>
						</td>
						<td>
							<%= list.get(i).getUserNickname() %>
						</td>
						<td>
							<%= list.get(i).getBoardDate() %>
						</td>
					</tr>
				<%
					}
				%>
				</tbody>
			</table>
		</div>
		<div class="create">
			<a href="${pageContext.request.contextPath}/post?boardIdentity=<%= boardIdentity %>" class="btn btn-success" role="button" aria-pressed="true">Create</a>
		</div>
    </section>

    <!-- pagination -->
    <nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center mt-5 mb-5">
			<%
				if (pageNumber == 1) {
			%>
			<li class="page-item disabled">
				<a class="page-link">Previous</a>
			<%
				} else {
			%>
			<li class="page-item">
				<a class="page-link" href="${pageContext.request.contextPath}/board?pageNumber=<%= pageNumber-1 %>&boardIdentity=<%= boardIdentity %>">Previous</a>
			<%
				}
			%>
			</li>
        	<li class="page-item active">
				<a class="page-link" href="${pageContext.request.contextPath}/board?pageNumber=<%= pageNumber %>&boardIdentity=<%= boardIdentity %>"><%= pageNumber %>
					<span class="sr-only">(current)</span>
				</a>
			</li>
			<%
				if (boardDAO.nextPage(pageNumber + 1, boardIdentity)) {
			%>
			<li class="page-item">
        		<a class="page-link" href="${pageContext.request.contextPath}/board?pageNumber=<%= pageNumber+1 %>&boardIdentity=<%= boardIdentity %>">Next</a>
			<%
				} else {
			%>
			<li class="page-item disabled">
				<a class="page-link">Next</a>
			<%
				}
			%>
			</li>
		</ul>
    </nav>
    
    <jsp:include page="foot.jsp" />

<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>
