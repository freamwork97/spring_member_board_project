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



        #login-area a{
            display: block;
        }
    </style>
</head>
<div id="nav">
    <ul class="menu">
        <li class="menu-item">
            <a href="/">index</a>
        </li>
        <li class="menu-item">
            <a href="/board/save">글작성</a>
        </li>
        <li class="menu-item">
            <a href="/board/list">목록출력</a>
        </li>
        <li class="menu-item">
            <a href="/board/sample">데이터 붓기</a>
        </li>
    </ul>
</div>
