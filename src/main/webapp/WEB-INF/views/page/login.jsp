<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<%@include file="../component/header.jsp" %>
<%@include file="../component/nav.jsp" %>
<div id="section" class="container">
    <form action="/login" method="post">
        <div class="mb-3">
            <label class="form-label">이메일</label>
            <input type="text" name="memberEmail" placeholder="이메일 입력하세요"> <br>
        </div>
        <div class="mb-3">
            <label class="form-label">비밀번호</label>
            <input type="text" name="memberPassword" placeholder="비밀번호 입력하세요"> <br>
        </div>
        <input type="submit" value="로그인">
    </form>
</div>

<%@include file="../component/footer.jsp" %>

</body>
</html>
