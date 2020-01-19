<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


 <select name="typeView">
                <option value="">--</option>
	            <option value="T" ${cri.type == 'T'? "selected":"" }>제목</option>
	            <option value="C" ${cri.type == 'C'? "selected":"" }>내용</option>
	            <option value="W" ${cri.type == 'W'? "selected":"" }>작성자</option>
	            <option value="TC" ${cri.type == 'TC'? "selected":"" }>제목+내용</option>            
	          </select>
	          <input type='text' name='keywordView' value="${cri.keyword}">
	          <button class="btn btn-primary searchBtn">Search</button>

<table border="1">
   <tr>
     <td>BNO</td>
     <td>TITLE</td>
     <td>WRITER</td>
     <td>REGDATE</td>
   </tr>
   <c:forEach items="${list}" var="vo">
   <tr>
     <td><c:out value="${vo.bno}"/></td>
     <td><a href='${vo.bno}' class='view'><c:out value="${vo.title}"/></a></td>
     <td><c:out value="${vo.writer}"/></td>
     <td><c:out value="${vo.regdate}"/></td>
   </tr>
   </c:forEach>
 </table>

<style>
.pagination {
  list-style: none;
  display: flex;
  
}

.pagination li {
  margin: 10px;
  float: left;
}

.active {
  background-color: red;
  font-weight: bold;
}

</style>
 
 <ul class="pagination">
<c:if test="${pm.prev}">		 
   <li class="page-item"><a class="page-link" href='${pm.start -1 }'>Previous</a></li>
   </c:if>
   
   <c:forEach begin="${pm.start}" end="${pm.end}" var="idx">
   <li class="page-item ${pm.current==idx?"active":""}"><a class="page-link " href='${idx}'>${idx}</a></li>
   
   
   </c:forEach>
   
   <c:if test="${pm.next}">
   <li class="page-item"><a class="page-link" href='${pm.end +1}'>Next</a></li>
   </c:if>
 </ul>
 
 <form id="actionForm">
   <input type='hidden' name="bno">
   <input type='hidden' name="page" value="${cri.page}">
   <input type='hidden' name="type" value="${cri.type}">
   <input type='hidden' name="keyword" value="${cri.keyword}">
 </form>

<script
  src="https://code.jquery.com/jquery-2.2.4.min.js"
  integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
  crossorigin="anonymous"></script>

<script>

var actionForm = $("#actionForm");

$(".view").on("click", function(e){
	
	e.preventDefault();
	var bno = $(this).attr("href");
	
	actionForm.find("input[name='bno']").val(bno);
	actionForm.attr("action","/board2/read");
	actionForm.submit();
	
});


$(".page-link").click(function(e){
	e.preventDefault();
	
	var pageNum = $(this).attr("href");
	
	actionForm.find("input[name='page']").val(pageNum);
	actionForm.attr("action","/board2/list");
	actionForm.submit();
	
})


$(".searchBtn").click(function(e) {
	
	var typeValue = $("select[name='typeView']").val();
	
	actionForm.find("input[name='page']").val(1);
	actionForm.find("input[name='type']").val(typeValue);
	actionForm.find("input[name='keyword']").val($("input[name='keywordView']").val());
	
	actionForm.submit();
})


</script>  
  

</body>
</html>