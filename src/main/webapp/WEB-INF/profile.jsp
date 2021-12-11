<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Profile</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/web3/1.2.7-rc.0/web3.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/profile.css">
    <script type="module" src="${pageContext.request.contextPath}/js/profile.js"></script>
</head>

<body>

<div>
    <script type="text/javascript" charset="utf-8">
        sessionStorage.setItem("context-path", "${pageContext.request.contextPath}");
    </script>

    <jsp:include page="nav.jsp" />

    <div class="contents">
        <c:if test="${empty user}">
            <jsp:include page="non-login-alter.jsp" />
        </c:if>

        <c:if test="${not empty user}">
            <h2 id="nickname">${user.getNickname()}</h2>

            <div class="col">
                <div class="row-2">
                    <ul class="nav nav-tabs" id="list-tab" role="tablist">
                        <li class="nav-item">
                            <a class="list-group-item list-group-item-action active row-3" id="list-progress-list" data-toggle="list" href="#list-progress" role="tab" aria-controls="progress">In Progress</a>
                        </li>
                        <li class="nav-item">
                            <a class="list-group-item list-group-item-action row-3" id="list-complete-list" data-toggle="list" href="#list-complete" role="tab" aria-controls="complete">Complete</a>
                        </li>
                    </ul>
                </div>

                <div id="inquiryStudy-fail" class="alert alert-danger" role="alert">
                    Fail to inquiry...
                </div>

                <div class="row-10">
                    <div class="tab-content" id="nav-tabContent">
                        <div class="tab-pane fade show active" id="list-progress" role="tabpanel" aria-labelledby="list-progress-list">
                            <div class="row" id="progress-contents"></div>
                        </div>

                        <div class="tab-pane fade" id="list-complete" role="tabpanel" aria-labelledby="list-complete-list">
                            <div class="row" id="complete-contents"></div>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>
    </div>

    <jsp:include page="foot.jsp" />
</div>

</body>
</html>