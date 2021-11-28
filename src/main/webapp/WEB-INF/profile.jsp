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
    <link rel="stylesheet" href="/css/profile.css">
    <%--    <script type="application/javascript" src="/js/"></script>--%>
</head>

<body>

<div>
    <jsp:include page="nav.jsp" />

    <div class="contents">
        <c:if test="${empty user}">
            <div class="alert alert-danger" role="alert">
                <h4 class="alert-heading">Not Logged in!</h4>
                <p>This page needs user credentials, but You may not log-in yet.</p>
                <hr>
                <p class="mb-0">If you want to progress, please login.</p>
            </div>
        </c:if>

        <c:if test="${not empty user}">
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
                <div class="row-10">
                    <div class="tab-content" id="nav-tabContent">
                        <div class="tab-pane fade show active" id="list-progress" role="tabpanel" aria-labelledby="list-progress-list">
                            <div class="row">
                                <div class="col-sm-3 study-card">
                                    <div class="card">
                                        <div class="card-body">
                                            <h5 class="card-title">게시글 01 제목</h5>
                                            <p class="card-text">게시글 01 내용</p>
                                            <a href="#" class="btn btn-primary">자세히 보기</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-3 study-card">
                                    <div class="card">
                                        <div class="card-body">
                                            <h5 class="card-title">게시글 02 제목</h5>
                                            <p class="card-text">게시글 02 내용</p>
                                            <a href="#" class="btn btn-primary">자세히 보기</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-3 study-card">
                                    <div class="card">
                                        <div class="card-body">
                                            <h5 class="card-title">게시글 03 제목</h5>
                                            <p class="card-text">게시글 03 내용</p>
                                            <a href="#" class="btn btn-primary">자세히 보기</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-3 study-card">
                                    <div class="card">
                                        <div class="card-body">
                                            <h5 class="card-title">게시글 04 제목</h5>
                                            <p class="card-text">게시글 04 내용</p>
                                            <a href="#" class="btn btn-primary">자세히 보기</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-3 study-card">
                                    <div class="card">
                                        <div class="card-body">
                                            <h5 class="card-title">게시글 05 제목</h5>
                                            <p class="card-text">게시글 05 내용</p>
                                            <a href="#" class="btn btn-primary">자세히 보기</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-3 study-card">
                                    <div class="card">
                                        <div class="card-body">
                                            <h5 class="card-title">게시글 06 제목</h5>
                                            <p class="card-text">게시글 06 내용</p>
                                            <a href="#" class="btn btn-primary">자세히 보기</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-3 study-card">
                                    <div class="card">
                                        <div class="card-body">
                                            <h5 class="card-title">게시글 07 제목</h5>
                                            <p class="card-text">게시글 07 내용</p>
                                            <a href="#" class="btn btn-primary">자세히 보기</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-3 study-card">
                                    <div class="card">
                                        <div class="card-body">
                                            <h5 class="card-title">게시글 08 제목</h5>
                                            <p class="card-text">게시글 08 내용</p>
                                            <a href="#" class="btn btn-primary">자세히 보기</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="tab-pane fade" id="list-complete" role="tabpanel" aria-labelledby="list-complete-list">

                        </div>
                    </div>
                </div>
            </div>

<%--            <ul class="nav nav-tabs">--%>
<%--                <li class="nav-item">--%>
<%--                    <a class="nav-link active" id="tab-home-tab" href="#tab-home">Home</a>--%>
<%--                </li>--%>
<%--                <li class="nav-item">--%>
<%--                    <a class="nav-link" id="tab-setting-tab" href="#tab-setting">Link</a>--%>
<%--                </li>--%>
<%--                <li class="nav-item">--%>
<%--                    <a class="nav-link disabled" href="#">Disabled</a>--%>
<%--                </li>--%>
<%--            </ul>--%>


<%--            <div class="row">--%>
<%--                <div class="col-4">--%>
<%--                    <div class="list-group" id="list-tab" role="tablist">--%>
<%--                        <a class="list-group-item list-group-item-action active" id="list-home-list" data-toggle="list" href="#list-home" role="tab" aria-controls="home">Home</a>--%>
<%--                        <a class="list-group-item list-group-item-action" id="list-profile-list" data-toggle="list" href="#list-profile" role="tab" aria-controls="profile">Profile</a>--%>
<%--                        <a class="list-group-item list-group-item-action" id="list-messages-list" data-toggle="list" href="#list-messages" role="tab" aria-controls="messages">Messages</a>--%>
<%--                        <a class="list-group-item list-group-item-action" id="list-settings-list" data-toggle="list" href="#list-settings" role="tab" aria-controls="settings">Settings</a>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="col-8">--%>
<%--                    <div class="tab-content" id="nav-tabContent">--%>
<%--                        <div class="tab-pane fade show active" id="list-home" role="tabpanel" aria-labelledby="list-home-list">Home Contents</div>--%>
<%--                        <div class="tab-pane fade" id="list-profile" role="tabpanel" aria-labelledby="list-profile-list">...</div>--%>
<%--                        <div class="tab-pane fade" id="list-messages" role="tabpanel" aria-labelledby="list-messages-list">...</div>--%>
<%--                        <div class="tab-pane fade" id="list-settings" role="tabpanel" aria-labelledby="list-settings-list">Settings Contents</div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
        </c:if>
    </div>

</div>

</body>
</html>