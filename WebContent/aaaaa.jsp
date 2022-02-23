<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html lang="ko"><head>
            
<title>Books2u</title>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="title" content="브런치 책방에서 만나는 작가와 책">
<meta name="referrer" content="always">
<meta name="secureToken" value="">
<meta name="robots" content="max-image-preview:large">
<meta name="description" content="책에 가까이 작가에게 가까이, 내일이 더 기대되는 작가들의 책을 만나다.">
<meta property="article:author" content="brunch">
<meta property="og:site_name" content="brunch">
<meta property="og:title" content="브런치 책방에서 만나는 작가와 책">
<meta property="og:description" content="책에 가까이 작가에게 가까이, 내일이 더 기대되는 작가들의 책을 만나다.">
<meta property="og:image" content="https://t1.daumcdn.net/brunch/static/img/help/pc/publish/img_og.png">
<meta property="og:url" content="https://brunch.co.kr/publish">
<meta name="twitter:card" content="summary">
<meta name="twitter:app:name:iphone" content="brunch">
<meta name="twitter:app:id:iphone" content="1001388574">
<meta name="twitter:app:url:iphone" content="brunchapp://open">
<meta name="twitter:image" content="https://img1.daumcdn.net/thumb/S500x500.fpng/?fname=https://t1.daumcdn.net/brunch/static/img/help/pc/publish/img_og.png">
<meta name="twitter:title" content="브런치 책방에서 만나는 작가와 책">
<meta name="twitter:description" content="책에 가까이 작가에게 가까이, 내일이 더 기대되는 작가들의 책을 만나다.">
<meta property="fb:app_id" content="313683402170826">
<link rel="SHORTCUT ICON" href="//t1.daumcdn.net/brunch/static/icon/favicon/favicon64_150520.ico">
<link rel="apple-touch-icon-precomposed" sizes="180x180" href="//t1.daumcdn.net/brunch/static/icon/ios/icon152.png">
<link rel="apple-touch-icon-precomposed" sizes="152x152" href="//t1.daumcdn.net/brunch/static/icon/ios/icon152.png">
<link rel="apple-touch-icon-precomposed" sizes="120x120" href="//t1.daumcdn.net/brunch/static/icon/ios/icon120.png">
<!--[if lt IE 9]>
    <script src="//t1.daumcdn.net/brunch/static/libraries/js/jquery.min-1.11.3.js"></script>
<![endif]-->
<!--[if gte IE 9]><!-->
<script async="" src="https://www.google-analytics.com/analytics.js"></script><script async="" src="https://www.google-analytics.com/analytics.js"></script><script async="" src="https://www.google-analytics.com/analytics.js"></script><script async="" src="https://www.google-analytics.com/analytics.js"></script><script type="text/javascript" src="//t1.daumcdn.net/brunch/static/libraries/js/jquery.min-2.1.1.js"></script>
<!--<![endif]-->
<script type="text/javascript" src="//t1.daumcdn.net/brunch/static/libraries/js/jquery.cookie.min-1.4.1.js"></script>
<script type="text/javascript" src="//t1.daumcdn.net/brunch/static/libraries/js/jquery.xdomainrequest.min.js"></script>
<script type="text/javascript" src="//t1.daumcdn.net/brunch/static/libraries/js/handlebars.runtime.min-v3.0.0.js"></script>
<script type="text/javascript" src="//t1.daumcdn.net/brunch/static/libraries/js/userAgent.min-1.0.14.js"></script>
<script type="text/javascript" src="//t1.daumcdn.net/brunch/static/libraries/js/sentry.min.5.27.4.js?v=20220110" crossorigin="anonymous"></script>
<script type="text/javascript" src="//t1.daumcdn.net/brunch/static/libraries/js/clipboard.min.js"></script>
<script type="text/javascript" src="//t1.daumcdn.net/tiara/js/v1/tiara.min.js"></script>


<script type="text/javascript">
    window._platform = "pc";
    Sentry.init({
        dsn: 'https://7092d1f177184e73a6cda1ee2d14ecc4@aem-collector.daumkakao.io/3057',
        release: '202202161448',
        environment: 'prod'
    });
    Sentry.setTag("ua.platform", window._platform);
</script>

            <link rel="stylesheet" type="text/css" href="//t1.daumcdn.net/brunch/static/real/202202161448/css/B.css">
    
    <script type="text/javascript" src="//t1.daumcdn.net/brunch/static/libraries/js/jquery.word-break-keep-all.min-1.3.0.js"></script>
        <link rel="stylesheet" type="text/css" href="//t1.daumcdn.net/brunch/static/real/202202161448/product/B.Message.min.css">
    
       <link rel="stylesheet" type="text/css" href="//t1.daumcdn.net/brunch/static/real/202202161448/product/B.Font.min.css">
            
    <link rel="stylesheet" type="text/css" href="//t1.daumcdn.net/brunch/static/real/202202161448/css/B.Publish2.css">
</head>



<body data-new-gr-c-s-check-loaded="14.1050.0" data-gr-ext-installed="">

<tiara-page t-name="브런치 책방 화면" t-section="etc" t-page="bookshop" t-action-kind="ViewContentList"></tiara-page>

<div class="service_header article">
    <div class="wrap_inner">
        <div class="f_l">
            <button id="btnServiceMenu" type="button" class="f_l text_hide btn_menu img_ico #sidebar">메뉴</button>
            <h1 class="f_l"></h1>
                <span><a href="#" class="book_request book_request_link" data-is-author="">장바구니</a></span>
        </div>
        <div class="wrap_custom wrap_custom_now">
            <span>브런치 책방</span>
        </div>
        <div class="f_r">
            <div class="wrap_btn_search ">
            </div>
        </div>
    </div>
</div>
    
<div id="wrapSideMenu" class="">
    <main>
        <button type="button" id="btnCloseSideMenu" class="btn_close_side_menu img_side_menu ico_close f_r text_hide">닫기</button>
                    <div class="wrap_side_profile logout">
                <div class="logo_service"></div>
                <p class="slogan">You can make anything<br>by writing</p>
                <p class="slogan_writer">- C.S.Lewis -</p>
                <a href="#" class="#side_request btn_apply_author publish" id="brunchSigninButton" data-tiara-action-name="메뉴 > 시작하기 버튼 클릭" data-tiara-layer="login"><button class="btn_request">브런치 시작하기</button></a>
... (53KB 남음)