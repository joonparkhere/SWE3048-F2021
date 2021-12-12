<%@ page import="edu.skku.wpl2021f.board.BoardDAO" %>
<%@ page import="edu.skku.wpl2021f.board.BoardDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="edu.skku.wpl2021f.card.CardDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="edu.skku.wpl2021f.card.CardDAO" %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">
</head>

<body>
<%
    // get posts from each board for preview
    BoardDAO boardDAO = new BoardDAO();
    List<BoardDTO> freeBoardList = boardDAO.getList(1, 1);
    List<BoardDTO> qnaBoardList = boardDAO.getList(1, 2);
    List<BoardDTO> recruitBoardList = boardDAO.getList(1, 3);

    // get additional information at a recruit board post
    CardDAO cardDAO = new CardDAO();
    List<CardDTO> cardList = new ArrayList<>();
    for (BoardDTO boardDTO : recruitBoardList) {
        CardDTO cardDTO = cardDAO.getCard(boardDTO.getBoardID());
        cardList.add(cardDTO);
    }
%>

<div>
    <div class="intro">
        <jsp:include page="nav.jsp" />

        <div class="welcome-message">
            <p>👀 Study With Us!</p>
        </div>

        <div id="intro-slide" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <div class="carousel-caption d-none d-md-block">
                        <h1>Share your interest!</h1>
                        <p>Post current study interest in Free-board or QnA-board. There are many users who have same interests. Communicate with users and Learn about it!</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="carousel-caption d-none d-md-block">
                        <h1>Develop your interest!</h1>
                        <p>Recruit study member who want to participate in group for studying members' common interests. With followers or leader, keep learn about your interest!</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="carousel-caption d-none d-md-block">
                        <h1>Certificate your interest!</h1>
                        <p>When complete study, you can issue certification as a prove what you studied. Thanks to blockchain, you can own NFT in your crypto wallet!</p>
                    </div>
                </div>
            </div>
            <a class="carousel-control-prev" href="#intro-slide" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#intro-slide" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>


    <div class="contents">
        <div class="card mb-3">
            <h5 class="card-header">
                <a class="nav-link" href="${pageContext.request.contextPath}/board?boardIdentity=3">Develop your interest</a>
            </h5>
            <div class="card-body">
                <div class="row">
                    <%
                        // add study information for preview up to 8 elements
                        int cardListLen = cardList.size();
                        if (cardListLen == 0) {
                    %>
                    <div class="col-sm-3 recruit-card">
                        <div class="card">
                            <div class="card-body">
                                There is no recruiting study
                            </div>
                        </div>
                    </div>
                    <%
                        } else {
                            if (cardListLen > 8) cardListLen = 8;

                            for (int i = 0; i < cardListLen; i++) {
                                CardDTO card = cardList.get(i);
                    %>
                    <div class="col-sm-3 recruit-card">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title"><%= card.getCardTitle() %></h5>
                                <p class="card-text card-content-mt recruit-description"><%= card.getCardContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></p>
                                <a href="${pageContext.request.contextPath}/view?boardID=<%= card.getBoardID() %>&boardIdentity=3" class="btn btn-primary">Details</a>
                            </div>
                        </div>
                    </div>
                    <%
                            }
                        }
                    %>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                <div class="card mb-3">
                    <h5 class="card-header">
                        <a class="nav-link" href="${pageContext.request.contextPath}/board?boardIdentity=1">Talk about your interest</a>
                    </h5>
                    <ul class="list-group">
                        <%
                            // add free board posts for preview up to 5 elements
                            int freeBoardListLen = freeBoardList.size();
                            if (freeBoardListLen == 0) {
                        %>
                        <li class="list-group-item">
                            <a class="nav-link disabled">There is no post</a>
                        </li>
                        <%
                        } else {
                            if (freeBoardListLen > 5) freeBoardListLen = 5;

                            for (int i = 0; i < freeBoardListLen; i++) {
                                BoardDTO board = freeBoardList.get(i);
                        %>
                        <li class="list-group-item">
                            <a class="nav-link disabled" href="${pageContext.request.contextPath}/view?boardID=<%= board.getBoardID() %>&boardIdentity=1"><%= board.getBoardTitle() %></a>
                        </li>
                        <%
                                }
                            }
                        %>
                    </ul>
                </div>
            </div>

            <div class="col-md-6">
                <div class="card mb-3">
                    <h5 class="card-header">
                        <a class="nav-link" href="${pageContext.request.contextPath}/board?boardIdentity=2">Discuss about your interest</a>
                    </h5>
                    <ul class="list-group">
                        <%
                            // add QnA board posts for preview up to five elements
                            int qnaBoardListLen = qnaBoardList.size();
                            if (qnaBoardListLen == 0) {
                        %>
                        <li class="list-group-item">
                            <a class="nav-link disabled">There is no post</a>
                        </li>
                        <%
                        } else {
                            if (qnaBoardListLen > 5) qnaBoardListLen = 5;

                            for (int i = 0; i < qnaBoardListLen; i++) {
                                BoardDTO board = qnaBoardList.get(i);
                        %>
                        <li class="list-group-item">
                            <a class="nav-link disabled" href="${pageContext.request.contextPath}/view?boardID=<%= board.getBoardID() %>&boardIdentity=2"><%= board.getBoardTitle() %></a>
                        </li>
                        <%
                                }
                            }
                        %>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="foot.jsp" />
</div>

</body>
</html>