<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<%@include file="../component/header.jsp" %>
<%@include file="../component/nav.jsp" %>
<div id="section" class="container">
    <h2>게시글 수정</h2>
    <form action="/board/update" method="post" name="updateForm">
        <input type="hidden" name="id" class="form-control" value="${board.id}"> <br>
        <div class="mb-3">
            <label class="form-label">제목</label>
            <input type="text" name="boardTitle" class="form-control" value="${board.boardTitle}"
                   placeholder="제목을 입력하세요"> <br>
        </div>
        <div class="mb-3">
            <label class="form-label">작성자</label>
            <input type="text" name="boardWriter" class="form-control" value="${board.boardWriter}" readonly> <br>
        </div>
        <div class="mb-3">
            <label class="form-label">내용</label>
            <textarea name="boardContents" class="form-control" cols="30" rows="10">${board.boardContents}</textarea>
            <br>
        </div>
        <div class="mb-3">
            <label class="form-label">첨부파일</label>
            <input type="file" class="form-control" id="boardFile" name="boardFile" multiple>
        </div>
        <button type="submit" class="btn btn-primary">수정</button>
    </form>
</div>
<%@include file="../component/footer.jsp" %>
</body>

</html>
