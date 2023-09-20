<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <style>
        table {
            margin: auto;
        }
    </style>
</head>
<body>
<%@include file="../component/header.jsp" %>
<%@include file="../component/nav.jsp" %>
<div class="container">
    <div id="member-list">
        <table class="table table-secondary table-striped">
            <%--            <tr>--%>
            <%--                <th>id</th>--%>
            <%--                <td>${member.id}</td>--%>
            <%--            <tr>--%>
            <th>email</th>
            <td>${member.memberEmail}</td>
            </tr>
            <tr>
                <th>name</th>
                <td>${member.memberName}</td>
            </tr>
            <tr>
                <th>password</th>
                <td>${member.memberPassword}</td>
            </tr>
            <tr>
                <th>mobile</th>
                <td>${member.memberMobile}</td>
            </tr>
            <c:if test="${member.memberProfile == 1}">
                <tr>
                    <th>profile</th>
                    <td>
                        <c:forEach items="${memberProfileList}" var="profile">
                            <img src="${pageContext.request.contextPath}/upload/${profile.storedFileName}"
                                 alt="" width="100" height="100">
                        </c:forEach>
                    </td>
                </tr>
            </c:if>
        </table>
        <a href="/members">목록으로 돌아가기</a>
    </div>
</div>

<%@include file="../component/footer.jsp" %>
</body>

</html>
