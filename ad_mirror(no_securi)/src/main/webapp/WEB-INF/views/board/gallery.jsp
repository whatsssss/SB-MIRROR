<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@include file="../includes/header.jsp"%>

<!-- ========== STYLESHEETS ========== -->
<!-- Bootstrap CSS -->
<link href="/resources/gallery/assets/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Fonts Icon CSS -->
<link href="/resources/gallery/assets/css/font-awesome.min.css"
	rel="stylesheet">
<link href="/resources/gallery/assets/css/et-line.css" rel="stylesheet">
<link href="/resources/gallery/assets/css/ionicons.min.css"
	rel="stylesheet">
<!-- Carousel CSS -->
<link href="/resources/gallery/assets/css/slick.css" rel="stylesheet">
<!-- Magnific-popup -->
<link rel="stylesheet"
	href="/resources/gallery/assets/css/magnific-popup.css">
<!-- Animate CSS -->
<link rel="stylesheet"
	href="/resources/gallery/assets/css/animate.min.css">
<!-- Custom styles for this template -->
<link href="/resources/gallery/assets/css/main.css" rel="stylesheet">

<style type="text/css">
#floatMenu {
	position: absolute;
	top: 0px;
}

.fileuploader {
	background: color 0;
	margin: 0px;
}

@font-face {
	font-family: 'NanumGothic';
	src: url(/resources/fonts/NanumGothic.ttf) format('truetype');
}

.test {
	font-family: NanumGothic;
}
</style>



