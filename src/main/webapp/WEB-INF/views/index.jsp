<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<%@include file="component/header.jsp" %>
<%@include file="component/nav.jsp" %>
email : ${sessionScope.loginEmail } <br>
profiledto : ${sessionScope.profile} <br>
memberid : ${sessionScope.memberid}
<%@include file="component/footer.jsp" %>
</body>
</html>
