<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<%--    <link rel="stylesheet" href="/resources/css/main.css">--%>
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
        회원정보수정
    </div>

    <ul class="list-group list-group-flush">
        <form action="/update" method="post" name="updateForm">

            <input type="hidden" name="id" value="${member.id}">
            <li class="list-group-item">
                <label class="form-label">이메일 : </label>
                <input type="text" name="memberEmail" value="${member.memberEmail}" placeholder="이메일"
                       readonly> <br>
            </li>
            <li class="list-group-item">
                <label class="form-label">비밀번호 : </label>

                <input type="text" name="memberPassword" id="member_password" placeholder="비밀번호"><br>

            </li>
            <li class="list-group-item">
                <label class="form-label">이름 : </label>
                <input type="text" name="memberName" value="${member.memberName}" placeholder="이름"> <br>

            </li>
            <li class="list-group-item">
                <label class="form-label">전화번호 : </label>
                <input type="text" name="memberMobile" value="${member.memberMobile}" placeholder="전화번호"> <br>

            </li>
            <li class="list-group-item">
                <input type="button" value="수정" onclick="update_fn()">

            </li>
        </form>

    </ul>

    <%--    <input type="text" name="memberProfile" value="${member.memberProfile}"> <br>--%>
</div>
<%@include file="../component/footer.jsp" %>

</body>
<script>
    const update_fn = () => {
        const ex1 = document.getElementById("member_password").value;
        const check = '${member.memberPassword}';
        console.log(ex1);
        if (ex1 == check) {
            document.updateForm.submit();
        } else {
            alert("비밀번호 불일치")
        }
    }
</script>
</html>