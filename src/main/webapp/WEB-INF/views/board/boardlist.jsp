<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<%@include file="../component/header.jsp" %>
<%@include file="../component/nav.jsp" %>
<div id="section">

    <div class="container" id="list">

        <table class="table table-dark table-striped table-hover text-center">
            <tr>
                <th>글번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성시간</th>
                <th>조회수</th>
            </tr>
            <c:forEach items="${boardList}" var="board">
                <tr>
                    <td>${board.id}</td>
                    <td><a href="/board?id=${board.id}&page=${paging.page}&q=${q}&type=${type}">${board.boardTitle}</a>
                    </td>
                    <td>${board.boardWriter}</td>
                    <td>${board.createdAt}</td>
                    <td>${board.boardHits}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
<%@include file="../component/footer.jsp" %>
</body>
</html>
