<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


            <form id="actionForm" action="/board2/modify" method="get">
              <input type='hidden' name='bno' value = '${vo.bno}'>
              <input type='hidden' name="page" value="${cri.page}">
                 <input type='hidden' name="type" value="${cri.type}">
   <input type='hidden' name="keyword" value="${cri.keyword}">
            </form>
            
                <div class="form-group">
                  <input type="text" name='bno' class="form-control form-control-user" value="${vo.bno}">
                </div>
                <div class="form-group">
                  <input type="text" name='title' class="form-control form-control-user" value="${vo.title}">
                </div>
                <div class="form-group">
                  <input type="text" name='content' class="form-control form-control-user" value="${vo.content}">
                </div>
                <div class="form-group">
                  <input type="text" name='writer' class="form-control form-control-user" value="${vo.writer}">
                </div>
                
                <button class="btn btn-primary modBtn">Modify</button>
                <button class="btn btn-primary listBtn">Go List</button>                
                
                <hr>                
        
<script
  src="https://code.jquery.com/jquery-2.2.4.min.js"
  integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
  crossorigin="anonymous"></script>
 
<script>
var actionForm = $("#actionForm")

$(".modBtn").click(function(e){
	actionForm.submit();
})
$(".listBtn").click(function(e){
	actionForm.attr("action","/board2/list");
	actionForm.submit();
})

</script> 
  
</body>
</html>