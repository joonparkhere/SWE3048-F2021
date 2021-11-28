<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<%--    <title>Login</title>--%>
<%--    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">--%>
<%--    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>--%>
<%--    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>--%>
<%--    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>--%>
    <link rel="stylesheet" href="/css/login.css">
<%--    <script type="application/javascript" src="/js/"></script>--%>
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
                        <a class="login nav-link" href="/oauth2/authorization/github">
                            <div class="login-img">
                                <img src="/img/GitHub-Mark-120px-plus.png" width="32px" height="32px" alt="GitHub Mark">
                            </div>
                            <div class="login-text">
                                GitHub Login
                            </div>
                        </a>
                    </li>
                    <li class="list-group-item">
                        <a class="login nav-link" href="/oauth2/authorization/google">
                            <div class="login-img">
                                <img src="/img/Google-Mark-1000.png" width="32px" height="32px" alt="Google Mark">
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