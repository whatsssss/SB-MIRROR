<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@include file="../includes/header.jsp"%>

<style>
.modal-footer .hide {
	display: none;
}

.bigPictureWrapper {
	position: absolute;
	display: none;
	justify-content: center;
	align-items: center;
	top: 0%;
	width: 100%;
	height: 100%;
	background-color: #E3E3E3;
	z-index: 100;
	background: rgba(255, 255, 255, 0.5);
}

.bigPicture {
	position: absolute;
	display: flex;
	justify-content: center;
	align-items: center;
}

.bigPicture img {
	width: 600px;
}

.uploadResult {
	width: 100%;
	background-color: #E3E3E3;
}

.uploadResult ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}

.uploadResult ul li {
	list-style: none;
	padding: 10px;
	align-content: center;
	text-align: center;
}

.uploadResult ul li img {
	width: 100px;
}

.uploadResult ul li span {
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
							class="nc-icon nc-circle-10"></i> <span
							class="d-lg-none d-md-block">Some Actions</span>
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
						<h4 class="card-title">${vo.bno}번게시글</h4>
					</div>
					<div class="card-body">
						<div class="table">

							<div class="form-group">
								<label>Title</label> <input type="text" name='title'
									class="form-control form-control-user" placeholder="Title"
									value='<c:out value="${vo.title}"/>' readonly="readonly">

							</div>
							<div class="form-group">
								<label>content</label> <input type="text" name='content'
									class="form-control form-control-user" placeholder="Content"
									value='<c:out value="${vo.content}" />' readonly="readonly"
									style="height: 20rem;">
							</div>
							<div class="form-group">
								<label>writer</label> <input type="text" name='writer'
									class="form-control form-control-user" placeholder="Writer"
									value='<c:out value="${vo.writer}"/>' readonly="readonly">
							</div>
							<div class="form-group filecheck">
								<label>Files</label>
								<div class="bigPictureWrapper">
									<div class="bigPicture"></div>
								</div>
								<div class="uploadResult">
									<ul>
									</ul>
								</div>
							</div>

							<div class="pull-right">
								<sec:authentication property="principal" var="pinfo" />
								<sec:authorize access="isAuthenticated()">
									<c:if test="${pinfo.vo.userName eq vo.writer}">
										<button class="btn modBtn ">Modify/Delete</button>
									</c:if>
								</sec:authorize>
								<button class="btn addReplyBtn ">Reply</button>
								<button class="btn listBtn ">go to List</button>
							</div>
						</div>
					</div>
				</div>
				<div class="card shadow mb-4">
					<div class="card-body">
						<ul class="replyList list-group">
							<li class="list-group-item">댓글 작업 중</li>
						</ul>
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

	<!-- modal start-->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Reply</h5>
					<form class="form-inline ml-auto" onsubmit="return false">
						<div class="pull-right form-group no-border">
							<input type="checkbox" name="secret"><label>Secret</label>
						</div>
					</form>
				</div>
				<div class="modal-body">
					<input type="hidden" class="form-control mbno" name="bno"
						value="${vo.bno}" readonly="readonly"> <input
						type="hidden" class="form-control mrno" name="rno" value=""
						readonly="readonly"> <input type="text"
						class="form-control" name="reply" value="" placeholder="댓글 추가하세요."
						onkeypress="if(event.keyCode==13 ){addReply();}"> <input
						type="hidden" class="form-control" name="replyer"
						value='<sec:authentication property ="principal.vo.userName"/>'
						readonly="readonly"> <input type="hidden"
						class="form-control" name="replyDate" value="${reply.replyDate}"
						readonly="readonly">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary modifyBtn hide"
						data-dismiss="modal">Modify</button>
					<button type="button" class="btn btn-secondary deleteBtn hide"
						data-dismiss="modal">Delete</button>
					<button type="button" class="btn btn-secondary replyBtn"
						data-dismiss="modal">Add Reply</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- modal end -->
<script type="text/javascript" src="/resources/js/reply.js"></script>
<script>
	$(document).ready(function(){
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		  //Ajax Spring security header...
		$(document).ajaxSend(function(e, xhr, options){
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
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
						str += "<img src='/display?fileName="+fileCallPath+"'>";
						str +="</div>";
						str + "</li>";
						console.log("fileCallPath : "+fileCallPath);
					}else{
						str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
						str += "<span>"+attach.fileName+"</span><br/>";
						str += "<img src='/resources/img/attach.png'>";
						str += "</div>";
						str + "</li>";
					}
				}); 
				if (str == "") {
					$(".filecheck").hide();
				}
				console.log("str : "+str);
				$(".uploadResult ul").html(str);
			});
		})();
	});
	$(".uploadResult").on("click", "li", function(e){
		console.log("view image");
		var liObj = $(this);
		var path = encodeURIComponent(liObj.data("path")+"/"+liObj.data("uuid")+"_"+liObj.data("filename"));
		console.log("path : "+path);
		if (liObj.data("type")) {
			showImage(path.replace(new RegExp(/\\/g),"/"));
		}else {
			//download
			self.location = "/download?fileName="+path;
		}
	});
	function showImage(fileCallPath){
		console.log("==========")
		console.log("fileCallPath : "+fileCallPath);
		$(".bigPictureWrapper").css("display","flex").show();
		$(".bigPicture").html("<img src='/display?fileName="+fileCallPath+"'>")
		.animate({width: '100%', height: '100%'}, 1000);
	};
	$(".bigPictureWrapper").on("click", function(e){
		$(".bigPicture").animate({width: '0%', height: '0%'}, 1000);
		setTimeout(function(){
			$(".bigPictureWrapper").hide();
		}, 1000);
	});
	var bno = ${vo.bno};
    var replyList = $(".replyList");
    showPage();
	function showPage(){
        replyList.html("");
        replyService.getList(bno, function (arr) {
            console.log(arr);
            var str = '';
            if (arr.length == 0) {
				replyList.append("<li class='list-group-item'>No Reply</li>")
			}
            var mem = "${pinfo.vo.authList[0].auth}";
            var user = "${pinfo.vo.userName}"
            for (var i = 0; i < arr.length; i++) {
                var {rno, bno, reply, replyer, replyDate, secret} = arr[i];
                if (secret == true && user != replyer && mem != 'ROLE_ADMIN') {
					reply = "비밀 댓글";
				}
                var temp = "<li class='list-group-item' data-rno="+rno+">"+
                        "<div><strong class='primary-font'>"+replyer+"</strong>"+
                        "<small class='pull-right text-mute'>"+displayTime(replyDate)+"</small></div>"+
                        "<p class='reply'>"+reply+"</p></li>";
                str += temp;
            }
            replyList.append(str);
        })
	};
	replyList.on("click","li", function(e) {
		var rno = $(this).attr("data-rno");
		replyService.getReply(rno, function(reply){
			var secret = reply.secret;
			var originreplyer = $("input[name='replyer']").val();
			console.log("OriginReplyer : "+ originreplyer);
			console.log("Replyer : "+ reply.replyer);
			$(".mrno").val(reply.rno);
            $("input[name='reply']").val(reply.reply);
            if (originreplyer == reply.replyer) {
            	$('#myModal').modal("show");
            	$("input[name='secret']").prop("checked", secret);
                $(".replyBtn").addClass("hide");
                $(".modifyBtn").removeClass("hide");
                $(".deleteBtn").removeClass("hide");
              
    			var check = $("input[name='secret']").is(":checked");
    			console.log(check);
    			console.log(secret);
    			
			}
            
		})
	});

		$(".replyBtn").on("click", function (e) {
			addReply();
		});
		
		function addReply(){
			let obj = {
					bno : $(".mbno").val(),
					reply : $("input[name='reply']").val(),
					replyer : $("input[name='replyer']").val(),
					secret : $("input[name='secret']").is(":checked")

				
				}
			
			
		};
		
		$(".addReplyBtn").on("click", function(e) {
			
			$("input[name='reply']").val("");
			$('input:checkbox[name="secret"]').prop("checked", false);
			$("#myModal").modal("show");
			$(".replyBtn").removeClass("hide");
			$(".modifyBtn").addClass("hide");
			$(".deleteBtn").addClass("hide");
			
		});
		
		var actionForm = $("#actionForm");

		$(".modBtn").on("click", function(e) {
			actionForm.submit();
		});

		$(".listBtn").on("click", function(e) {
			actionForm.find("bno").remove();
			actionForm.attr("action", "/board/list");
			actionForm.submit();

		});
		
		$(".deleteBtn").on("click", function() {
			 var rno = $("input[name='rno']").val();
			 replyService.removeReply(rno, function(){
				 alert("removed...");
				 $("#myModal").modal('hide')
				 showPage();
			 })
		 });
		
		$(".modifyBtn").on("click", function() {
			 var obj = {
			            rno: $(".mrno").val(),
			            reply: $("input[name='reply']").val(),
			            secret : $("input[name='secret']").is(":checked")
			        }
			 replyService.updateReply(obj, function(){
				 alert("modified...");
				 $("#replyModal").modal('hide')
				 showPage();
			 })
		 });
		function displayTime(timeValue){
	    	var today = new Date();
	    	var gap = today.getTime() - timeValue;
	    	var dateObj = new Date(timeValue);
	    	var str = "";
	    	if (gap < (1000*60*60*24) && today.getDate() <= dateObj.getDate()) {
				var hh = dateObj.getHours();
				var mi = dateObj.getMinutes();
				var ss = dateObj.getSeconds();
				return [(hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi, ':', (ss > 9 ? '' : '0') + ss].join('');
			}else {
				var yy = dateObj.getFullYear();
				var mm = dateObj.getMonth() + 1; //getMonth() is zero-based
				var dd = dateObj.getDate();
				return [yy, '/', (mm > 9 ? '' : '0') + mm, '/', (dd > 9 ? '' : '0') + dd].join('');
			}
	    };
	</script>
<%@include file="../includes/footer.jsp"%>