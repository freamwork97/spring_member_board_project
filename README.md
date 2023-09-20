# 회원제 게시판

## 회원제 게시판 요구사항

1. 데이터 관련
    1. 회원데이터: 회원번호(id), 이메일(memberEmail), 비밀번호(memberPassword), 이름
       (memberName), 전화번호(memberMobile), 프로필사진(memberProfile)
    2. 게시글데이터: 글번호(id), 제목(boardTitle), 작성자(boardWriter), 내용
       (boardContents), 조회수(boardHits), 작성일자(createdAt), 첨부파일저장여부
       (fileAttached)
    3. 댓글데이터: 댓글번호(id), 게시글번호(boardId), 작성자(commentWriter), 작성일자
       (createdAt)
2. 테이블 설계 관련
    1. 필요한 테이블
        1. 회원, 프로필용 파일, 게시글, 게시글 첨부파일, 댓글
    2. pk, fk, not null, default, unique 등 제약 조건 모두 고려
    3. 게시글과 댓글 작성자는 회원테이블의 회원번호를 참조함.
        1. 게시글테이블과 댓글테이블에 회원번호 컬럼을 추가하여 참조관계 설정
    4. 댓글의 게시글번호는 게시글의 글번호를 참조함.
    5. 회원삭제시 해당회원이 작성한 게시글, 댓글은 모두 삭제됨.
    6. 게시글 삭제시 해당 게시글에 작성된 댓글은 모두 삭제됨.
3. 화면
    1. nav, footer가 있는 간단한 레이아웃 적용
    2. 부트스트랩 적용해 볼 것
        1. 직접 디자인도 가능
4. 주요기능
    1. index.jsp에는 회원가입, 로그인, 글목록으로 가는 버튼(또는 링크) 있음. (nav.jsp 에 작
       성 가능)
    2. 회원관련 기능
        1. 회원가입
            - 이메일, 비밀번호, 이름, 전화번호, 프로필사진을 입력받음
            - ajax로 이메일 중복확인을 함
            - 비밀번호, 전화번호 등은 정규식 체크도 해볼 것.
        2. 로그인
            - 로그인 완료시 페이징처리된 글목록 화면으로 이동함.
        3. 로그아웃
            - 로그아웃 완료시 index페이지로 이동
        4. 일반회원
            - 게시글작성, 조회 가능
            - 본인이 작성한 글에 대해서만 글 상세조회시 수정, 삭제 버튼이 보임.
        5. 관리자
            - 관리자 아이디는 admin 으로 함.
            - 관리자로 로그인하면 nav에 관리자화면으로 접속할 수 있는 링크 보임
                - 일반회원이 로그인하면 보이지 않음
                - 관리자화면으로 접속하면 회원목록 출력됨
            - 회원목록 페이지에서 회원 삭제 가능함. (회원삭제는 관리자만 가능)
                - 로그인 계정이 admin인지 판단하는 코드는 아래 코드 참고

    ```js
    c:if test = "${sessionScope.loginEmail == 'admin'}" >
        < /c:if>
    ```           

    3. 게시판 관련 기능
        - 글쓰기 기능
            1. 글쓰기할 때 작성자는 따로 입력하지 않음. 글쓰기 화면 출력되면 로그인 이메
               일이 작성자 칸에 입력되어 있음.
                - 아래 코드 참고

```js
<input type="text" name="boardWriter" value="${sessionScope.loginEmail">
```

2. 제목, 내용, 첨부파일을 입력할 수 있음.
    - 페이징 목록 출력 기능

    1. 기본적으로 한화면에 5개씩글이 노출되고 페이지번호는 3개가 나옴. (바꿔도
       됨)

    - 글수정, 글삭제 기능

    1. 작성자 본인만 수정, 삭제 가능

    - 아래 코드는 작성자와 로그인 사용자가 일치하는지 확인하는 내용

   ```js
           <c:if test="${board.boardWriter == sessionScope.loginEmail}">
           조건 만족할 때 보여줄 내용
           </c:if>
   ```
    2. 관리자는 삭제만 가능
        - 검색 기능
            1. 작성자, 제목으로 검색할 수 있음.
    4. 댓글 관련 기능
        1. 댓글작성시 글작성과 마찬가지로 작성자는 로그인 아이디가 미리 작성되어 있
           음. 내용만 작성하면 됨.
    5. 마이페이지 관련 기능
        - 로그인하면 마이페이지로 이동할 수 있는 링크가 보임.
        - 마이페이지로 접속하여 회원정보 수정을 할 수 있음.
        - 회원정보 수정 페이지에서 비밀번호를 체크하여 일치하지 않으면 수정처리를 하지
          않고 alert 창을 출력함.
    6. 추가로 고려해볼 수 있는 기능(필수는 아니고 선택사항 입니다.)
        - 페이징 목록에서 한화면에서 볼 수 있는 글 갯수 선택하기
        - 조회수 순으로 목록 보여주기
        - 회원 탈퇴 기능
        - 댓글 삭제 기능
        - 댓글 좋아요, 싫어요 기능

# SQL 테이블

```sql
create table member
(
    id             bigint auto_increment primary key,
    memberEmail    varchar(50) unique,
    memberPassword varchar(20) not null,
    memberName     varchar(20) not null,
    memberMobile   varchar(30) not null,
    memberProfile  int default 0
);
```

```sql
create table member_profile
(
    id               bigint primary key auto_increment,
    originalFileName varchar(100),
    storedFileName   varchar(100),
    memberId         bigint,
    constraint foreign key (memberId) references member (id) on delete cascade
);
```

```sql
create table board
(
    id            bigint auto_increment primary key,
    boardTitle    varchar(50)  not null,
    boardWriter   varchar(50),
    boardContents varchar(500) not null,
    boardHits     int      default 0,
    createdAt     datetime default now(),
    fileAttached  int      default 0,
    memberId      bigint,
    constraint foreign key (memberId) references member (id) on delete cascade
);
```

```sql
create table board_file_table
(
    id               bigint primary key auto_increment,
    originalFileName varchar(100),
    storedFileName   varchar(100),
    boardId          bigint,
    constraint foreign key (boardId) references board (id) on delete cascade
);
```

```sql
create table comment_table
(
    id              bigint auto_increment primary key,
    boardId         bigint,
    memberId        bigint,
    commentWriter   varchar(20),
    commentContents varchar(200),
    createdAt       datetime default now(),
    constraint foreign key (boardId) references board (id) on delete cascade,
    constraint foreign key (memberId) references member (id) on delete cascade
);

```