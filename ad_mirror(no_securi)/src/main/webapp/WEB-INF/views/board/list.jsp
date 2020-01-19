<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp"%>
<style>
.pagination li a {
	margin: 0 4px; /* 0 is for top and bottom. Feel free to change it */
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
}

.page-item.active .page-link {
	z-index: 1;
	color: white;
	background-color: olive;
	border-color: olive;
}
.nc-cloud-download-93 {
        position: relative;
        top: 3.5px;
      }
</style>
<div class="main-panel">
	<div class="content" style="margin-top : 30px;">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header">
						<h4 class="card-title ">문의 게시판</h4>
						<div>
							<a href="/board/register" class="btn btn-sm btn-round pull-right">Regist</a>
						</div>
						<p class="card-category">광고하고 싶은 이미지 파일을 올려주시거나 궁금하신 사항을 질문해주세요.</p>
						<hr>
					</div>
					<div class="card-body">
						<div class="table">
							<table class="table">
								<thead  style=" background-color:#f4f3ef;">
								<tr>
										<td>BNO</td>
										<td>TITLE</td>
										<td>WRITER</td>
										<td>REGDATE</td>
									</tr>
								</thead>
								<tbody class="notice">
								<c:forEach items="${list}" var="vo">
									<tr>
									<fmt:formatDate pattern="yyyy-MM-dd" var="regdate" value="${vo.regdate}" />
									<fmt:formatDate pattern="HH:mm" var="regdate_HH" value="${vo.regdate}" />
									<fmt:formatDate pattern="yyyy-MM-dd" var="today" value="${toDay}" />
										<td style="color:red;  font-weight: 700;">공지</td>
										<td><a href='${vo.bno }' class="view" style="color:red;  font-weight: 700;"> <c:out
													value="${vo.title} " /></a>
													<c:if test="${vo.filecheck == true }">
										<i class="nc-icon nc-cloud-download-93" ></i></c:if>
										[${vo.replycnt }]
										<c:if test="${toDay.time-vo.regdate.time <= (1000*60*60*24)}">
										<span style="color:red;  font-weight: 700; font-size: xx-small;">NEW</span>
										</c:if></td>
										<td><c:out value="${vo.writer}" /></td>
										<td>	
										${regdate == today? regdate_HH: regdate}
										</td>
									</tr>
								</c:forEach>
								</tbody>
								<tbody>
								<c:forEach items="${list1}" var="vo1">
									<tr>
									<fmt:formatDate pattern="yyyy-MM-dd" var="regdate" value="${vo1.regdate}" />
									<fmt:formatDate pattern="HH:mm" var="regdate_HH" value="${vo1.regdate}" />
									<fmt:formatDate pattern="yyyy-MM-dd" var="today" value="${toDay}" />
										<td><c:out value='${vo1.secret == true? "비밀글":vo1.bno}' /></td>
										<td><a href='${vo1.bno }' class="view" > 
										<sec:authentication property="principal" var="pinfo"/>
										<c:out value='${vo1.secret == true  && pinfo.vo.userName != vo1.writer && pinfo.vo.authList[0].auth != "ROLE_ADMIN"? "비밀 글 입니다." : vo1.title } ' /></a>
										<c:if test="${vo1.filecheck == true }">
										<i class="nc-icon nc-cloud-download-93" ></i></c:if>
										[${vo1.replycnt }]
										<c:if test="${toDay.time-vo1.regdate.time <= (1000*60*60*24)}">
										<span style="color:red;  font-weight: 700; font-size: xx-small;">NEW</span>
										</c:if>
										</td>
										<td><c:out value="${vo1.writer}" /></td>
										<td>	
										${regdate == today? regdate_HH: regdate}
										</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
							<hr>
							<ul class="pagination justify-content-left">
								<c:if test="${pm.prev}">
									<li class="page-item"><a class="page-link"
										href='${pm.start-1}'>Previous</a></li>
								</c:if>
								<c:forEach begin="${pm.start}" end="${pm.end}" var="idx">
									<li class="page-item ${pm.current == idx? "active":""}"><a
										class="page-link" href='${idx}'>${idx}</a></li>
								</c:forEach>
								<c:if test="${pm.next}">
									<li class="page-item"><a class="page-link"
										href='${pm.end+1}'>Next</a></li>
								</c:if>
								<form class="form-inline ml-auto" onsubmit="return false">
									<div class="form-group no-border">
										<input type="text" name="keywordView" value="${cri.keyword}"
											class="form-control" placeholder="Search by Title/Writer"
											onkeypress="if(event.keyCode==13 ){goSearch();}">
									</div>
									<button type="submit"
										class="btn btn-neutral btn-icon btn-round">
										<i class="nc-icon nc-zoom-split Isearch"></i>
									</button>
								</form>
							</ul>

							<!-- modal start-->
							<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
								aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title">${result}</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body"></div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">닫기</button>
										</div>
									</div>
								</div>
							</div>
							<!-- modal end -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
		<form id="actionForm" action="/board/list" method="get">
			<input type="hidden" name="page" value="${cri.page}"> <input
				type="hidden" name="amount" value="${cri.amount}"> <input
				type="hidden" name="type" value="${cri.type}"> <input
				type="hidden" name="keyword" value="${cri.keyword}">
		</form>
		<script type="text/javascript">
			var actionForm = $("#actionForm");
			$(".page-link").on("click", function(e) {
				e.preventDefault();
				var targetPage = $(this).attr("href");
				console.log("targetPage:" + targetPage);
				actionForm.find("input[name='page']").val(targetPage);
				actionForm.submit();
			});
			$(".view").on("click",function(e) {
				e.preventDefault();
				var targetBno = $(this).attr("href");
				actionForm.attr("action", "/board/read");
				actionForm
						.append("<input type='hidden' name='bno' value="+targetBno+">");
				actionForm.submit();
			});
			$(document).ready(function() {
				var csrfHeaderName = "${_csrf.headerName}";
				var csrfTokenValue = "${_csrf.token}";
				var result = '<c:out value="${result}"/>';
				var result_modify = '<c:out value="${result_modify}"/>';
				checkModal(result);
				console.log(result);

				function checkModal(result) {
					if (result === '') {
						return;
					}
					if (result === "Modify") {
						$(".modal-body").html("게시글이 수정되었습니다.");
					}
					if (result === "Remove") {
						$(".modal-body").html("게시글이 삭제되었습니다.");
					}
					if (parseInt(result) > 0) {
						$(".modal-body").html("게시글이 등록되었습니다.");
					}
					$("#myModal").modal("show");
				}
			});

			$(".Isearch").on("click", function(e) {
				goSearch();
			});
			
			function goSearch() {
				onKeypress = "javascript:if(event.keyCode==13){goSearch();}"
				var keyword = $("input[name='keywordView']");
				var keywordValue = keyword.val();
				if (keywordValue.trim().length == 0) {
					alert("검색어를 제대로 입력하세요.");
					return;
				}
				$("input[name='keyword']").val(keywordValue);
				$("input[name='page']").val(1);
				var selectValue = "T or W";
				/* alert(selectValue); */
				$("input[name='type']").val(selectValue);
				actionForm.submit();
				console.log("goSearch");
			}
		</script>
	</div>
	<%@include file="../includes/footer.jsp"%>