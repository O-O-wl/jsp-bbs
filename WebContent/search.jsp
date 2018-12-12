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
<script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
 crossorigin="anonymous">

</script>

<meta charset="UTF-8">
<title>작성자검색-DEMO</title>
</head>
<body>

<div class="container">

<div class="col-lg-4"></div>
<div class="col-lg-4">
	<div class="jumbotron" style="padding-top:20px">
<h4><b> 글 검색</b> </h4>
	<form>
		  <div class="form-group">
      		<label>작성자:</label>
     		<input name="search" type="text" class="form-control" value="<%=request.getParameter("search")==null?"":request.getParameter("search")%>"><br>
<button type="submit" class="btn btn-primary form-control">검색</button>
		   </div>
<a href="index.jsp" class="btn btn-info form-control">초기화면으로</a>
    	   
	</form>
</div>
<div class="col-lg-4"></div>
</div>
</div>


	<%
	int totalCount=0;
	String search;
	if(request.getParameter("search")==null){
 search ="";}
	else{
		search =request.getParameter("search");
	}
		
	  GetBoardListService service =GetBoardListService.getInstance();
	  List<Board> boards=service.findBySearch(search); 
		totalCount=boards.size();
		  %>

	  <c:set var="boards" value="<%=boards %>"/>
<h3 style="text-align: center"><b>검색 리스트</b> </h3>
<h4 style="text-align: center"><b> 총 [ <%=totalCount%> ]건의 게시물이 조회 되었습니다.</b> </h4>
</h3>

<table class="table table-hover table-bordered">
	
	  <tr>
		<td>작성자</td>
		<td>글내용</td>
		<td>작성일</td>
		<td>수정</td>
		<td>삭제</td>
	</tr>
	  <c:forEach var="board" items="${boards}">
<script>resultcount+=1;</script>

	  	<tr>
		<td>${board.user}</td>
		<td>${board.content}</td>
		<td>${board.regDate}</td>
		<td><a class="btn btn-warning" href="edit.jsp?id=${board.id}">수정</a></td>
		<td><a class="btn btn-danger" href="delete.jsp?id=${board.id}">삭제</a></td>
</tr>	
	  </c:forEach>
	  </table><% %>
	
	
</div>

</body>
</html>