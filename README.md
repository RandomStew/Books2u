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

## IA (Information Architecture)
<table>
    <thead>
        <tr>
            <th>Depth_1</th>
            <th>Depth_2</th>
            <th>Depth_3</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td rowspan=16>WebContent</td>
        </tr>
        <tr>
            <td>common</td>
            <td>top.jsp</td>
        </tr>
        <tr>
            <td rowspan=2>L2 Name B</td>
            <td>L3 Name C</td>
        </tr>
        <tr>
            <td>L3 Name D</td>
        </tr>
    </tbody>
</table>
