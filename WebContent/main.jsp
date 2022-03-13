<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>


<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" 
crossorigin="anonymous">

<link rel="stylesheet" 
href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" 
crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" 
integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" 
crossorigin="anonymous"></script>

<style>
.wrap_list_banner .item_banner {
    height: 800px;
    width: 100%;
    background-repeat: no-repeat;
    background-position: center;
    position: absolute;
    top: 0;
 }   
body * {
    font-family: Noto Sans Light;
}    

body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, code, form, fieldset, legend, textarea, p, blockquote, th, td, input, select, textarea, button {
    margin: 0;
    padding: 0;
    font-family: "Noto Sans DemiLight", "Malgun Gothic";
    -webkit-font-smoothing: antialiased;
    -webkit-font-smoothing: antialiased;
    -moz-font-smoothing: unset;
    -moz-osx-font-smoothing: grayscale;
    font-smoothing: antialiased;
    -webkit-backface-visibility: hidden;
    -moz-backface-visibility: hidden;
    backface-visibility: hidden;
    text-rendering: auto;
    text-rendering: optimizeSpeed;
    text-rendering: optimizeLegibility;
    text-rendering: geometricPrecision;
    text-rendering: inherit;
}
div[Attributes Style] {
    text-align: -webkit-center;
}  
div {
    display: block;
}
body, th, td, input, select, textarea, button {
    font-size: 14px;
    line-height: 1.5;
} 

}

	
</style>

<title>Books2u</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<style><%@include file="css/book/curationMain.css"%></style> 
</head>

<header>
	<jsp:include page="common/banner.jsp" flush="true" /><br>
	<jsp:include page="common/top.jsp" flush="true" /><br>
</header>

<body data-new-gr-c-s-check-loaded="14.1051.0" data-gr-ext-installed="">
	
	<hr color="#D7D7D7">
	<jsp:include page="book/search.jsp" flush="true" /> <br>
	<hr color="#D7D7D7">
	<jsp:include page="book/curationMain.jsp" flush="true" />
</body>
</html>