<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <style>
        body{
            /* background-repeat : 반복조절 */
            background-image: url('https://wallscloud.net/img/resize/3840/2160/MM/2022-03-21-Blue_Screen_Of_Death.jpg');
            background-repeat: no-repeat;
            background-size: cover;
            /*   background-position: top; */
        }
    </style>
</head>
<body>
<%@include file="component/header.jsp" %>
<%@include file="component/nav.jsp" %>
<%--email : ${sessionScope.loginEmail } <br>--%>
<%--profiledto : ${sessionScope.profile} <br>--%>
<%--memberid : ${sessionScope.memberid}--%>

<%@include file="component/footer.jsp" %>
</body>
</html>
