<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
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
	int boardIdentity = 1;
	if (request.getParameter("boardIdentity") != null) {
		boardIdentity = Integer.parseInt(request.getParameter("boardIdentity"));
	}
%>

    <!-- navbar -->
    <jsp:include page="nav.jsp" />

    <!-- content -->
    <section class="container">
        <c:if test="${empty user}">
            <jsp:include page="non-login-alter.jsp" />
        </c:if>

        <c:if test="${not empty user}">
            <div class="mt-5">
                <form method="post" action="${pageContext.request.contextPath}/post-action?userID=${user.getId()}&userNickname=${user.getNickname()}&boardIdentity=<%= boardIdentity %>">
                    <table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
                        <thead>
                        <tr>
                            <th style="background-color:#eeeeee; text-align:center;">Format</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td><input type="text" class="form-control" placeholder="Title" name="boardTitle" maxlength="50"></td>
                        </tr>
                        <tr>
                            <td><textarea class="form-control" placeholder="Content" name="boardContent" maxlength="2048" style="height: 400px;"></textarea></td>
                        </tr>
                        </tbody>
                    </table>
                    <%
                        if (boardIdentity == 3) {
                    %>
                    <div class="mt-2 mb-5" style="text-align:center; vertical-align:middle; width:600px; height:300px; margin:0 auto;">
                        <input type="text" class="form-control card-header card-title" placeholder="Card Title" name="cardTitle" maxlength="50">
                        <textarea class="form-control card-text" placeholder="Card Content" name="cardContent" maxlength="2048" style="height: 250px;"></textarea>
                    </div>
                    <%
                        }
                    %>
                    <input type="submit" class="btn btn-success pull-right" value="Post">
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