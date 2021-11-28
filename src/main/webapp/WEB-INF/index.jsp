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
    <link rel="stylesheet" href="/css/index.css">
<%--    <script type="application/javascript" src="/js/"></script>--%>
</head>

<body>

<div>
    <jsp:include page="nav.jsp" />

    <div class="contents">
        <div class="card mb-3">
            <h5 class="card-header">
                <a class="nav-link" href="#">Recruiting Study</a>
            </h5>
            <div class="card-body">
                <div class="row">
                    <div class="col-sm-3">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">게시글 01 제목</h5>
                                <p class="card-text">게시글 01 내용</p>
                                <a href="#" class="btn btn-primary">자세히 보기</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">게시글 02 제목</h5>
                                <p class="card-text">게시글 02 내용</p>
                                <a href="#" class="btn btn-primary">자세히 보기</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">게시글 03 제목</h5>
                                <p class="card-text">게시글 03 내용</p>
                                <a href="#" class="btn btn-primary">자세히 보기</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">게시글 04 제목</h5>
                                <p class="card-text">게시글 04 내용</p>
                                <a href="#" class="btn btn-primary">자세히 보기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                <div class="card mb-3">
                    <h5 class="card-header">
                        <a class="nav-link" href="#">Free Board</a>
                    </h5>
                    <ul class="list-group">
                        <li class="list-group-item">
                            <a class="nav-link disabled" href="#">게시글 01 제목</a>
                        </li>
                        <li class="list-group-item">
                            <a class="nav-link disabled" href="#">게시글 02 제목</a>
                        </li>
                        <li class="list-group-item">
                            <a class="nav-link disabled" href="#">게시글 03 제목</a>
                        </li>
                        <li class="list-group-item">
                            <a class="nav-link disabled" href="#">게시글 04 제목</a>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="col-md-6">
                <div class="card mb-3">
                    <h5 class="card-header">
                        <a class="nav-link" href="#">Topic Board</a>
                    </h5>
                    <ul class="list-group">
                        <li class="list-group-item">
                            <a class="nav-link disabled" href="#">게시글 01 제목</a>
                        </li>
                        <li class="list-group-item">
                            <a class="nav-link disabled" href="#">게시글 02 제목</a>
                        </li>
                        <li class="list-group-item">
                            <a class="nav-link disabled" href="#">게시글 03 제목</a>
                        </li>
                        <li class="list-group-item">
                            <a class="nav-link disabled" href="#">게시글 04 제목</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

    </div>
</div>

</body>
</html>