<div class="main-panel">
	<div class="content" style="margin-top: 30px;">
		<div class="row">
			<div class="col-md-4">
				<div>
					<div class="card card-user" id="floatMenu">
						<div class="image">
							<img src="/resources/gallery/assets/img/bg.png" alt="...">
						</div>
						<div class="card-body test" style="font-size: medium">
							<div class="author">
								<a href="#"> <img class="avatar border-gray"
									src="/resources/gallery/assets/img/mr_yg.JPG" alt="...">
									<h1 class="title">
										<sec:authentication property="principal.vo.userName" />
									</h1>
								</a>
								<p class="description">
									가입일 :
									<sec:authentication property="principal.vo.regDate" />
								</p>
							</div>
							<p class="description text-center">
								- 관리자 정보 - <br> 주소 :
								<sec:authentication property="principal.vo.address" />
								<br> e-mail :
								<sec:authentication property="principal.vo.email" />
								<br> hp :
								<sec:authentication property="principal.vo.hp" />
							</p>
						</div>
						<div class="card-footer">
							<hr>
						</div>
						<div style="float: left; margin-left: 180px">
							<button class="btn  submit" id="open_btn">광고 추가</button>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-8">
				<div class="card card-user">
					<div style="margin-top: 15px"></div>
					<hr>
					<div class="portfolio gutters grid img-container"
						style="margin-top: 20px;">
						<div class="grid-sizer col-sm-12 col-md-6 col-lg-3"></div>
						<div class="grid-item branding  col-sm-12 col-md-6 col-lg-3">
							<a href="/resources/gallery/assets/img/ad/airbnb.jpg"
								title="project name gg">
								<div class="project_box_one">
									<img src="/resources/gallery/assets/img/ad/airbnb.jpg"
										alt="pro1" />
									<div class="product_info">
										<div class="product_info_text">
											<div class="product_info_text_inner">
												<i class="ion ion-plus"></i>
												<h4>사진 1</h4>
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>
						<div class="grid-item  branding architecture  col-md-6 col-lg-3">
							<a href="/resources/gallery/assets/img/ad/diet.jpg"
								title="project name 2">
								<div class="project_box_one">
									<img src="/resources/gallery/assets/img/ad/diet.jpg" alt="pro1" />
									<div class="product_info">
										<div class="product_info_text">
											<div class="product_info_text_inner">
												<i class="ion ion-plus"></i>
												<h4>project name</h4>
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>
						<div class="grid-item  design col-sm-12 col-md-6 col-lg-3">
							<a href="/resources/gallery/assets/img/ad/GalaxyS10.jpg"
								title="project name 5">
								<div class="project_box_one">
									<img src="/resources/gallery/assets/img/ad/GalaxyS10.jpg"
										alt="pro1" />
									<div class="product_info">
										<div class="product_info_text">
											<div class="product_info_text_inner">
												<i class="ion ion-plus"></i>
												<h4>project name</h4>
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>
						<div
							class="grid-item  photography design col-sm-12 col-md-6 col-lg-3">
							<a href="/resources/gallery/assets/img/ad/hospital.jpg"
								title="project name 5">
								<div class="project_box_one">
									<img src="/resources/gallery/assets/img/ad/hospital.jpg"
										alt="pro1" />
									<div class="product_info">
										<div class="product_info_text">
											<div class="product_info_text_inner">
												<i class="ion ion-plus"></i>
												<h4>project name</h4>
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>
						<div
							class="grid-item  branding photography  col-sm-12 col-md-6 col-lg-3">
							<a href="/resources/gallery/assets/img/ad/imp.jpg"
								title="project name 5">
								<div class="project_box_one">
									<img src="/resources/gallery/assets/img/ad/imp.jpg" alt="pro1" />
									<div class="product_info">
										<div class="product_info_text">
											<div class="product_info_text_inner">
												<i class="ion ion-plus"></i>
												<h4>project name</h4>
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>
						<div
							class="grid-item   architecture design col-sm-12 col-md-6 col-lg-3">
							<a href="/resources/gallery/assets/img/ad/kakaoStore.jpg"
								title="project name 5">
								<div class="project_box_one">
									<img src="/resources/gallery/assets/img/ad/kakaoStore.jpg"
										alt="pro1" />
									<div class="product_info">
										<div class="product_info_text">
											<div class="product_info_text_inner">
												<i class="ion ion-plus"></i>
												<h4>project name</h4>
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>
						<div
							class="grid-item  photography architecture col-sm-12 col-md-6 col-lg-3">
							<a href="/resources/gallery/assets/img/ad/lol.jpg"
								title="project name 5">
								<div class="project_box_one">
									<img src="/resources/gallery/assets/img/ad/lol.jpg" alt="pro1" />
									<div class="product_info">
										<div class="product_info_text">
											<div class="product_info_text_inner">
												<i class="ion ion-plus"></i>
												<h4>project name</h4>
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>
						<div
							class="grid-item  branding design  col-sm-12 col-md-6 col-lg-3">
							<a href="/resources/gallery/assets/img/ad/soCar.jpg"
								title="project name 5">
								<div class="project_box_one">
									<img src="/resources/gallery/assets/img/ad/soCar.jpg"
										alt="pro1" />
									<div class="product_info">
										<div class="product_info_text">
											<div class="product_info_text_inner">
												<i class="ion ion-plus"></i>
												<h4>project name</h4>
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>
						<div class="grid-item architecture  col-sm-12 col-md-6 col-lg-3">
							<a href="/resources/gallery/assets/img/ad/sixthesix.jpg"
								title="project name 4">
								<div class="project_box_one">
									<img src="/resources/gallery/assets/img/ad/sixthesix.jpg"
										alt="pro1" />
									<div class="product_info">
										<div class="product_info_text">
											<div class="product_info_text_inner">
												<i class="ion ion-plus"></i>
												<h4>project name</h4>
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>
						<div
							class="grid-item  photography architecture col-sm-12 col-md-6 col-lg-3">
							<a href="/resources/gallery/assets/img/ad/jj_main.jpg"
								title="project name 5">
								<div class="project_box_one">
									<img src="/resources/gallery/assets/img/ad/jj_main.jpg"
										alt="pro1" />
									<div class="product_info">
										<div class="product_info_text">
											<div class="product_info_text_inner">
												<i class="ion ion-plus"></i>
												<h4>project name</h4>
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>
						<div
							class="grid-item  branding design  col-sm-12 col-md-6 col-lg-3">
							<a href="/resources/gallery/assets/img/ad/90.jpg"
								title="project name 5">
								<div class="project_box_one">
									<img src="/resources/gallery/assets/img/ad/90.jpg" alt="pro1" />
									<div class="product_info">
										<div class="product_info_text">
											<div class="product_info_text_inner">
												<i class="ion ion-plus"></i>
												<h4>project name</h4>
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>
						<div class="grid-item architecture  col-sm-12 col-md-6 col-lg-3">
							<a href="/resources/gallery/assets/img/ad/yanolja.jpg"
								title="project name 4">
								<div class="project_box_one">
									<img src="/resources/gallery/assets/img/ad/yanolja.jpg"
										alt="pro1" />
									<div class="product_info">
										<div class="product_info_text">
											<div class="product_info_text_inner">
												<i class="ion ion-plus"></i>
												<h4>project name</h4>
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>
						<div class="grid-item architecture  col-sm-12 col-md-6 col-lg-3">
							<a href="/resources/gallery/assets/img/ad/dduk.jpg"
								title="project name 4">
								<div class="project_box_one">
									<img src="/resources/gallery/assets/img/ad/dduk.jpg" alt="pro1" />
									<div class="product_info">
										<div class="product_info_text">
											<div class="product_info_text_inner">
												<i class="ion ion-plus"></i>
												<h4>project name</h4>
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>
						<div class="grid-item architecture  col-sm-12 col-md-6 col-lg-3">
							<a href="/resources/gallery/assets/img/portfolio/port2.png"
								title="project name 4">
								<div class="project_box_one">
									<img src="/resources/gallery/assets/img/portfolio/port2.png"
										alt="pro1" />
									<div class="product_info">
										<div class="product_info_text">
											<div class="product_info_text_inner">
												<i class="ion ion-plus"></i>
												<h4>project name</h4>
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>
						<div class="grid-item architecture  col-sm-12 col-md-6 col-lg-3">
							<a href="/resources/gallery/assets/img/portfolio/port3.png"
								title="project name 4">
								<div class="project_box_one">
									<img src="/resources/gallery/assets/img/portfolio/port3.png"
										alt="pro1" />
									<div class="product_info">
										<div class="product_info_text">
											<div class="product_info_text_inner">
												<i class="ion ion-plus"></i>
												<h4>project name</h4>
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>
						<div class="grid-item architecture  col-sm-12 col-md-6 col-lg-3">
							<a href="/resources/gallery/assets/img/portfolio/port4.png"
								title="project name 4">
								<div class="project_box_one">
									<img src="/resources/gallery/assets/img/portfolio/port4.png"
										alt="pro1" />
									<div class="product_info">
										<div class="product_info_text">
											<div class="product_info_text_inner">
												<i class="ion ion-plus"></i>
												<h4>project name</h4>
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>
						<div class="grid-item architecture  col-sm-12 col-md-6 col-lg-3">
							<a href="/resources/gallery/assets/img/portfolio/port4.png"
								title="project name 4">
								<div class="project_box_one">
									<img src="/resources/gallery/assets/img/portfolio/port4.png"
										alt="pro1" />
									<div class="product_info">
										<div class="product_info_text">
											<div class="product_info_text_inner">
												<i class="ion ion-plus"></i>
												<h4>project name</h4>
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>
						<div class="grid-item architecture  col-sm-12 col-md-6 col-lg-3">
							<a href="/resources/gallery/assets/img/portfolio/port4.png"
								title="project name 4">
								<div class="project_box_one">
									<img src="/resources/gallery/assets/img/portfolio/port4.png"
										alt="pro1" />
									<div class="product_info">
										<div class="product_info_text">
											<div class="product_info_text_inner">
												<i class="ion ion-plus"></i>
												<h4>project name</h4>
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>
						<div class="grid-item architecture  col-sm-12 col-md-6 col-lg-3">
							<a href="/resources/gallery/assets/img/portfolio/port4.png"
								title="project name 4">
								<div class="project_box_one">
									<img src="/resources/gallery/assets/img/portfolio/port4.png"
										alt="pro1" />
									<div class="product_info">
										<div class="product_info_text">
											<div class="product_info_text_inner">
												<i class="ion ion-plus"></i>
												<h4>project name</h4>
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>
						<div class="grid-item architecture  col-sm-12 col-md-6 col-lg-3">
							<a href="/resources/gallery/assets/img/portfolio/port4.png"
								title="project name 4">
								<div class="project_box_one">
									<img src="/resources/gallery/assets/img/portfolio/port4.png"
										alt="pro1" />
									<div class="product_info">
										<div class="product_info_text">
											<div class="product_info_text_inner">
												<i class="ion ion-plus"></i>
												<h4>project name</h4>
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>


					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">광고 등록하기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
							<input type="file" name="uploadFile" multiple>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							<button class="uploadBtn">Send</button>
				</div>
			</div>
		</div>
	</div>
	<footer class="footer footer-black  footer-white ">
		<div class="container-fluid">
			<div class="row">
				<nav class="footer-nav">
					<ul>
						<li><a href="https://www.creative-tim.com" target="_blank">Creative
								Tim</a></li>
						<li><a href="http://blog.creative-tim.com/" target="_blank">Blog</a>
						</li>
						<li><a href="https://www.creative-tim.com/license"
							target="_blank">Licenses</a></li>
					</ul>
				</nav>
				<div class="credits ml-auto">
					<span class="copyright"> © <script>
						document.write(new Date().getFullYear())
					</script>, made with <i class="fa fa-heart heart"></i> by Creative Tim
					</span>
				</div>
			</div>
		</div>
	</footer>
