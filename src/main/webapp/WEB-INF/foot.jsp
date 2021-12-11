<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Foot</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/foot.css">
</head>

<body>

<div class="bg-dark foot">
    <div class="text-light foot-copyright">
        Copyright ©2021 All rights reserved |
        <a class="text-light" href="https://github.com/joonparkhere">joonparkhere</a>
        &
        <a class="text-light" href="https://github.com/HyeonjinChoi">HyeonjinChoi</a>
    </div>

    <div class="foot-wrap">
        <ul class="foot-list">
            <li>
                <a class="text-light" href="${pageContext.request.contextPath}/board?boardIdentity=1">Free Board</a>
            </li>
            <li>
                <a class="text-light" href="${pageContext.request.contextPath}/board?boardIdentity=2">Q&A</a>
            </li>
            <li>
                <a class="text-light" href="${pageContext.request.contextPath}/board?boardIdentity=3">Recruiting</a>
            </li>
        </ul>
    </div>
</div>

</body>
</html>