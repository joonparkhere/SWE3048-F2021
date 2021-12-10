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
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('Sign in to update a post!');");
		script.println("location.href = 'login.jsp");
		script.println("</script>");
		script.close();
		return;
	}
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
	if (!userID.equals(board.getUserID())) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('No permission allowed!');");
		script.println("location.href = 'board.jsp");
		script.println("</script>");
		script.close();
		return;
	}
%>

<!-- navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <a class="navbar-brand" href="WEB-INF/board.jsp"><b>Study Group</b></a>
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
				<a class="dropdown-item" href="logoutAction.jsp">Sign out</a>
            </div>
          </li>
          <li class="nav-item active">
            <a class="nav-link" href="#">Free Board<span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Q&A</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Recruiting</a>
          </li>
         </ul>
      </div>
    </nav>

    <!-- content -->
    <section class="container">      
      <div class="mt-5">
      	<form method="post" action="WEB-INF/updateAction.jsp?boardID=<%= boardID %>&boardIdentity=<%= boardIdentity %>">
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
    </section>

<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>
