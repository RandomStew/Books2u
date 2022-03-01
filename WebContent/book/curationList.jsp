<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<style>
.wrap_list_award{
	height: 600px;
	position: relative;
	overflow: hidden;
}

.wrap_list_award .wrap_inner_list_award {
	width: 940px;
	margin: 0 auto;
	position: relative;
}

.wrap_list_award .btn_move_slide {
	width: 72px;
	height: 72px;
	position: absolute;
	top: 240px;
}

.wrap_list_award .btn_move_slide.prev {
	position: absolute;
	background: url(//t1.daumcdn.net/brunch/static/img/help/pc/publish/off-prev.png) no-repeat;
	left: 30px;
	z-index: 100;
}
.wrap_list_award .btn_move_slide.next {
	background: url(//t1.daumcdn.net/brunch/static/img/help/pc/publish/off-next.png) no-repeat;
	right: 30px;
	z-index: 100;
}

.wrap_list_award .btn_move_slide.next.on {
	background: url(//t1.daumcdn.net/brunch/static/img/help/pc/publish/on-next.png) no-repeat;
	cursor: pointer;
}

.wrap_list_award .wrap_title {
	margin-top: 70px;
	width: 100%;
	position: relative;
}


.wrap_list_award .wrap_title .title {
	font-size: 14px;
	font-weight: 300;
	font-style: normal;
	font-stretch: normal;
	line-height: 1.29;
	text-align: left;
	color: #333333;
}

.wrap_list_award .wrap_title .sub_title {
	font-family: Futura;
	font-size: 11px;
	font-weight: 500;
	font-style: normal;
	font-stretch: normal;
	line-height: 1.64;
	letter-spacing: 0.6px;
	text-align: left;
	color: #bfbfbf;
	margin-top: 2px;
	display: block;
}

.wrap_list_award .wrap_title .wrap_list_page {
	position: absolute;
	right: 0;
}

.wrap_list_award .wrap_list_page .page {
	cursor: pointer;
	font-size: 12px;
	letter-spacing: -0.3px;
	text-align: left;
	color: #959595;
	margin-right: 11px;
}

.wrap_list_award .wrap_list_page .page.visible {
	border-bottom: 2px solid #959595;
	display: inline-block;
	color: #333;
}
.wrap_list_award .slide_award_list {
	opacity: 0;
	transition-duration: 0.5s;
	position: absolute;
	z-index: -1;
}

.wrap_list_award .slide_award_list.visible {
	opacity: 1;
	z-index: 10;
}

.wrap_list_award .wrap_list_item {
	margin-top: 25px;
}

.wrap_list_award .wrap_list_item .item_award {
	float:left;
	cursor: pointer;
	position: relative;
}

.item_award .img_cover {
	width: 200px;
	box-sizing: border-box;
	border: 1px solid #eee;
	/*height: 320px;*/
}

.item_award .title {
	margin-top: 14px;
	font-size: 16px;
	letter-spacing: -0.4px;
	color: #333333;
	width: 220px;
	overflow: hidden;
	white-space: nowrap;
	-ms-text-overflow: ellipsis;
	text-overflow: ellipsis;
}

.item_award .author {
	font-size: 13px;
	color: #bfbfbf;
	margin-top: 7px;
	width: 220px;
	overflow: hidden;
	white-space: nowrap;
	-ms-text-overflow: ellipsis;
	text-overflow: ellipsis;
}

.item_award .author a {
	color: #bfbfbf;
}

.by {
	font-family: Georgia;
	font-weight: normal;
	font-style: italic;
}

.item_award .open_marker {
	display: block;
	width: 22px;
	height: 11px;
	position: absolute;
	left: 0;
	bottom: -28px;
	transition-duration: 0.2s;
	opacity: 0;
}

.item_award.open .open_marker {
	opacity: 1;
}

.item_award .wrap_item_award_cover {
	position: relative;
	font-size: 0;
}

.item_award .wrap_item_award_cover .border_left {
	position: absolute;
	width: 8px;
	height: 100%;
	background: #000;
	top: 0;
	opacity: 0.03;
}
</style>

<script>
	function translatePlus() {
		var ul = document.querySelector("#gradeItemList_all");
		ul.style.transform = "translateX(-1000px)"
	}

</script>

 <section class="wrap_list_award">
 	<div class="wrap_inner_award">
 		<div class="wrap_title">
 			<span class="title">브런치 수상작</span>
 			<span class="wrap_list_page">
 				<span class="page visible">수상작 전체</span>
 				<span class="page visible">대상</span>
 				<span class="page visible">금상</span>
 				<span class="page visible">은상</span>
 			</span>
 			<span class="sub_title">branchbook_project</span>
 		</div>
 		<div class="wrap_list_item">
 			<ul id="gradeItemList_all" style="width:27840px" class="slide_award_list visible">
 				<li class="item_award">
 					<div class="wrap_item_award_cover">
 						<img class="img_cover" src="images/books/${book.isbn }.jpg">
 						<div class="border_left"></div>
 					</div>
 					<p class="title">1</p>
 					<p class="author">
 						<span class="by">by</span>
 						"&nbsp;"
 						<a href="">2</a>
					</p>
 				</li>
 			</ul>
 		</div>
 	</div> 
 	<button type="button" class="btnMoveAwardSlide btn_move_slide prev"></button>
 	<button type="button" class="btnMoveAwardSlide  btn_move_slide next"></button>
 
 </section>