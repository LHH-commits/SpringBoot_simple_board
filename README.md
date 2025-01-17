# Simple Board Project
- Spring Boot 기반의 MVC 구조를 익히고자 만든 개인 프로젝트입니다
- 간단한 게시판 형식의 프로젝트입니다
- 대댓글 시스템의 구현 및 리스트의 로드를 비동기처리 방식(AJAX)으로 처리하였습니다
- Spring Security를 이용하여 사용자 인증/인가를 구현했습니다

## 🛠 개발 환경
- **Tool**: STS (Spring Tool Suite), VS Code, HeidiSQL
- **JDK**: JDK-22
- **Build**: Gradle
- **Server**: Apache Tomcat (Spring Boot 내장)
- **Database**: MariaDB(MySQL)

## 🔧 기술 스택
### Backend
- **Framework**: Spring Boot
- **Security**: Spring Security
  - 사용자 인증 및 권한 관리
  - Role 기반 접근 제어 (ROLE_USER, ROLE_ADMIN)
- **Database**: 
  - MariaDB(MySQL)
  - MyBatis (SQL Mapper)
- **JSP**: View 템플릿 엔진

### Frontend
- **JavaScript/jQuery**
  - AJAX를 활용한 비동기 통신
  - 동적 UI 구현
- **Bootstrap 5**
  - 반응형 웹 디자인
  - UI 컴포넌트
- **HTML5/CSS3**

### 프로젝트 구조
- MVC 아키텍처 패턴
- RESTful API 설계

## ⚙️ 프로젝트 흐름
- 클라이언트 측 요청이 들어오면 Controller에서 해당 요청을 매핑처리 합니다
- Controller → Service → Mapper → Database 순으로 데이터가 처리되어 Model에 담아 JSP로 전달됩니다
- 완성된 페이지를 클라이언트에게 반환하여 응답하게 됩니다

## 주요 기능
- 게시판 CRUD 기능
- 계층형 댓글 시스템
- 페이징 처리
- 검색 기능
- 사용자 인증/인가

## ERD
- 기본적으로 DB의 테이블을 구성하기 위해 다음과 같이 ERD를 설계하여 만듭니다

![SimpleBoard - ERD](https://github.com/user-attachments/assets/ea7931c6-143e-47e9-8f2d-bfbfca50f54a)


## 주요기능 살펴보기
### 회원가입
<img width="1280" alt="signup" src="https://github.com/user-attachments/assets/3830bea3-92f8-4175-92ec-f5e0dc7e2abd" />

- 필요한 정보들을 입력후 회원가입이 되면 DB에 회원정보가 저장됩니다


### 로그인
<img width="1280" alt="login" src="https://github.com/user-attachments/assets/ba622c7a-64f2-4d7c-97b5-9e5fc3e5210d" />

- 저장된 회원 정보로 로그인할 수 있습니다
- 로그인 상태 유지를 체크하면 remember-me 토큰이 쿠키로 저장되어 24시간동안 로그인 정보가 유지됩니다(Spring Security로 설정)

<img width="1280" alt="loginsuccess" src="https://github.com/user-attachments/assets/c30f6301-d6d7-4890-9d43-2c08fcb4b770" />

- 성공적으로 로그인되면 다음과 같은 화면이 구성됩니다


### 게시판
![스크린샷 2024-12-30 191316](https://github.com/user-attachments/assets/2e7e841f-8799-497e-8788-30b9ea4b190a)

- 게시물 보기를 통해 게시판의 리스트를 확인할 수 있습니다
- /list?page=1&searchOption=&searchKeyword=
  - page : 페이지네이션 구성을 위한 페이지 숫자
  - searchOption, searchKeyword : 검색을 위한 검색옵션과 검색키워드를 구성

#### 게시글 작성
![insertBoard](https://github.com/user-attachments/assets/c180460c-4984-4f29-8a8c-99374530eea1)

#### 게시물 상세
![스크린샷 2024-12-30 183554](https://github.com/user-attachments/assets/4319f840-5731-4e69-a269-d676a20511ae)

- 게시글 제목을 클릭했을때 보여지는 페이지

#### 게시글 수정
![스크린샷 2024-12-30 184451](https://github.com/user-attachments/assets/90cacc42-3402-4044-8bcf-650503fb5281)

- 해당 기능은 현재 접속ID와 작성ID를 비교하여 동일 하다면 사용가능한 기능입니다
- 수정된 내용/제목이 새로 게시글에 작성됩니다

#### 게시글 삭제
![스크린샷 2024-12-30 185150](https://github.com/user-attachments/assets/ff66fa48-0489-4cee-afad-835f798003a1)

- 해당 기능은 현재 접속ID와 작성ID가 동일하거나 ROLE_ADMIN 권한을 가지고 있다면 활성화 되는 기능입니다
- 게시글ID를 기준으로 해당 글이 삭제됩니다


### 댓글
- ROLE_ADMIN 권한을 가진 계정으로 작성한 예시
![스크린샷 2024-12-30 183815](https://github.com/user-attachments/assets/7251f14f-d39d-4e04-be73-8dd6053ee4e7)

- 기본적으로 계층형 구조를 가지고 '대댓글' 작성이 가능합니다
  - 계층형 댓글 구조 구성 (DB 및 Mybatis 구성)
    - **group** : 댓글과 대댓글을 포함하여 묶인 그룹을 식별하기 위한 컬럼입니다
    - **order** : 같은 그룹 내에서 댓글의 표시 순서를 식별하기 위한 컬럼입니다
    - **depth** : 대댓글의 가시성 상향을 위해 대댓글을 작성할수록 레벨이 올라가며 depth가 깊을 수록 들여쓰기가 심화됩니다

- 다른 계정으로 접속 시 보여지는 화면 예시 (화면은 ROLE_USER 권한을 가지고 있음)
![스크린샷 2024-12-30 184300](https://github.com/user-attachments/assets/a2b56a9d-615d-4b92-82da-fe8ec98374ee)

- ROLE_ADMIN 권한을 가진다면 모든 댓글의 삭제까지 가능하지만 수정은 작성ID와 접속ID가 일치해야 가능합니다
- ROLE_USER 권한을 가진 회원이라면 본인의 댓글에만 삭제 및 수정이 가능합니다


### 검색
![스크린샷 2024-12-30 185212](https://github.com/user-attachments/assets/5cec05b3-df62-4e44-957d-04fcc1792371)

![스크린샷 2024-12-30 185227](https://github.com/user-attachments/assets/013b24ae-675e-4cb1-9008-863289336d74)

![스크린샷 2024-12-30 185237](https://github.com/user-attachments/assets/8e945c1e-6aea-4dae-bdeb-dfe387c672bc)
- 사용자는 원하는 옵션으로 키워드를 입력하여 게시글을 검색할 수 있습니다
- **searchOption** : 제목으로 검색, 내용으로 검색, 제목+내용으로 검색
- **searchKeyword** : Mybatis에서 LIKE CONCAT을 사용하여 해당 키워드로 검색 결과가 나오도록 했습니다

