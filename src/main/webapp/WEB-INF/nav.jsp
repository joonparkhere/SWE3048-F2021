<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Nav</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css">
</head>

<body>

<div class="navbar">
    <div style="width: 12vw"></div>

    <div class="navbar-wrap">
        <ul class="navbar-list">
            <li class="nav-element">
                <a class="text-dark font-weight-bold" href="${pageContext.request.contextPath}">Home</a>
            </li>
            <li class="nav-element">
                <a class="text-dark font-weight-bold" href="${pageContext.request.contextPath}/board?boardIdentity=1">Free Board</a>
            </li>
            <li class="nav-element">
                <a class="text-dark font-weight-bold" href="${pageContext.request.contextPath}/board?boardIdentity=2">Q&A</a>
            </li>
            <li class="nav-element">
                <a class="text-dark font-weight-bold" href="${pageContext.request.contextPath}/board?boardIdentity=3">Recruiting</a>
            </li>
        </ul>
    </div>

    <div class="btn-group" role="group" style="width: 12vw">
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

</body>
</html>