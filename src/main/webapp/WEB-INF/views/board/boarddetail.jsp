<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<%@include file="../component/header.jsp" %>
<%@include file="../component/nav.jsp" %>
<div id="section" class="container">
    <table class="table table-secondary table-striped">
<%--        <tr>--%>
<%--            <th>id</th>--%>
<%--            <td>${board.id}</td>--%>
<%--        <tr>--%>
            <th>작성자</th>
            <td>${board.boardWriter}</td>
        </tr>
        <tr>
            <th>날짜</th>
            <td>${board.createdAt}</td>
        </tr>
        <tr>
            <th>조회수</th>
            <td>${board.boardHits}</td>
        </tr>
        <tr>
            <th>제목</th>
            <td>${board.boardTitle}</td>
        </tr>
        <tr>
            <th>내용</th>
            <td>${board.boardContents}</td>
        </tr>
        <c:if test="${board.fileAttached == 1}">
            <tr>
                <th>image</th>
                <td>
                    <c:forEach items="${boardFileList}" var="boardFile">
                        <img src="${pageContext.request.contextPath}/upload/${boardFile.storedFileName}"
                             alt="" width="100" height="100">
                    </c:forEach>
                </td>
            </tr>
        </c:if>
    </table>
    <button onclick="board_list()">목록</button>
    <%-- 수정은 자신의 글만 보이게 삭제는 admin과 자기 자신만이 가능하도록--%>
    <c:if test="${board.boardWriter == member.memberEmail}">
        <button onclick="board_update()">수정</button>
    </c:if>
    <c:if test="${board.boardWriter == member.memberEmail or member.memberEmail == 'admin'}">
        <button onclick="board_delete()">삭제</button>
    </c:if>

    <div id="comment-write-area">
        <input type="text" id="comment-writer" value="${sessionScope.loginEmail}" readonly>
        <input type="text" id="comment-contents" placeholder="내용 입력">
        <button onclick="comment_write()">댓글작성</button>
    </div>
    <div id="comment-list-area" >
        <c:choose>
            <c:when test="${commentList == null}">
                <h3>작성된 댓글이 없습니다.</h3>
            </c:when>
            <c:otherwise>
                <table id="comment-list" class="table table-secondary table-striped">
                    <tr>
                        <th>작성자</th>
                        <th>내용</th>
                        <th>작성시간</th>
                    </tr>
                    <c:forEach items="${commentList}" var="comment">
                        <tr>
                            <td>${comment.commentWriter}</td>
                            <td>${comment.commentContents}</td>
                            <td>${comment.createdAt}</td>
                        </tr>
                    </c:forEach>
                </table>
            </c:otherwise>
        </c:choose>
    </div>
</div>
<%@include file="../component/footer.jsp" %>

</body>
<script>
    const comment_write = () => {
        const commentWriter = document.getElementById("comment-writer").value;
        const commentContents = document.querySelector("#comment-contents").value;
        const boardId = '${board.id}';
        const memberId = '${sessionScope.memberid}'
        const result = document.getElementById("comment-list-area");
        $.ajax({
            type: "post",
            url: "/comment/save",
            data: {
                commentWriter: commentWriter,
                commentContents: commentContents,
                boardId: boardId,
                memberId: memberId
            },
            success: function (res) {
                console.log("리턴값: ", res);
                let output = "<table id=\"comment-list\" class='table table-secondary table-striped' >\n" +
                    "    <tr>\n" +
                    "        <th>작성자</th>\n" +
                    "        <th>내용</th>\n" +
                    "        <th>작성시간</th>\n" +
                    "    </tr>\n";
                for (let i in res) {
                    output += "    <tr>\n";
                    output += "        <td>" + res[i].commentWriter + "</td>\n";
                    output += "        <td>" + res[i].commentContents + "</td>\n";
                    output += "        <td>" + res[i].createdAt + "</td>\n";
                    output += "    </tr>\n";
                }
                output += "</table>";
                result.innerHTML = output;
                document.getElementById("comment-writer").value = commentWriter;
                document.getElementById("comment-contents").value = "";
            },
            error: function () {
                console.log("댓글 작성 실패");
            }
        });
    }
    const board_list = () => {
        const page = '${page}';
        const q = '${q}';
        const type = '${type}'

        location.href = "/board/list?page=" + page + "&q=" + q + "&type=" + type;
    }
    const board_update = () => {
        const id = '${board.id}';
        location.href = "/board/update?id=" + id;
    }
    const board_delete = () => {
        const id = '${board.id}';
        location.href = "/board/delete?id=" + id;
    }
</script>
</html>