</div>
<!--   Core JS Files   -->
<script src="/resources/gallery/assets/js/core/jquery.min.js"></script>
<script src="/resources/gallery/assets/js/core/popper.min.js"></script>


<!--  Google Maps Plugin    -->
<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
<!-- Chart JS -->
<script src="/resources/gallery/assets/js/plugins/chartjs.min.js"></script>
<!--  Notifications Plugin    -->
<script src="/resources/gallery/assets/js/plugins/bootstrap-notify.js"></script>
<!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
<script
	src="/resources/gallery/assets/js/paper-dashboard.min.js?v=2.0.0"
	type="text/javascript"></script>
<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
<script src="/resources/gallery/assets/demo/demo.js"></script>
<!-- jquery -->
<script src="/resources/gallery/assets/js/jquery.min.js"></script>
<!-- bootstrap -->
<script src="/resources/gallery/assets/js/popper.js"></script>
<script src="/resources/gallery/assets/js/bootstrap.min.js"></script>
<script src="/resources/gallery/assets/js/waypoints.min.js"></script>
<!--slick carousel -->
<script src="/resources/gallery/assets/js/slick.min.js"></script>
<!--Portfolio Filter-->
<script src="/resources/gallery/assets/js/imgloaded.js"></script>
<script src="/resources/gallery/assets/js/isotope.js"></script>
<!-- Magnific-popup -->
<script src="/resources/gallery/assets/js/jquery.magnific-popup.min.js"></script>
<!--Counter-->
<script src="/resources/gallery/assets/js/jquery.counterup.min.js"></script>
<!-- WOW JS -->
<script src="/resources/gallery/assets/js/wow.min.js"></script>
<!-- Custom js -->
<script src="/resources/gallery/assets/js/main.js"></script>

