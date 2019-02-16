<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/list.css" /></head>
  <script type="text/javascript" src="/resources/js/upload.js"></script>
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
@import url(//fonts.googleapis.com/earlyaccess/jejuhallasan.css);
#jh{font-family: 'Jeju Hallasan', cursive;}

#footer2{
margin-top:30px;}
</style>
<script type="text/javascript">
$(function(){
		if(window.location.href=="http://localhost:8181/thema/family" || window.location.href.includes("http://localhost:8181/thema/family?page="))
		{
			$("#family").css('background-color','wheat');
		}	
	



});	


</script>
</head>
<body>
<%@include file="../Header.jsp" %>
<div id="wrap">
	<div class="content">
	
	<div >
            <img src="../resources/imgs/mainthema.jpg">
            
      	</div>
      	<div class="pl-cate" id="jh">
			
			<ul class="plc-list" id="sub_category">
				<li><a href="/thema" id="allthema" style="margin-left: -40px;">전체보기</a></li>
				<li><a href="/thema/study" id="sunsa">교육</a></li>
				<li><a href="/thema/date" id="samgook">데이트</a></li>
				<li><a href="/thema/family" id='korea'>가족</a></li>
			</ul>
		</div>
		<div class="pl-sort">

			<div align="right" style="margin-top:-19px;">
				<ul>
					<select name="name">
						<option value="#" selected="">정렬방법</option>
						<option value="#">이름순</option>
						<option value="#">별점순</option>
					</select>
				</ul>
			</div>
		</div>
	<div class="clearfix">
	</div>
	
	<div class="glist">
		<ul class="listman">
		<c:forEach items="${list}" var="boardVO" varStatus="status">
		<li>
			<div class="listimg">
				<a href="/thema/read?bno=${boardVO.bno}">
				<img src="/displayFile?fileName=${boardVO.fullName}">
				
            	</a>		
			</div>
			<div class="additem">
				<p class="gname">${boardVO.history_name}</p>			
				<p class="gname_pre" style="text-overflow:elipsis;">${boardVO.thema}</p>
				<p class="account">
				★ ${boardVO.star}				
            	</p>
			</div>
		</li>
		</c:forEach>
    
	</ul>
		
	</div>
		
</div>
	
	<div class="text-center">
		<ul class="pagination">
			<c:if test="${pageMaker.prev}">
				<li><a href="/thema/family?page=${pageMaker.startPage-1}">&laquo;</a></li>
			</c:if>
			
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				<li 
					<c:out value="${pageMaker.cri.page == idx?'class=active':''}"/>>
				<a href="/thema/family?page=${idx}">${idx}</a>
				</li>
			</c:forEach>
			
			<c:if test="${pageMaker.next && pageMaker.endPage>0 }">
				<li><a href="/thema/family?page=${pageMaker.endPage +1}">&raquo;</a></li>
			</c:if>
			
		</ul>
	</div>
	
	
</div>
<%@include file="../MainFooter.jsp" %>

</body>
</html>