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
<div id="section" class="container">
    <form action="/save" method="post" enctype="multipart/form-data">
        <div class="mb-3">
            <label class="form-label">이름</label>
            <input type="text" name="memberName" class="form-control" placeholder="이름"> <br>
        </div>
        <div class="mb-3">
            <label class="form-label">이메일</label>
            <input type="text" name="memberEmail" class="form-control" id="member-email" onkeyup="email_dup_check()"
                   placeholder="이메일"><br>
            <p id="email-dup-check-result"></p>
        </div>
        <div class="mb-3">
            <label class="form-label">비밀번호</label>
            <input type="text" name="memberPassword" class="form-control" placeholder="비밀번호"> <br>
        </div>
        <div class="mb-3">
            <label class="form-label">전화번호</label>
            <input type="text" name="memberMobile" class="form-control" placeholder="전화번호"> <br>
        </div>
        <div class="mb-3">
            <label class="form-label">프로필</label>
            <input type="file" class="form-control" name="profile" multiple> <br>
        </div>
        <%--        프로필<br><input type="file" name="memberFile" memberProFile> <br>--%>
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
