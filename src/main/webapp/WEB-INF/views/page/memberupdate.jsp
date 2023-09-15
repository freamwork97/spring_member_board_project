<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
  <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="/resources/css/main.css">
  <style>
    #section {
      margin: auto;
    }
  </style>
</head>
<body>
<%@include file="../component/header.jsp" %>
<%@include file="../component/nav.jsp" %>
<div id="section">
  <form action="/update" method="post" name="updateForm">
    <input type="hidden" name="id" value="${member.id}">
    <input class="form-control" type="text" name="memberEmail" value="${member.memberEmail}" placeholder="이메일"
           readonly> <br>
    <input type="text" name="memberPassword" id="member_password" placeholder="비밀번호"><br>
    <input type="text" name="memberName" value="${member.memberName}" placeholder="이름"> <br>
    <input type="text" name="memberMobile" value="${member.memberMobile}" placeholder="전화번호"> <br>
<%--    <input type="text" name="memberProfile" value="${member.memberProfile}"> <br>--%>
    <input type="button" value="수정" onclick="update_fn()">
  </form>
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