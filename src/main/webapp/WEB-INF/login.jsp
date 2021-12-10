<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Login</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
</head>

<body>

<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Social Login</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="login-container modal-body">
                <ul class="list-group">
                    <li class="list-group-item">
                        <a class="login nav-link" href="${pageContext.request.contextPath}/oauth2/authorization/github">
                            <div class="login-img">
                                <img src="${pageContext.request.contextPath}/img/GitHub-Mark-120px-plus.png" width="32px" height="32px" alt="GitHub Mark">
                            </div>
                            <div class="login-text">
                                GitHub Login
                            </div>
                        </a>
                    </li>
                    <li class="list-group-item">
                        <a class="login nav-link" href="${pageContext.request.contextPath}/oauth2/authorization/google">
                            <div class="login-img">
                                <img src="${pageContext.request.contextPath}/img/Google-Mark-1000.png" width="32px" height="32px" alt="Google Mark">
                            </div>
                            <div class="login-text">
                                Google Login
                            </div>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>

</body>
</html>