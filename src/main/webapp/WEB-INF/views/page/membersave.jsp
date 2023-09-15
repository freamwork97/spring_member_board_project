<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

</head>
<body>
<%@include file="../component/header.jsp" %>
<%@include file="../component/nav.jsp" %>
<div id="section">
    <form action="/save" method="post">
        <input type="text" name="memberName" placeholder="이름"> <br>
        <input type="text" name="memberEmail" id="member-email" onkeyup="email_dup_check()" placeholder="이메일"><br>
        <p id="email-dup-check-result"></p>
        <input type="text" name="memberPassword" placeholder="비밀번호"> <br>
        <input type="text" name="memberMobile" placeholder="전화번호"> <br>
        <%--        <input type="text" name="memberProfile" placeholder="프로필"> <br>--%>
        <input type="submit" value="회원가입">
    </form>
</div>
<%@include file="../component/footer.jsp" %>
</body>

<script>
    const email_dup_check = () => {
        const email = document.getElementById("member-email").value;
        const result = document.getElementById("email-dup-check-result");
        $.ajax({
            type: "post",
            url: "/duplicate-check",
            data: {
                memberEmail: email
            },
            success: function () {
                result.innerHTML = "사용가능한 이메일입니다.";
                result.style.color = "green";
            },
            error: function () {
                result.innerHTML = "이미 사용 중인 이메일입니다.";
                result.style.color = "red";
            }
        });
    }
</script>
</html>
