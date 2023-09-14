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
    <form action="/save" method="post" >
        <input type="text" name="memberName" placeholder="이름"> <br>
        <input type="text" name="memberEmail" placeholder="이메일"> <br>
        <input type="text" name="memberPassword" placeholder="비밀번호"> <br>
        <input type="text" name="memberMobile" placeholder="전화번호"> <br>
<%--        <input type="text" name="memberProfile" placeholder="프로필"> <br>--%>
        <input type="submit" value="회원가입">
    </form>
</div>
<%@include file="../component/footer.jsp" %>
</body>
</html>
