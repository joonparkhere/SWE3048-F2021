<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Nav</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css">
</head>

<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="${pageContext.request.contextPath}">Study Group</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/board?boardIdentity=1">Free Board</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/board?boardIdentity=2">Q&A</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/board?boardIdentity=3">Recruiting</a>
            </li>
        </ul>

        <div class="btn-group" role="group" aria-label="Profile Control">
            <c:if test="${empty user}">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#loginModal">Login</button>
                <jsp:include page="login.jsp" />
            </c:if>

            <c:if test="${not empty user}">
                <a type="button" class="btn btn-primary" href="${pageContext.request.contextPath}/profile">Profile</a>
                <a type="button" class="btn btn-outline-primary" href="${pageContext.request.contextPath}/logout">Logout</a>
            </c:if>
        </div>
    </div>
</nav>

</body>
</html>