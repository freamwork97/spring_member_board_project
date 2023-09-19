<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<%@include file="../component/header.jsp" %>
<%@include file="../component/nav.jsp" %>
<div id="section">
    <form action="/board/update" method="post" name="updateForm">
        <input type="hidden" name="id" value="${board.id}"> <br>
        <input type="text" name="boardTitle" value="${board.boardTitle}" placeholder="제목을 입력하세요"> <br>
        <input type="text" name="boardWriter" value="${board.boardWriter}" readonly> <br>
        <textarea name="boardContents" cols="30" rows="10">${board.boardContents}</textarea> <br>
        <input type="button" value="수정" onclick="board_update()">
    </form>
</div>
<%@include file="../component/footer.jsp" %>
</body>
<script>
    const board_update = () => {
        document.updateForm.submit();
    }
</script>
</html>
