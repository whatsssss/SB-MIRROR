<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:useBean id="toDay" class="java.util.Date" />
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="/resources/img/apple-icon.png">
<link rel="icon" type="image/png" href="/resources/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Paper Dashboard 2 by Creative Tim</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />
<!--     Fonts and icons     -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200"
	rel="stylesheet" />
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">
<!-- CSS Files -->
<link href="/resources/css/bootstrap.min.css" rel="stylesheet" />
<link href="/resources/css/paper-dashboard.css?v=2.0.0" rel="stylesheet" />
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="/resources/demo/demo.css" rel="stylesheet" />

      <!-- ========== Meta Tags ========== -->
      <meta charset="UTF-8">
      <meta name="description" content="Cocoon -Portfolio">
      <meta name="keywords" content="Cocoon , Portfolio">
      <meta name="author" content="Pharaohlab">
      <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
      <!-- ========== Title ========== -->
      <title> Cocoon -Portfolio</title>
      <!-- ========== Favicon Ico ========== -->
      <!--<link rel="icon" href="fav.ico">-->



</head>

<style>
.my-hr1 {
	border: 0;
	height: 1px;
	background: #ccc;
}

.my-hr2 {
	border: 0;
	height: 2px;
	background: #ccc;
}

.my-hr3 {
	border: 0;
	height: 3px;
	background: #ccc;
}
</style>

<body class="">
	<div class="wrapper ">
		<div class="sidebar" data-color="white" data-active-color="danger">
			<!--
        Tip 1: You can change the color of the sidebar using: data-color="blue | green | orange | red | yellow"
    -->
			<div class="logo">
				<a href="http://www.creative-tim.com" class="simple-text logo-mini">
					<div class="logo-image-small">
						<img src="/resources/img/logo-small.png">
					</div>
				</a> <a href="http://www.creative-tim.com"
					class="simple-text logo-normal"> AD MIRROR <!-- <div class="logo-image-big">
            <img src="/resources/img/logo-big.png">
          </div> -->
				</a>
			</div>

			<div class="sidebar-wrapper">
				<hr class="my-hr2">
				<ul class="nav">
					<li style="margin-left: 25%;; font-weight: bold;">
						<p>
							<sec:authentication property="principal.vo.userName" />
							님 환영합니다
						</p>
					</li>
					<li style="margin-left: 15%; margin-top: 10px">
						<p>최근 접속일 : 19년 9월 18일</p>
					</li>
					<li><a href="/customLogout"
						class="btn btn-outline-warning btn-round ">로그 아웃</a></li>

				</ul>
				<hr class="my-hr2">
				<ul class="nav">
					<li><a href="/board/dashboard"> <i class="nc-icon nc-bank"></i>
							<p>광고 현황</p>
					</a></li>

					<li><a href="./map.html"> <i class="nc-icon nc-pin-3"></i>
							<p>Maps</p>
					</a></li>

					<li><a href="/board/gallery"> <i
							class="nc-icon nc-album-2"></i>
							<p>광고 관리</p>
					</a></li>
					<li><a href="/board/list"> <i class="nc-icon nc-tile-56"></i>
							<p>문의 게시판</p>
					</a></li>


				</ul>


			</div>
			<div style="height: 100px">
				<p>
					<sec:authentication property="principal.vo.userName" />
					님 환영합니다
				</p>
				<ul class="navbar-nav">
					<li class="nav-item btn-rotate dropdown"><a
						class="nav-link dropdown-toggle" href="http://example.com"
						id="navbarDropdownMenuLink" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> <i
							class="nc-icon nc-circle-10"></i>
					</a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item" href="/customLogout">Logout</a>
						</div></li>
				</ul>
			</div>
		</div>
		<script src="/resources/js/core/jquery.min.js"></script>