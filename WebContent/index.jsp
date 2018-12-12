<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" 
        rel="stylesheet" media="screen">
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<meta charset="UTF-8">
<title>201331024이동영 DEMO</title>
</head>
<body>

<div class="container">
      <div class="col-lg-4"></div>
      <div class="col-lg-4">
            <div class="jumbotron" style="padding-top:20px">
<h2> <b>이동영의 방명록</b> </h2>
<table class ="table table-boardered">
      
            <tr>
            <td> <a class="btn btn-primary" href="create.jsp" style="color:white">글 작성 </a> </td>
            <td><a class="btn btn-success" href="list.jsp" style="color:white">글 목록 </a> </td>
            </tr>       
            <td><a class="btn btn-warning" href="search.jsp" style="color:white">글 검색</a></td>
      
     
            <td ><a href="https://github.com/ldcpaul/JSP_FINAL_EXAM_PUBLIC" style="color:white" class="btn btn-danger">웹 소스
             </a></td>
</tr>
      

</table>

                  <form method="post">
                        <div class="form-group">
                              <label>DB ID</label>
<input type="text" name="user" class="form-control w200" value="lastexam" readonly/>
                        </div>

                        <div class="form-group">
                              <label>DB PASSWORD</label>
<input type="text" name="text" class="form-control w200" value="1234" readonly />
                        </div>

                        <div class="form-group">
                              <label>DB SCHEMA</label>
<input type="text" name="password" class="form-control w200" value="addressbook" readonly />
                        </div>
<h5>
<div style="color:black"><b> 테이블구조 </b></div><br></h5><img class="img-thumbnail" alt ="80" src="DB.png" width="350" />
<br><br> </form>
            </div>
            <div class="col-lg-4"></div>
      </div>
</div>
</body>


</body>
</html>