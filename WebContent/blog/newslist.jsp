<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    

 <%@ page import="com.mvc.dto.BlognewsboardDto" %> 
 <%@ page import="com.mvc.dao.BlogDao" %>
 <%@ page import="java.util.List" %>
 <%@ page import="java.util.Vector" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>

<style>
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
</style>

<style type="text/css">
.table{
font-size:13px;
}
#keyword{
width:250px;
height:25px;
font-size:13px;
text-align:center;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
    $("#keyword").keyup(function() {
        var k = $(this).val();
        $("#user-table > tbody > tr").hide();
        var temp = $("#user-table > tbody > tr > td:nth-child(5n+3):contains('" + k + "')");
        
        $(temp).parent().show();
    })
})
</script>
</head>
<body style="font-family: 'Jeju Gothic', sans-serif;">

<%
	BlogDao dao = new BlogDao();
	List<BlognewsboardDto> list = dao.selectAll();
	
	int count= 0;
	int number=0;
	
	int cnt = dao.getAllCount();
	
	int pageSize = 7;
	
	String pageNum = request.getParameter("pageNum");
	
	if(pageNum == null){
		pageNum = "1";
	}
	int currentPage = Integer.parseInt(pageNum);
	
	int startRow = (currentPage-1)*pageSize +1;
	int endRow = currentPage * pageSize;
	
	
	System.out.println(dao.selectAll());
	List<BlognewsboardDto> selectAll = null;
	
	if(cnt != 0){
		selectAll = dao.selectAll(startRow, endRow);
	}
%>	
	<!-- ??????(??????) -->
	<div id="header">
		<%@ include file="/form/header.jsp"%>
	</div>

	<br>
	<br>
	<h1 style="margin-left:50px;"><strong>?????? ??????&nbsp;????</strong></h1>
	<br>
	<br>
	
	<div id="input-form" style="margin-left:800px;">
            <input type="text" id="keyword"  placeholder="???????????? ?????? ?????????????">
        </div> 
        
        <br>
		<table class="table table-bordered" style="width:800px; margin-left:250px;" id="user-table">
			<thead style="background-color:#DCE2F0; color:#50586C; border:0px solid;">
				<tr align="center" height="40" >
					<td width="50" >??????</td>
					<td width="100" >?????????</td>
					<td width="400" >??????</td>
					<td width="150" >?????????</td>
					<td width="80">?????????</td>
				</tr>
			</thead>
	
<%
		for(int i=0; i<selectAll.size();i++){
			
			BlognewsboardDto blognews = (BlognewsboardDto) selectAll.get(i);
%>	

	<tr align="center">
		<td><%=blognews.getSeq() %></td>
		<td><%=blognews.getWriter() %></td>
		<td><a href="selectone.jsp?seq=<%=blognews.getSeq()%>&pageNum=<%=pageNum%>"><%=blognews.getTitle() %></a></td>
		<td><%=blognews.getRegdate() %></td>
		<td><%=blognews.getViewcnt() %></td>
	</tr>
<%
		}
%>	
		</table>
		
		<div style="margin-left:820px;">
			 ??? ????????? : <%=cnt %> ??? &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type = "button" value="????????????" onclick="location.href='blog_main.jsp'" 
				style="background-color: #7b9acc; color:#FCF6F5; width:70px; height:30px; font-size:12px; border:0px;">
			<input type = "button" value="?????????" onclick="location.href='insert.jsp'" 
				style="background-color: #7b9acc; color:#FCF6F5; width:70px; height:30px; font-size:12px; border:0px;">
		</div>
		
	<br>
            <div style="font-size:12px;"align="center">
<%
		if(cnt != 0){
			int pageCount = cnt/pageSize + (cnt%pageSize == 0? 0:1);
			int pageBlock = 3;
			int startPage = ((currentPage-1)/pageBlock) * pageBlock + 1;
			
			int endPage = startPage + pageBlock - 1;
			if(endPage > pageCount){
				endPage = pageCount;
		}
			
%>        
<div id="pageBlock">
	<%
	if(startPage > pageBlock){
		%>
		<a href="newslist.jsp?pageNum=<%=startPage-pageBlock%>">   ??????   </a>
		<%
	}
	
	//??????
	for(int i=startPage; i<=endPage; i++){
		%>
		<a href ="newslist.jsp?pageNum=<%=i%>">   <%=i%>   </a>
		<%
	}
	//??????
	if(endPage < pageCount){
		%>
		<a href ="newslist.jsp?pageNum=<%=startPage+pageBlock%>">   ??????   </a>
		<%
	}
	%>
	</div>
<%
		}
%>	
		</div>
	<br>	
	<br>
		<!-- ??????(??????) -->
	<div id="footer">
		<%@ include file="/form/footer.jsp"%>
	</div>
	
	
	
</body>
</html>