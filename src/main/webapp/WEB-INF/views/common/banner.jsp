<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script>

var searchField = $('.search');
var searchInput = $("input[type='search']");

var checkSearch = function(){
var contents = searchInput.val();
if(contents.length !== 0){
   searchField.addClass('full');
} else {
   searchField.removeClass('full');
}
};

$("input[type='search']").focus(function(){
searchField.addClass('isActive');
}).blur(function(){
	searchField.removeClass('isActive');
checkSearch();
});
</script>

<div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="images/icons/banner1.jpg" class="d-block w-100" alt="...">
        <div class="carousel-caption d-none d-md-block">
          <p style="font-size:80px" class="title-opcity" >
	          <font class="title-text" style="font-size:20px;color:white" >당신에게 다채로운 경험을</font>
	          <br><b>Books2ü</b>
          </p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="images/icons/banner2.jpg" class="d-block w-100" alt="...">
       <div class="carousel-caption d-none d-md-block">
          <p style="font-size:80px" class="title-opcity" >
	          <font class="title-text" style="font-size:20px;color:white">당신에게 다채로운 경험을</font>
	          <br><b>Books2ü</b>
          </p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="images/icons/banner3.jpg" class="d-block w-100" alt="...">
       <div class="carousel-caption d-none d-md-block">
          <p style="font-size:80px" class="title-opcity" >
	          <font class="title-text" style="font-size:20px;color:white">당신에게 다채로운 경험을</font>
	          <br><b>Books2ü</b>
          </p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="images/icons/banner2.jpg" class="d-block w-100" alt="...">
       <div class="carousel-caption d-none d-md-block">
          <p style="font-size:80px" class="title-opcity" >
	          <font class="title-text" style="font-size:20px;color:white">당신에게 다채로운 경험을</font>
	          <br><b>Books2ü</b>
          </p>
      </div>
    </div>
    </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>


<!--  "images/icons/banner1.jpg"-->