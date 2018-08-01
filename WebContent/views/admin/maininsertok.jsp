<%@page import="kr.or.bmark.dto.myBoard"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String result = (String)request.getAttribute("result");	 
    String msg = (String)request.getAttribute("msg");
    int totalboardcount = (int)request.getAttribute("totalboardcount");
	List<myBoard> mypagelist = (List)request.getAttribute("mypagelist");
	//int totalboardcount = (Integer)request.getAttribute("totalboardcount");
	
 %>

<c:forEach var="mypage" items="<%=mypagelist%>">
	<tr>
		<td><img alt="" src="${mypage.icon}"
			style="height: 16px; width: 16px"
			onerror="this.src='images/bmark.png';"></td>
		<td><a href="${mypage.addr}">${mypage.name}</a></td>
		<!-- name 클릭시 addr로 이동 -->
		<td>${mypage.content}</td>
		<td><button type="button" id="delete" class="btn btn-primary"
				onclick="datadelete(${mypage.mnbid},${cpage},${pagesize})">
				삭제<i class="fa fa-check spaceLeft"></i>
			</button></td>
	</tr>
</c:forEach>
<tr align="center">
	<td>
		<!--페이지 리스트 구현  --> <c:if test="${cpage>1}">
			<a onclick="pagelist(${cpage-1},${pagesize})">이전</a>
		</c:if> <c:forEach var="i" begin="1" end="${pagecount}" step="1">
			<c:choose>
				<c:when test="${cpage==i}">
					<font color='red'>[${i}]</font>
				</c:when>
				<c:otherwise>
					<a onclick="pagelist(${i},${pagesize})">[${i}]</a>
				</c:otherwise>
			</c:choose>
		</c:forEach> <c:if test="${cpage<pagecount}">
			<a onclick="pagelist(${cpage+1},${pagesize})">다음</a>
		</c:if>

	</td>
	<td colspan="2" align="center">총 게시물 수 : <%=totalboardcount%>
	</td>
</tr>
<script>
		alert( <%=msg%> );
</script>