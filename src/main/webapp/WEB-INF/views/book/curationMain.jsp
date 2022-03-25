<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	$(document).ready(function(){
		$("img").on("click", function() {
			console.log($(this).data('isbn'));
			var url = "bookInfo";
			var obj = {
					isbn : $(this).data('isbn')
			}
			location.href = url + '?' + $.param(obj);
		});
	});
</script>

<div class="container pl-3 pr-3">
<div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
  	
	    <div class="carousel-item active" data-bs-interval="2000">
	    	<div><h2>예술대중문화</h2></div>
		    <div class="row">
			    <c:forEach var="art" items="${artList}" varStatus="status">
			    	<div class="col">
					    <div class="card" style="width: 10rem;">
						   <img src="images/books/${art.isbn }.jpg" class="card-img-top" data-isbn="${art.isbn }" style="cursor:pointer" alt="...">
						   <div class="card-body">
						   	<p class="card-text">${art.title }</p>
						   </div>
						</div>
					</div>
				</c:forEach>
			</div>
    	</div>
    <div class="carousel-item" data-bs-interval="2000">
    	<div><h2>소설</h2></div>
    		<div class="row">
			    <c:forEach var="novel" items="${novelList}" varStatus="status">
			    	<div class="col">
					    <div class="card" style="width: 10rem;">
						   <img src="images/books/${novel.isbn }.jpg" class="card-img-top" style="cursor:pointer" data-isbn="${novel.isbn }" alt="...">
						   <div class="card-body">
						   	<p class="card-text">${novel.title }</p>
						   </div>
						</div>
					</div>
				</c:forEach>
			</div>
    </div>
    <div class="carousel-item" data-bs-interval="2000">
    	<div><h2>요리</h2></div>
      	<div class="row">
		    <c:forEach var="cook" items="${cookList}" varStatus="status">
		    	<div class="col">
				    <div class="card" style="width: 10rem;">
					   <img src="images/books/${cook.isbn }.jpg" class="card-img-top" style="cursor:pointer" data-isbn="${cook.isbn }" alt="...">
					   <div class="card-body">
					   	<p class="card-text">${cook.title }</p>
					   </div>
					</div>
				</div>
			</c:forEach>
		</div>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
</div>