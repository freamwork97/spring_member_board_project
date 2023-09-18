<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>게시글 작성</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<%@include file="../component/header.jsp" %>
<%@include file="../component/nav.jsp" %>
<div class="container" id="section">
    <h2>게시글 작성</h2>
    <form action="/board/write" method="post" enctype="multipart/form-data">
        <div class="mb-3">
            <label for="boardTitle" class="form-label">제목</label>
            <input type="text" class="form-control" id="boardTitle" name="boardTitle" placeholder="제목을 입력하세요" required>
        </div>
        <div class="mb-3">
            <label for="boardContents" class="form-label">내용</label>
            <textarea class="form-control" id="boardContents" name="boardContents" rows="5" required></textarea>
        </div>
        <div class="mb-3">
            <label for="boardFile" class="form-label">첨부 파일</label>
            <input type="file" class="form-control" id="boardFile" name="boardFile" multiple>
        </div>
        <button type="submit" class="btn btn-primary">작성</button>
    </form>
</div>
<%@include file="../component/footer.jsp" %>
</body>
</html>
