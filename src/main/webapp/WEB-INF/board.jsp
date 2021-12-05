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
<title>Study Group</title>
</head>
<body>
<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	int pageNumber = 1;
	if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
%>

<!-- navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <a class="navbar-brand" href="index.jsp"><b>Study Group</b></a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              My Page
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
<%
	if (userID == null) {
%>
              <a class="dropdown-item" href="join.jsp">Sign up</a>
              <a class="dropdown-item" href="login.jsp">Sign in</a>
<%
	}
	else {
%>
              <a class="dropdown-item" href="logoutAction.jsp">Sign out</a>
<%
	}
%>
            </div>
          </li>
          <li class="nav-item active">
            <a class="nav-link" href="#">Community<span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Q&A</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Front-End
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="#">HTML</a>
              <a class="dropdown-item" href="#">CSS</a>
              <a class="dropdown-item" href="#">JavaScript</a>
              <a class="dropdown-item" href="#">JQuery</a>
            </div>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Back-End
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="#">PHP</a>
              <a class="dropdown-item" href="#">JSP</a>
              <a class="dropdown-item" href="#">Node.js</a>
              <a class="dropdown-item" href="#">MySQL</a>
            </div>
          </li>
         </ul>
      </div>
    </nav>

    <!-- content -->
    <section class="container">
      
      <div class="row mt-5 mb-3">
      	<table class="table" style="text-align:center;">
      		<thead>
      			<th text-align:center;">#</th>
      			<th text-align:center;">Title</th>
      			<th text-align:center;">Author</th>
      			<th text-align:center;">Date</th>
      		</thead>
      		<tbody>
<%
	BoardDAO boardDAO = new BoardDAO();
	ArrayList<BoardDTO> list = boardDAO.getList(pageNumber);
	for (int i = 0; i < list.size(); i++) {
%>
				<tr>
					<td><%= list.get(i).getBoardID() %></td>
					<td><a href="view.jsp?boardID=<%= list.get(i).getBoardID() %>"><%= list.get(i).getBoardTitle() %></a></td>
					<td><%= list.get(i).getUserNickname() %></td>
					<td><%= list.get(i).getBoardDate() %></td>
				</tr>
<%
	}
%>
      		</tbody>
      	</table>
      </div>
      
      <a href="post.jsp" class="btn btn-success" role="button" aria-pressed="true">Create</a>
    </section>

    <!-- pagination -->
    <nav aria-label="Page navigation example">
      <ul class="pagination justify-content-center mt-5">
<% 
	if (pageNumber == 1) {
%>
        <li class="page-item disabled">
        	<a class="page-link" href="#">Previous</a>
<%
	}
	else {
%>
        <li class="page-item">
        	<a class="page-link" href="index.jsp?pageNumber=<%= pageNumber - 1%>">Previous</a>
<%
	}
%>
        </li>
        <li class="page-item active"><a class="page-link" href="#"><%= pageNumber %><span class="sr-only">(current)</span></a></li>
<% 
	if (boardDAO.nextPage(pageNumber + 1)) {
%> 
        <li class="page-item">
        	<a class="page-link" href="index.jsp?pageNumber=<%= pageNumber + 1%>">Next</a>
<%
	}
	else {
%>
        <li class="page-item disabled">
        	<a class="page-link" href="#">Next</a>
<%
	}
%>
      </ul>
    </nav>

<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>
