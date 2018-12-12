<%@ page 
import ="service.*,board.*,java.util.*,java.sql.*"
language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<title>게시글 등록 -DEMO</title>
</head>
<%
	if(request.getMethod().equals("POST")){%>
	<jsp:useBean id="board" class="board.Board">
		<jsp:setProperty name="board" property="*" />
	</jsp:useBean>
	<%
	if(board.getUser()==null||board.getContent()==null||board.getPassword()==null){%>
	<script>
		alert("입력되지않은 사항이있습니다.")
		history.back();
	</script>
<%	}
	else{
    board.setRegDate(new Timestamp(System.currentTimeMillis()));
 	WriteBoardService service =WriteBoardService.getInstance();
	service.write(board);
	response.sendRedirect("list.jsp");
	}}
	else{%>


<body>
<div class="container">
	<div class="col-lg-4"></div>
	<div class="col-lg-4">
		<div class="jumbotron" style="padding-top:20px">
	<form method="post">
<h3 style="text-align: center"><b>글 작성</b> </h3>
		   <div class="form-group">
      		<label>작성자</label>
     		<input type ="text" name="user" class="form-control w200" />
    	   </div>
    	   
    	   <div class="form-group">
      		<label>패스워드</label>
     		<input type ="password" name="password" class="form-control w200"/>
    	   </div>
    	   
    	   <div class="form-group">
      		<label>글내용</label>
     		<textArea name="content" class="form-control w200" style="height:250px"></textArea>
    	   </div>
		   <Button type="submit" class="btn btn-info" >작성</Button>
		<a href="list.jsp" class="btn btn-info">목록으로</a>
	</form>
</div>

<div class="col-lg-4"></div>
</div>
</div>


</body>
<%} %>
</html>