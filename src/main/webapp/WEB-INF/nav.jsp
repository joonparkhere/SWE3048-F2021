<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Nav</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/nav.js"></script>
</head>

<body>

<jsp:include page="login.jsp" />

<button class="btn btn-primary" id="drawer-btn" onclick="openSideDrawer()">
    <i class="fa fa-bars fa-2x" aria-hidden="true"></i>
</button>

<div id="side-drawer" class="position-fixed">
    <div class="h-100 bg-white">
        <div class="drawer-profile">
            <c:if test="${empty user}">
                <h3>Please Log-in!</h3>
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#loginModal">Login</button>
            </c:if>
            <c:if test="${not empty user}">
                <h3>Hello, ${user.getNickname()}</h3>
                <div class="btn-group" role="group">
                        <a type="button" class="btn btn-primary" href="${pageContext.request.contextPath}/profile">Profile</a>
                        <a type="button" class="btn btn-outline-primary" href="${pageContext.request.contextPath}/logout">Logout</a>
                </div>
            </c:if>
        </div>
        <hr>
        <div class="drawer-nav">
            <ul class="list-group list-group-flush" onclick="closeSideDrawer()">
                <li class="list-group-item">
                    <a class="list-group-item list-group-item-action border-0 rounded-0" href="${pageContext.request.contextPath}">Home</a>
                </li>
                <li class="list-group-item">
                    <a class="list-group-item list-group-item-action border-0 rounded-0" href="${pageContext.request.contextPath}/board?boardIdentity=1">Free Board</a>
                </li>
                <li class="list-group-item">
                    <a class="list-group-item list-group-item-action border-0 rounded-0" href="${pageContext.request.contextPath}/board?boardIdentity=2">Q&A</a>
                </li>
                <li class="list-group-item">
                    <a class="list-group-item list-group-item-action border-0 rounded-0" href="${pageContext.request.contextPath}/board?boardIdentity=3">Recruiting</a>
                </li>
            </ul>
        </div>
    </div>
</div>
<div id="side-drawer-void" class="position-fixed d-none" onclick="closeSideDrawer()"></div>

</body>
</html>