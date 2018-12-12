<%@ page language="java" 
import ="service.*,board.*,java.util.*"
contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
 <%
 int pageNumber=1;
 int option=1;
 if(request.getParameter("option")!=null){
	 option=Integer.parseInt(request.getParameter("option"));
 }
 if(request.getParameter("pageNumber")!=null){
	 pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
 }
 GetBoardListService service = GetBoardListService.getInstance();
 List<Integer> pagination =service.getPagination();
 List<Board> boards=service.findAll(pageNumber,option);
 %>
 <c:set var="boards" value="<%=boards %>"/>
<meta charset="UTF-8">
<title>전체리스트-DEMO</title>
</head>
<body>
<h3 style="text-align: center"><b> 페이지네이션 게시물 리스트 </b> </h3>
<h4 style="text-align: center"><b> 현재페이지 : <%=pageNumber%> </b> </h4>
<form>
<select name="option" onchange="this.form.submit()" >
	<option value="1" <%if(option==1)out.print("selected");%>>최근등록순</option>
	<option value="2" <%if(option==2)out.print("selected");%>>오래된 순</option>
	<option value="3" <%if(option==3)out.print("selected");%>>작성자 이름순</option> 
</select>
</form>
<table class="table table-hover table-bordered" style="text-align:center; border:1px solid #dddddd  ">
<tr>
		<td>작성자</td>
		<td>글내용</td>
		<td>작성일</td>
		<td>수정</td>
		<td>삭제</td>
</tr>
<tr></tr>
<c:forEach items="${boards}" var ="board">
<tr>
		<td>${board.user}</td>
		<td>${board.content}</td>
		<td>${board.regDate}</td>
		<td><a class="btn btn-warning" href="edit.jsp?id=${board.id}">수정</a></td>
		<td><a class="btn btn-danger" href="delete.jsp?id=${board.id}">삭제</a></td>
</tr>	
</c:forEach>


</table>
<c:set var="currentPage" value="<%=pageNumber%>"/>
<c:set var="pagination" value="<%=pagination%>"/>
<c:set var="option" value="<%=option%>"/>
<c:forEach items="${pagination}" var="page">
	<c:choose>
	<c:when test="${currentPage==page}">
		<a class="btn btn-warning active" href="list.jsp?pageNumber=${page}&option=${option}">${page}</a>
		
	</c:when>
	<c:otherwise>
	<a class="btn btn-warning" href="list.jsp?pageNumber=${page}&option=${option}">${page}</a>
	</c:otherwise>
	</c:choose>
</c:forEach><br></br>
<a href="index.jsp" class="btn btn-info">초기화면으로 </a>
<a href="create.jsp" class="btn btn-info right">글쓰기 </a>
<h3 style="text-align: center"><b><span class="glyphicon glyphicon-user"></span> 게시글 등록 누구나 가능합니다.</b></h3>
</body>
</html>