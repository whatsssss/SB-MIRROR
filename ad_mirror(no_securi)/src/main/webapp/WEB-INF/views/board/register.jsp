<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>
<style>
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
 label[for="secret"] {
        position: relative;
        top: -2.6px;
      }
</style>

<div class="main-panel">
	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-absolute fixed-top navbar-transparent">
		<div class="container-fluid">
			<div class="navbar-wrapper">
				<div class="navbar-toggle">
					<button type="button" class="navbar-toggler">
						<span class="navbar-toggler-bar bar1"></span> 
						<span class="navbar-toggler-bar bar2"></span> 
						<span class="navbar-toggler-bar bar3"></span>
					</button>
				</div>
			</div>
			<button class="navbar-toggler" type="button" 
			data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-bar navbar-kebab"></span> 
				<span class="navbar-toggler-bar navbar-kebab"></span> 
				<span class="navbar-toggler-bar navbar-kebab"></span>
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
						<h4 class="card-title">Simple Table</h4>
					</div>
					<div class="card-body">
						<div class="table">
							<form class="user" action="/board/register" method="post" role='form'>
								<div class="form-group">
									<input type="text" name='title'
										class="form-control form-control-user" placeholder="title">
								</div>
								<div class="form-group">
									<input type="text" name='content' style="height: 20rem;"
										class="form-control form-control-user" placeholder="content">
								</div>
								<div class="form-group">
									<input type="text" name='writer'
										class="form-control form-control-user" value='<sec:authentication property ="principal.vo.userName"/>' readonly="readonly">
								</div>
								<button class="btn btn-facebook" type='submit'>submit</button>
								<a href="/board/list" class="btn btn-secondary"> go to List</a>
					<div class="pull-right form-group no-border" >
						<input type="checkbox" name="secret" id="secret"><label for="secret">Secret</label>
									</div>
								<hr/>
								<div class="uploadDiv">
									<input type="file" name="uploadFile" multiple>
								</div>
								<div class="uploadResult">
									<ul>
									</ul>
								</div>
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
$(document).ready(function(e){
	var formObj = $("form[role='form']");
	$("button[type='submit']").on("click",function(e){
		e.preventDefault();
		console.log("submit clicked");
		var str = "";
		$(".uploadResult ul li").each(function(i, obj){
			var jobj = $(obj);
			console.dir(jobj);
			str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";
		});
		formObj.append(str);
		formObj.submit(); 
	});
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
			beforeSend: function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
			}, 
			data: formData,
			type: 'POST',
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
	$(".uploadResult").on("click", "button", function(e){
		console.log("Delete file");
		var targetFile = $(this).data("file");
		var type = $(this).data("type");
		var targetLi = $(this).closest("li");
		$.ajax({
			url: '/deleteFile',
			data: {fileName: targetFile, type:type},
			beforeSend: function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
			},
			dataType: 'text',
			type: 'POST',
			success: function(result){
				alert(result);
				targetLi.remove();
			}
		}); // $.aJax
	});
});
</script>

	<%@include file="../includes/footer.jsp"%>