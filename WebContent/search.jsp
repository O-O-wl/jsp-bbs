<%@ page 
import ="service.*,board.*,java.util.*"
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
<title>list1</title>
</head>
<body>
<div class="container">
	<div class="col-lg-4"></div>
	<div class="col-lg-4">
	<div class="jumbotron" style="padding-top:20px">
	<form>
		  <div class="form-group">
      		<label>작성자:</label>
     		<input name="search" type="text" class="form-control w50" value="<%=request.getParameter("search")==null?"":request.getParameter("search")%>">
     		
    	   </div>
    	   <button type="submit" class="btn btn-primary form-control">검색</button>
	</form>
	</div>
	<div class="col-lg-4"></div>
</div>
</div>
	<%
	String search;
	if(request.getParameter("search")==null){
 search ="";}
	else{
		search =request.getParameter("search");
	}
		
	  GetBoardListService service =GetBoardListService.getInstance();
	  List<Board> boards=service.findBySearch(search); %>
	  
	  <c:set var="boards" value="<%=boards %>"/>
	 <table class="table table-bordered mt5"> 
	  <tr>
		<td>작성자</td>
		<td>글내용</td>
		<td>작성일</td>
		<td>수정</td>
		<td>삭제</td>
	</tr>
	  <c:forEach var="board" items="${boards}">
	  	<tr>
		<td>${board.user}</td>
		<td>${board.content}</td>
		<td>${board.regDate}</td>
		<td><a class="btn btn-warning" href="edit.jsp?id=${board.id}">수정</a></td>
		<td><a class="btn btn-danger" href="delete.jsp?id=${board.id}">삭제</a></td>
</tr>	
	  </c:forEach>
	  </table><% %>
	<a href="index.jsp" class="btn btn-info">목록으로</a>

</body>
</html>