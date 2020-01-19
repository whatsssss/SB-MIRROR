<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>
<style>
.modal-footer .hide{
display:none;
}
.bigPictureWrapper{
position: absolute;
display: none;
justify-content: center;
align-items: center;
top: 0%;
width: 100%;
height: 100%;
background-color: #E3E3E3;
z-index: 100;
background: rgba(255,255,255,0.5);
}
.bigPicture{
position: absolute;
display: flex;
justify-content: center;
align-items: center;
}
.bigPicture img {
width: 600px;
}
.uploadResult{
	width:100%;
	background-color: #E3E3E3;
}
.uploadResult ul{
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}
.uploadResult ul li{
	list-style: none;
	padding: 10px;
	align-content: center;
	text-align: center;
}
.uploadResult ul li img{
	width: 100px;
}

.uploadResult ul li span{
	color: white;
}
</style>
<div class="main-panel">
	<!-- Navbar -->
	<nav
		class="navbar navbar-expand-lg navbar-absolute fixed-top navbar-transparent">
		<div class="container-fluid">
			<div class="navbar-wrapper">
				<div class="navbar-toggle">
					<button type="button" class="navbar-toggler">
						<span class="navbar-toggler-bar bar1"></span> <span
							class="navbar-toggler-bar bar2"></span> <span
							class="navbar-toggler-bar bar3"></span>
					</button>
				</div>
			</div>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navigation" aria-controls="navigation-index"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-bar navbar-kebab"></span> <span
					class="navbar-toggler-bar navbar-kebab"></span> <span
					class="navbar-toggler-bar navbar-kebab"></span>
			</button>
<div class="collapse navbar-collapse justify-content-end"
				id="navigation">
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
	</nav>
	<!-- End Navbar -->
	<div class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header">
						<h4 class="card-title">${vo.bno}번 게시글 수정</h4>
					</div>
					<div class="card-body">

						<form id='form1' role='form'>
							<input type="hidden" name="bno" value="${cri.bno}"> <input
								type="hidden" name="page" value="${cri.page}"> <input
								type="hidden" name="amount" value="${cri.amount}"> <input
								type="hidden" name="type" value="${cri.type}"> <input
								type="hidden" name="keyword" value="${cri.keyword}">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							<div class="form-group">
								<input type="text" name='bno'
									class="form-control form-control-user"
									value='<c:out value="${vo.bno}"/>' readonly="readonly">
							</div>
							<div class="form-group">
								<input type="text" name='title'
									class="form-control form-control-user" placeholder="Title"
									value='<c:out value="${vo.title}"/>'>
							</div>
							<div class="form-group">
								<input type="text" name='content'
									class="form-control form-control-user" style="height: 20rem;" placeholder="Content"
									value='<c:out value="${vo.content}"/>'>
							</div>
							<div class="form-group">
								<input type="text" name='writer'
									class="form-control form-control-user" placeholder="Writer"
									value='<c:out value="${vo.writer}"/>' readonly="readonly">
							</div>
								<label>Files</label> 
								<div class="uploadDiv">
									<input type="file" name="uploadFile" multiple>
								</div>
								<div class="uploadResult">
									<ul>
									</ul>
							</div>
							</form>
						<div class="pull-right">
							<sec:authentication property="principal" var="pinfo"/>
							<sec:authorize access="isAuthenticated()">
							<c:if test="${pinfo.vo.userName eq vo.writer}">
								<button class="btn modBtn ">Modify</button>
							<button class="btn deleteBtn ">Delete</button>
							</c:if>
							</sec:authorize>
							<button class="btn listBtn ">go to List</button>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<form id="actionForm" action="/board/modify" method="get">
	<input type="hidden" name="bno" value="${cri.bno}"> <input
		type="hidden" name="page" value="${cri.page}"> <input
		type="hidden" name="amount" value="${cri.amount}"> <input
		type="hidden" name="type" value="${cri.type}"> <input
		type="hidden" name="keyword" value="${cri.keyword}">
</form>

