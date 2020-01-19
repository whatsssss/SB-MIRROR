<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


            <form class="user" action="/board2/register" method="post">
                <div class="form-group">
                  <input type="text" name='title' class="form-control form-control-user" placeholder="Title">
                </div>
                <div class="form-group">
                  <input type="text" name='content' class="form-control form-control-user" placeholder="Content">
                </div>
                <div class="form-group">
                  <input type="text" name='writer' class="form-control form-control-user" placeholder="writer">
                </div>
                
                <button class="btn btn-primary ">Submit</button>                
                
                <hr>                
              </form>
</body>
</html>