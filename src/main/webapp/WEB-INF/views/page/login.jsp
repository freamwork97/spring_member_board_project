<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
<%--    <link rel="stylesheet" href="/resources/css/main.css">--%>
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
<div id="section" class="card" style="width: 25rem;">
    <div class="card-header">
        로그인
    </div>
    <ul class="list-group list-group-flush">
        <form action="/login" method="post">
            <li class="list-group-item">
                <input type="text" name="memberEmail" class="form-control" placeholder="이메일 입력하세요"> <br>
            </li>
            <li class="list-group-item">
                <input type="text" name="memberPassword" class="form-control" placeholder="비밀번호 입력하세요"> <br>
            </li>
            <li class="list-group-item">
                <input type="submit" value="로그인">
            </li>
        </form>
    </ul>


</div>

<%@include file="../component/footer.jsp" %>

</body>
</html>
