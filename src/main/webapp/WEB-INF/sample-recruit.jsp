<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Main</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <%--    <link rel="stylesheet" href="/css/.css">--%>
    <script type="application/javascript" src="/js/sample-recruit.js"></script>
</head>

<body>

<div>
    <jsp:include page="nav.jsp" />

    <div class="contents">
        <div>
            <input id="join-recruitId" type="text" placeholder="recruitId">
            <input id="join-title" type="text" placeholder="title">
            <input id="join-description" type="text" placeholder="description">
            <input id="join-leaderNickname" type="text" placeholder="leaderNickname">
            <input id="join-followerNickname" type="text" placeholder="followerNickname">
            <button id="join" type="button">Join</button>

            <br>

            <div id="join-success" class="alert alert-success" role="alert">
                Success to join!
            </div>
            <div id="join-fail" class="alert alert-danger" role="alert">
                Fail to join...
            </div>
        </div>
    </div>
</div>

</body>
</html>