<script>
$(document).ready(function(){
		var formObj = $("form[role='form']");
	$('.modBtn').on("click",function(e) {
					console.log("button click");
					e.preventDefault();

					var str ="";
					$(".uploadResult ul li").each(function(i, obj){
						var jobj = $(obj);
						console.dir(jobj);
						str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
						str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
						str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
						str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";
					});
					console.log("str : "+str);
					console.log("formObj : "+formObj);
					formObj.append(str).submit();
					formObj.submit(); 
					var formobj = $("#form1");
					formobj.attr("action", "/board/modify").attr("method","post").submit();
				});			
	(function(){
		var bno = '<c:out value="${vo.bno}"/>';
		console.log("bno : " +bno);
		$.getJSON("/board/getAttachList",{bno:bno},function(arr){
			console.log(arr);
			var str = "";
			$(arr).each(function(i,attach){
				//image type
				if (attach.fileType) {
					var fileCallPath = encodeURIComponent(attach.uploadPath+"/s_"+attach.uuid+"_"+attach.fileName);
					str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
					str += "<span>"+attach.fileName+"</span>";
					str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-danger btn-round btn-sm'><i class='fa fa-times'></i></button><br>";
					str += "<img src='/display?fileName="+fileCallPath+"'>";
					str +="</div>";
					str + "</li>";
					console.log("fileCallPath : "+fileCallPath);
				}else{
					str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
					str += "<span>"+attach.fileName+"</span><br/>";
					str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-danger btn-round btn-sm'><i class='fa fa-times'></i></button><br>";
					str += "<img src='/resources/img/attach.png'>";
					str += "</div>";
					str + "</li>";
				}
			});
			console.log("str : "+str);
			$(".uploadResult ul").html(str);
		});
	})();
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242800; //5MB
	function checkExtension(fileName, fileSize){ //확장자와 파일의 크기를 체크
		if(fileSize >= maxSize){
			alaert("파일 사이즈 초과");
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
	$("input[type='file']").change(function(e){
		var formData = new FormData();
		var inputFile = $("input[name='uploadFile']");
		var files = inputFile[0].files;
		for(var i = 0 ; i < files.length ; i++){
			if(!checkExtension(files[i].name, files[i].size)){
				return false;
			}
			formData.append("uploadFile", files[i]);
		}
		$.ajax({
			url: '/uploadAjaxAction',
			processData: false,
			contentType: false,
			data: formData,
			type: 'POST',
			beforeSend: function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
			}, 
			dataType: 'json',
			success: function(result){
				console.log(result);
				showUploadResult(result);
			}
		}); //$.ajax
	});
	function showUploadResult(uploadResultArr){
		if(!uploadResultArr || uploadResultArr.length == 0){return;}
		var uploadUL = $(".uploadResult ul");
		var str = "";
		$(uploadResultArr).each(function(i,obj){
			if (!obj.image) { //image파일이 아닌 일반파일의 경우 attach.png 이미지가 보인다.
				var fileCallPath = encodeURIComponent(obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName);
				var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
				str += "<li data-path='"+obj.uploadPath+"'";
				str += " data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'";
				str += "><div>";
				str += "<span>"+obj.fileName+"</span>";
				str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn btn-danger btn-round btn-sm'><i class='fa fa-times'></i></button><br>";
				str += "<img src='/resources/img/attach.png'>";
				str += "</div></li>";
			}else {
				var fileCallPath = encodeURIComponent(obj.uploadPath+"/s_"+obj.uuid+"_"+obj.fileName);
				str += "<li data-path='"+obj.uploadPath+"'";
				str += " data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'";
				str += "><div>";
				str += "<span>"+obj.fileName+"</span>";
				str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-danger btn-round btn-sm'><i class='fa fa-times'></i></button><br>";
				str += "<img src='/display?fileName="+fileCallPath+"'>";
				str += "</div></li>";
			}
		});
		uploadUL.append(str);
	}
});
$(".uploadResult").on("click", "button", function(e){
	console.log("delete file");
	if (confirm("Remove this file? ")) {
		var targetLi = $(this).closest("li");
		targetLi.remove();
	}
});
	var actionForm = $("#form1");
	
	$(".listBtn").on("click", function(e) {
		actionForm.find("bno").remove();
		actionForm.attr("action", "/board/list");
		actionForm.submit();
	});
	
	$('.deleteBtn').on(
			"click",
			function() {
				console.log("button click");
				var formObj = $("#form1");
				formObj.attr("action", "/board/remove").attr("method","post").submit();
			});	
</script>
<%@include file="../includes/footer.jsp"%>