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

<img src="images/icons/bannerSmall.jpg" class="img-fluid" alt="..." height="50px">


<!--  "images/icons/banner1.jpg"-->