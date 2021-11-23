<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Test Page</title>
    <link rel="stylesheet" href="/css/test.css">
    <script type="application/javascript" src="/js/test.js"></script>
</head>

<body>

<div class="container">
    <img src="/img/chrome.png" width="100px" height="100px" alt="sample-img">

    <table class="table table-hover table table-striped">
        <tr>
            <th>Name</th>
            <th>Age</th>
        </tr>

        <c:forEach items="${list}" var="post">
            <tr>
                <th>${post.getName()}</th>
                <th>${post.getAge()}</th>
            </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>