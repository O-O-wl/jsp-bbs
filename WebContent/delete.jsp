<%@ page 
import ="service.*,board.*,java.util.*"
language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" 
        rel="stylesheet" media="screen">
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<meta charset="UTF-8">
<%
if(request.getMethod().equals("POST")){%>
	<jsp:useBean id="board" class="board.Board">
		<jsp:setProperty name="board" property="*" />
	</jsp:useBean>
	
 <%
String password=board.getPassword();
DeleteBoardService service1= DeleteBoardService.getInstance();
GetBoardListService service2 =GetBoardListService.getInstance();
String truePassword = (String)(service2.findById(board.getId()).getPassword());
if(password!=null){
if(password.equals(truePassword)){
	service1.delete(board.getId());
	response.sendRedirect("list.jsp");
}
else{%>
	<script>alert("비밀번호 오류"); location.href="list.jsp"</script><%
}}
else{
	%>
	<script>alert("비밀번호를 입력해주세요 ");
	location.href="list.jsp"</script><%
}}
else{%>
<title>게시글삭제-DEMO</title>
</head>
<body>
<div class="container">

	<div class="col-lg-4"></div>
	<div class="col-lg-4">
		<div class="jumbotron" style="padding-top:20px">
			<h3 style="text-align: center"><b>비밀번호 확인</b> </h3>
	<form method="post">
		  <div class="form-group">
      		<label>비밀번호</label>
     		<input name="password" type="password" class="form-control w50" >
     		
    	   </div>
<button type="submit" class="btn btn-primary form-control">삭제</button>
	</form>
</div>
<div class="col-lg-4"></div>
</div>
</div>
<%} %>

</body>
</html>