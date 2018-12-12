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
 <%request.setCharacterEncoding("utf-8"); %>
<meta charset="UTF-8">
<title>게시글수정-DEMO</title>
</head>
<%
if(request.getMethod().equals("POST")){%>
	<jsp:useBean id="board" class="board.Board">
		<jsp:setProperty name="board" property="*" />
	</jsp:useBean>
	
<%

String password=board.getPassword();
GetBoardListService service= GetBoardListService.getInstance();
String truePassword = (String)(service.findById(board.getId()).getPassword());
if(password!=null){
if(password.equals(truePassword)){
	service.update(board);
	response.sendRedirect("list.jsp");
}
else{%>
	<script>alert("비밀번호 오류 ")</script><%
}}
else{
	%>
	<script>alert("비밀번호를 입력해주세요 ")</script><%
}

}
else{
	int id=Integer.parseInt(request.getParameter("id"));
	GetBoardListService service= GetBoardListService.getInstance();
	Board board=service.findById(id);
	
	
%>
<c:set var="board" value="<%=board %>" />
<%} %>
<body>
<div class="container">
	
	<div class="col-lg-4"></div>
	<div class="col-lg-4">
		<div class="jumbotron" style="padding-top:20px">
<h3 style="text-align: center"><b>글 수정</b> </h3>
	<form method="post">
	
		<div class="form-group">
      		<label>게시물 번호</label>
    	<input name="id" class="form-control w200" value="${board.id}" readOnly>
	   </div>
			
		   <div class="form-group">
      		<label>작성자</label>
     		<input name="user" class="form-control w50" value="${board.user}" readOnly>
    	   </div>
    	   
    	   <div class="form-group">
      		<label>패스워드</label>
     		<input name="password" type="password" class="form-control w50" >
    	   </div>
    	   
    	   <div class="form-group">
      		<label>글내용</label>
     		<textarea name="content" class="form-control w200"  style="height:250px">${board.content}</textarea>
    	   </div>
    	   <button class="btn btn-info" type="submit">수정</button>
    	   
    	   <a href ="list.jsp" class="btn btn-info" type="submit">목록으로</a>
    	   
</form>
</div>
<div class="col-lg-4"></div>
</div>
</div>


</body>
</html>