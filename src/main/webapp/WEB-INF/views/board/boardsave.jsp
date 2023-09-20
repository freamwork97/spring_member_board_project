<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>게시글 작성</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <style>
        #section {
            margin: auto;
        }
    </style>
</head>
<body>
<%@include file="../component/header.jsp" %>
<%@include file="../component/nav.jsp" %>
<div class="card" id="section" style="width: 80rem;">
    <div class="card-header">
        게시글작성
    </div>
    <ul class="list-group list-group-flush">
        <form action="/board/write" method="post" enctype="multipart/form-data">
            <li class="list-group-item">
                <input type="text" class="form-control" id="boardTitle" name="boardTitle" placeholder="제목을 입력하세요"
                       required>
            </li>
            <li class="list-group-item">
                <textarea class="form-control" id="boardContents" name="boardContents" rows="5" required></textarea>
            </li>
            <li class="list-group-item">
                <input type="file" class="form-control" id="boardFile" name="boardFile" multiple>
            </li>
            <li class="list-group-item">
                <button type="submit" class="btn btn-primary">작성</button>
            </li>
        </form>
    </ul>
</div>
<%@include file="../component/footer.jsp" %>
</body>
</html>
