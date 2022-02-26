# Books2u
## 서비스
도서 판매 시스템

## 기능
| 회원가입      | 로그인 | 검색 엔진 | 큐레이션       | 장바구니         | 구매      | 구매내역   | 리뷰       | 고객센터     | 팀원 소개(깃링크) |
| --------- | --- | ----- | ---------- | ------------ | ------- | ------ | -------- | -------- | ---------- |
| Oracle DB |     | ISBN  | 1차: 카테고라이징 | 담은 책들        | 메시지로 처리 | 페이징 처리 | 글 리뷰     | QnA(1:1) | 권동욱        |
| Servlet   |     | 책제목   | 장르         | 총 가격         |         |        | 별점(5점만점) |          | 이재은        |
| JSP       |     | 저자명   | 별점         | 구매하기 버튼      |         |        |          |          | 임현규        |
|           |     |       | 조회수        | 삭제 버튼(개별&일괄) |         |        |          |          |            |

## DTO
|                   | Member DTO |                        |                       | Review DTO |                   |                   | Order DTO             |                       |                       | Cart DTO  |                   |                   | Page DTO  |           |              |
| ----------------- | ---------- | ---------------------- | --------------------- | ---------- | ----------------- | ----------------- | --------------------- | --------------------- | --------------------- | --------- | ----------------- | ----------------- | --------- | --------- | ------------ |
| String / varchar2 | 아이디        | userId                 | String / varchar2(10) | 리뷰번호       | reviewId          | int / number      | 주문번호                  | orderId               | int / number(20)      | 아이디       | userId            | String / varchar2 | 가져올 데이터   | list      | ArrayList<T> |
| String / varchar2 | 비밀번호       | passWd                 | String / varchar2(10) | ISBN       | isbn              | String / varchar2 | 아이디                   | userId                | String / varchar2(10) | ISBN      | isbn              | String / varchar2 | 현재 페이지    | curPage   | int          |
| String / varchar2 | 이름         | userName               | String / varchar2(10) | 작성자        | userId            | String / varchar2 | ISBN                  | isbn                  | String / varchar2(10) | 책제목       | title             | String / varchar2 | 보여줄 데이터 수 | perPage   | int          |
| String / varchar2 | 주민번호       | ssn1                   | String / varchar2(10) | 별점         | rating            | int / number      | 책제목                   | title                 | String / varchar2     | 저자명       | author            | String / varchar2 | 전체 페이지    | totalPage | int          |
| String / Date     | ssn2       | String / varchar2(10)  | 내용                    | content    | String / varchar2 | 저자명               | author                | String / varchar2     | 출판사                   | publisher | String / varchar2 |                   |           |           |
| String / varchar2 | 휴대폰        | phone1                 | String / varchar2(3)  | 리뷰날짜       | reviewDate        | String / Date     | 출판사                   | publisher             | String / varchar2     | 가격        | price             | int / number      |           |           |              |
| int / num         | phone2     | String / varchar2(4)   |                       |            |                   | 가격                | price                 | int / number          | 수량                    | amount    | int / number      |                   |           |           |
| String            | phone3     | String / varchar(4)    |                       |            |                   | 수량                | amount                | int / number(10)      |                       |           |                   |                   |           |           |
|                   | 우편번호       | post                   | String / varchar2(10) |            |                   |                   | 수령인                   | recipient             | String / varchar2(10) |           |                   |                   |           |           |              |
|                   | 주소         | addr1                  | String / varchar2(20) |            |                   |                   | 수령지 우편번호              | recipientPost         | String / varchar2(10) |           |                   |                   |           |           |              |
|                   | addr2      | String / varchar2(500) |                       |            |                   | 수령지               | recipientAddr1        | String / varchar2(20) |                       |           |                   |                   |           |           |
|                   | addr3      | String / varchar2(500) |                       |            |                   | recipientAddr2    | String / varchar2(30) |                       |                       |           |                   |                   |           |
|                   | 이메일        | email1                 | String / varchar2(20) |            |                   |                   | recipientAddr3        | String / varchar2(30) |                       |           |                   |                   |           |           |
|                   | email2     | String / varchar2(20)  |                       |            |                   | 수령인전화번호           | recipientPhone1       | String / varchar2(3)  |                       |           |                   |                   |           |           |
|                   | 가입날짜       | joinDate               | String / Date         |            |                   |                   | recipientPhone2       | String / varchar2(4)  |                       |           |                   |                   |           |           |
|                   | 최근접속 날짜    | lastDate               | String / Date         |            |                   |                   | recipientPhone3       | String / varchar2(4)  |                       |           |                   |                   |           |           |
|                   |            |                        |                       |            |                   |                   | 결제수단                  | payment               | String / varchar2(10) |           |                   |                   |           |           |              |
|                   |            |                        |                       |            |                   |                   | 주문날짜                  | orderDate             | String / Date         |           |                   |                   |           |           |              |

  
  
## DB TABLE
|    | Book | Member      | Review  | Order    |
| -- | ---- | ----------- | ------- | -------- |
| PK | ISBN | isbn        | 아이디     | userId   | 리뷰번호 | number | 주문번호 | orderId |
| FK |      |             |         |          | ISBN | isbn | ISBN | isbn |
|    |      |             |         |          |  |  | 아이디 | userId |
|    | 책제목  | title       | 비밀번호    | passWd   | 작성자 | userId | 수량 | amount |
|    | 저자명  | author      | 이름      | userName | 별점 | rating | 수령인 | recipient |
|    | 출판사  | publisher   | 주민번호    | ssn1     | 내용 | content | 수령지 우편번호 | recipientPost |
|    | 출판날짜 | publishDate | ssn2    | 리뷰날짜     | reviewDate | 수령지 | recipientAddr1 |
|    | 줄거리  | story       | 휴대폰     | phone1   |  |  | recipientAddr2 |
|    | 장르   | genre       | phone2  |          |  | recipientAddr3 |
|    | 가격   | price       | phone3  |          |  | 수령인전화번호 | recipientPhone1 |
|    |      |             | 우편번호    | post     |  |  | recipientPhone2 |
|    |      |             | 주소      | addr1    |  |  | recipientPhone3 |
|    |      |             | addr2   |          |  | 결제수단 | payment |
|    |      |             | addr3   |          |  | 주문날짜 | orderDate |
|    |      |             | 이메일     | email1   |  |  |  |  |
|    |      |             | email2  |          |  |  |  |
|    |      |             | 가입날짜    | joinDate |  |  |  |  |
|    |      |             | 최근접속 날짜 | lastDate |  |  |  |  |
|    |      |             |         |          |  |  |  |  |
|    |      |             |         |          |  |  |  |  |
