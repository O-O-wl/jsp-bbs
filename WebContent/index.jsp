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
<title>list1</title>
</head>
<body>
<h1> 방명록 </h1>
<h3> <a class="btn btn-primary" href="create.jsp" style="color:white" >글 작성 </a> </h3><br>
<h3> <a class="btn btn-success" href="list.jsp" style="color:white" >글 목록 </a> </h3> <br>
<h3> <a class="btn btn-warning" href="search.jsp" style="color:white" >글 검색</a></h3>

</body>
</html>