<!-- font -->
<link href="/resources/gallery/dist/font/font-fileuploader.css"
	media="all" rel="stylesheet">

<!-- css -->
<link href="/resources/gallery/dist/jquery.fileuploader.min.css"
	media="all" rel="stylesheet">

<!-- js -->

<script src="/resources/gallery/dist/jquery.fileuploader.min.js" type="text/javascript"></script>

<script>
	// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
	var floatPosition = parseInt($("#floatMenu").css('top'));
	// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );

	$(window).scroll(function() {
		// 현재 스크롤 위치를 가져온다.
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + floatPosition + "px";
		console.log(floatPosition)
		console.log(scrollTop)

		/* 애니메이션 없이 바로 따라감
		 $("#floatMenu").css('top', newPosition);
		 */

		$("#floatMenu").stop().animate({
			"top" : newPosition
		}, 500);

	}).scroll();

	$(".submit").on("click", function(e) {

		$("#myModal").modal("show");
	})
</script>
<script type="text/javascript">
$(document).ready(function(e){
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242800; //5MB
	function checkExtension(fileName, fileSize){ //확장자와 파일의 크기를 체크
		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
		if (regex.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		return true;
	}
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	$(".uploadBtn").on("click", function(e){
		var formData = new FormData();
		var inputFile = $("input[name='uploadFile']");
		console.log(inputFile);
		var files = inputFile[0].files;
		console.log(files);
		for(var i = 0 ; i < files.length ; i++){
			if(!checkExtension(files[i].name, files[i].size)){
				return false;
			}
			formData.append("uploadFile", files[i]);
		}
		console.log('ajax start....');
		$.ajax({
			url: '/s3upload',
			processData: false,
			contentType: false,
			beforeSend: function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
			}, 
			data: formData,
			type: 'POST',
			dataType: 'json',
			success: function(result){
				console.log(result);
			}
		}); //$.ajax
		alert("전송완료");
	});
});
</script>
</body>
</html>
