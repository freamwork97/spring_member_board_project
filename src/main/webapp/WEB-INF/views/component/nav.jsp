<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <style>
        .menu {
            display: flex;
            align-items: center;
            background-color: black;
        }

        .menu-item {
            list-style-type: none;
            margin-left: 20px;

        }

        /* menu-item 클래스가 적용된 요소 내부의 a 태그 요소*/
        .menu-item a {
            text-decoration: none;
            /* a태그는 기본적으로 inline 요소
               inline 요소는 높이, 너비를 가질수 없음
               높이, 너비를 가지려면 block 요소여야 함
               아래 문법은 block요소로 하는 방법
            */
            display: block;
            padding: 10px;
            color: white;
            font-weight: bold;

        }

        .menu-item:hover {
            background-color: gray;
        }


        #login-area a {
            display: block;
        }
    </style>
</head>
<div id="nav">
    <ul class="menu">
        <li class="menu-item">
            <a href="/">index</a>
        </li>
        <li class="menu-item"  id="login-area1">
<%--            <a href="/save">회원가입</a>--%>
        </li>
        <li class="menu-item"  id="login-area2">
<%--            <a href="/login">로그인</a>--%>
        </li>
        <li class="menu-item"  id="login-area3">
<%--            <a href="/list">글목록</a>--%>
        </li>
    </ul>
</div>
<script>
    const loginArea1 = document.getElementById("login-area1");
    const loginArea2 = document.getElementById("login-area2");
    const loginArea3 = document.getElementById("login-area3");
    const loginEmail = '${sessionScope.loginEmail}';
    console.log(loginEmail.length);
    if (loginEmail.length != 0) {
        // 로그인 했음
        if (loginEmail == "admin") {
            loginArea1.innerHTML = "<a href='/members'>회원목록</a>";

        }
        loginArea2.innerHTML = "<a href='/update'>" + loginEmail + "님 환영해요!</a>";
        loginArea3.innerHTML = "<a href='/logout'>logout</a>";

    } else {
        // 로그인 안했음
        loginArea1.innerHTML = "<a href='/save'>회원가입</a>";
        loginArea2.innerHTML = "<a href='/login'>로그인</a>";
    }
</script>