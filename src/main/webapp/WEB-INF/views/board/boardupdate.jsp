<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
        <form action="/board/update" method="post" name="updateForm">
            <input type="hidden" name="id" class="form-control" value="${board.id}">
            <li class="list-group-item">
                <input type="text" name="boardTitle" class="form-control" value="${board.boardTitle}"
                       placeholder="제목을 입력하세요">
            </li>
            <li class="list-group-item">
                <input type="text" name="boardWriter" class="form-control" value="${board.boardWriter}" readonly> <br>
            </li>
            <li class="list-group-item">
                <textarea name="boardContents" class="form-control" cols="30"
                          rows="10">${board.boardContents}</textarea>
            </li>
            <%--        <div class="mb-3">--%>
            <%--            <label class="form-label">첨부파일</label>--%>
            <%--            <input type="file" class="form-control" id="boardFile" name="boardFile" multiple>--%>
            <%--        </div>--%>
            <button type="submit" class="btn btn-primary">수정</button>
        </form>
    </ul>
</div>
<%@include file="../component/footer.jsp" %>
</body>

</html>
