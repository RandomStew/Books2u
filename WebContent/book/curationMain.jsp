<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	function goBookInfo(isbn) {
		location.href=`BookInfoServlet?isbn=\${isbn}`;
	}
</script>

  <section class="serve-list">
	<div class="container">
		<div class="title">
			<h1>큐레이션</h1>
			<ul>
				<li><a href="">감성</a></li>
				<li><a href="">AI</a></li>
				<li><a href="">추리</a></li>
				<li><a href="">돌</a></li>
				
			</ul>
		</div>
		<div class="item-list" >
		<c:forEach var="book" items="${curationList}" varStatus="status">
			<div class="card" id="card${book.isbn}" style="cursor:pointer" onclick="goBookInfo(${book.isbn})">
				<div class="img" id="">
					<img src="images/books/${book.isbn}.jpg" alt="">	
				</div>
				<div class="text">
					<h2>${book.title}</h2>
					<p>${book.author}</p>
					<button><i class="fas fa-check"></i>자세히보기</button>
				</div>
			</div>
		</c:forEach>	
		</div>
		
	</div>

		  
  </section>
