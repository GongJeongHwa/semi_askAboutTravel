<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.mvc.dto.UserDto" %>   
<% 
   UserDto userdto = (UserDto)session.getAttribute("dto");
   String user_id = "";
   if(userdto != null){
	   user_id = userdto.getUser_id();
   }
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" type="text/css" href="schedule.css">

<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href='<%=request.getContextPath()%>/fullcalendar/main.css' rel='stylesheet' />
<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src='<%=request.getContextPath()%>/fullcalendar/main.js'></script>
<script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>
<script src="https://unpkg.com/tippy.js@6"></script>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
 
<title>createSchedule</title>

<!-- ???????????? -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lato:ital@1&display=swap" rel="stylesheet">

<!-- ???????????? -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">

 <style type="text/css">
 
 @charset "UTF-8";

 
.toast-success {
	background-color: #77ca8a !important;
	font-weight: bold !important;
	font-size: 12pt !important; 
}

.toast-error {
	background-color: #BD362F !important;
}

.toast-info {
	background-color: #2F96B4 !important;
}

.toast-warning {
	background-color: #F89406 !important;
}

.toast-top-right {
	top: 7%;
}

.btn-3d {
	position: relative;  
	transition: top .01s linear;
	text-shadow: 1 1px 0 rgba(0,0,0,0.15);
}
 
.btn-3d:active {
	top: 10px;
}
.btn-group dropstart{
 width:300px;
 height:300px;
 
 }
.btn-group dropstart .dropdown-menu { 
 
  padding: 3px;
  border-radius: 1.5rem;
  display: flex;
  flex-direction: column;
  align-items: center;	
  position: relative;
  box-shadow: 1px 1px 8px -4px rgba(0, 0, 0, 0.6); 
} 
   
 

<!--container>

.demo-title {
  text-align: center;
   line-height: 1;
  font-size: 3rem;
  margin-bottom: 50px; 
}

.suggestionTable {
  display: table;
  width: 90%;  
}
.suggestionTable .suggestionOpt {
  width: 27%;
  height:600px; 
  background: white;
  float: right;
  padding: 2%;
  text-align: center;
  transition: all 0.3s ease-in-out;
  overflow-y: auto;
  scrollbar-color: #d4aa70 #e4e4e4;
  scrollbar-width: thin;
 
}


.suggestionTable .suggestionOpt::-webkit-scrollbar {
  width: 10px;
}

.suggestionTable .suggestionOpt::-webkit-scrollbar-track {
  background-color: #e4e4e4;
  border-radius: 200px;
}

.suggestionTable .suggestionOpt::-webkit-scrollbar-thumb {
  border-radius: 200px;
  background-image: linear-gradient(180deg, #36d0b6 0%, #708ad4 99%);
  box-shadow: inset 2px 2px 5px 0 rgba(#fff, 0.5);
}
     
     
.suggestionTable .suggestionOpt:nth-child(even) {
  margin: 0 2%;
}
.suggestionTable .suggestionOpt:hover {
  cursor: pointer;
  color:linear-gradient(180deg, #36d0b6 0%, #708ad4 99%);
  box-shadow: 0px 2px 15px rgba(0, 0, 0, 0.1);
  transform: scale(1.04);
}
.suggestionTable .suggestionOpt:hover i,
.suggestionTable .suggestionOpt:hover h1,
.suggestionTable .suggestionOpt:hover span,
.suggestionTable .suggestionOpt:hover b {
  color: #76d6b6;
}
.suggestionTable .suggestionOpt:hover .front {
  opacity: 0;
  visibility: hidden;
}
.suggestionTable .suggestionOpt:hover .back {
  opacity: 1 !important;
  visibility: visible !important;
}
.suggestionTable .suggestionOpt:hover .back a.button {
  transform: translateY(0px) !important;
}
.suggestionTable .suggestionOpt hr {
  border: none;
  border-bottom: 1px solid #f0f0f0;
}
.suggestionTable .suggestionOpt i {
  font-size: 2rem;
  color: #d8d8d8;
  transition: all 0.3s ease-in-out;
}
.suggestionTable .suggestionOpt h1 {
  margin: 10px 0;
  color: #212121;
  transition: all 0.3s ease-in-out;
}
.suggestionTable .suggestionOpt p {
  color: #999;
  padding: 0 10px;
  line-height: 1.3;
} 
@media screen and (max-width: 600px) {
  .suggestionTable .suggestionOpt {
    padding: 5%;
    width: 90%;
  }
  .suggestionTable .suggestionOpt:nth-child(even) {
    margin: 30px 0 !important;
  }
}
 
 
#dragdrop{
	 scrollbar-color: #d4aa70 #e4e4e4;
  scrollbar-width: thin;
}
 
 
#dragdrop::-webkit-scrollbar {
  width: 10px; 
  height:5px;
  opacity:50%;
}

#dragdrop::-webkit-scrollbar-track {
  background-color: #e4e4e4;
  border-radius: 100px;
  opacity:50%;
}

#dragdrop::-webkit-scrollbar-thumb {
  border-radius: 100px;
  background-image: linear-gradient(180deg, #36d0b6 0%, #708ad4 99%);
  box-shadow: inset 2px 2px 5px 0 rgba(#fff, 0.5);
  opacity:50%;
}
 
 img{
 border-radius: 7px;
 }
 
  
.travleInput{ 
  border-radius: 1rem;
  box-sizing: border-box;
  color: #0d172a;
  cursor: pointer; 
  font-size:16px;
  line-height: 1;
  padding: 10px;
  text-align: center; 
  box-shadow: 1px 1px 1px rgba(166, 175, 195, 0.5); 
  width:100%;
}
 

	.dropdown-menu{
	 
  overflow-y: auto;
  overflow-x:hidden;
  scrollbar-color: #d4aa70 #e4e4e4;
  scrollbar-width: thin;
  text-align:center;
	width:300px; 
	 
	 }
	 
	 
.dropdown-menu::-webkit-scrollbar {
  width: 10px; 
  opacity:50%;
}

.dropdown-menu::-webkit-scrollbar-track {
  background-color: #e4e4e4;
  border-radius: 100px;
  opacity:50%;
}

.dropdown-menu::-webkit-scrollbar-thumb {
  border-radius: 100px;
  background-image: linear-gradient(180deg, #36d0b6 0%, #708ad4 99%);
  box-shadow: inset 2px 2px 5px 0 rgba(#fff, 0.5);
  opacity:50%;
}
     
     
     
.button-67 {
  background-color: #fff;
  border: 0 solid #bac4d1;
  border-radius: 1rem;
  box-sizing: border-box; 
  cursor: pointer; 
  padding:5px;
  line-height: 1; 
  text-align: center; 
  box-shadow: 3px 3px 3px rgba(166, 175, 195, 0.5);
  user-select: none;
  -webkit-user-select: none;
  touch-action: manipulation; 
}

.button-67:hover {
  background-color: #8ccfc7;
  color: #fff;
}

@media (min-width: 768px) {
  .button-67 {
    font-size: 1.125rem; 
  }
}
    html{font-family: 'Noto Sans KR', sans-serif; }
    
    
    #modalAddress{
    font-size:18px;
    }
     
 </style>
 
<script>
let photopath = 'https://maps.googleapis.com/maps/api/place/photo?maxwidth=1000&photo_reference=';
let apikey = '&key=AIzaSyBURtfwi-GrNQHLcH9QSc0MJgEzhVdXfzg';

  //userid
  let userid = "<%=user_id %>";

  //??????????????? ?????? ??????
  let tourlist = new Array();
  let thumbnail = new Array();
  let nation = new Array();
  let city = new Array();
  let nations_citys = "";
  let thumbnailpath = "";
  
  
  //????????? ??????
  let calendar = new Object();
  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    calendar = new FullCalendar.Calendar(calendarEl, {
      initialView: 'dayGridMonth',
      
      eventDidMount: function(info) {
          tippy(info.el, {
        	  html: true,
              content:  info.event.extendedProps.description,//????????? ?????????????????? ???????????? ???????????????. 
          });
      }
    });
    calendar.render();
  });

  	//modal
	var myModal = document.getElementById('myModal')
	var myInput = document.getElementById('myInput')
	myModal.addEventListener('shown.bs.modal', function () {
			myInput.focus()
			});
  
</script>



<!-- date javascript -->
<script>
	var dateChange = () => {  
		
		for(var i = 0; i < tourlist.length; i++){
			var temp = $("#datepicker").val().split("???");
			var temp2 = temp[0] + temp[1];
			
			if(tourlist[i].date == temp2){
				if(confirm("?????? ?????? ????????? ????????? ????????????. ?????? ?????????????????????????")){
					break;
				}else{
					clearDay();
					return;
				}
			}
		}
		
		$("#temp").text($("#datepicker").val()+"?????? ??????");
	};
	
	//???????????? ?????? ?????? ???
	function input(){
		//????????? ????????? ?????? ?????? ????????? ????????? ??? 
		if($("#addlist").find("th").length == 0){
			alert("????????? ????????? ????????????.");
			return;
		}
		
		//?????? ???????????? ????????????
		if(confirm("?????? ????????? ????????? ?????????????????????????")){
			
			var templist = [];
			//??????????????? ?????????
/*  			$("#addlist").find("th").each(function(){
				templist.push($(this).find("input").eq(0).val());
			});  */ 
			$("#addlist").find("th").each(function(){
				if($(this).find("input").eq(0).val() != "00:00"){
					templist.push($(this).find("input").eq(0).val());
				}
			});  
			
			for(var i = 0; i < templist.length-1; i++){
				for(var j = i+1; j < templist.length; j++){
					if(templist[i] > templist[j]){
						alert("?????? ????????? ?????? ???????????????.");
						return;
					}
				}
			}
			
			
			
			//??????
			var date = $("#datepicker").datepicker("getDate");
			var formatdate = $.datepicker.formatDate("yy-mm-dd", date);
			console.log(formatdate); // yyyy-mm-dd??? ?????????
			
			//?????? ????????? ????????? ????????? ?????? ????????? ?????????????????? -> ????????? ????????? ??????,
			for(var i = 0; i < tourlist.length; i++){
				if(tourlist[i].date == formatdate){
					//???????????? ?????? ?????? ????????? ??????
					tourlist.splice(i,1);
					thumbnail.splice(i,1);
					nation.splice(i,1);
					city.splice(i,1);
					break;
				}
			}
			
			
			var data = new Object();
			data.date = formatdate;
			
			var thumbnaildata = new Object();
			thumbnaildata.date = formatdate;
			var thumbnailString = "";
			
			var nationdata = new Object();
			nationdata.date = formatdate;
			var nationString = "";
			
			var citydata = new Object();
			citydata.date = formatdate;
			var cityString = "";
			
			var placeString = "";
			
			$("#addlist").find("th").each(function(){
	            
	            placeString += $(this).find('input[type=time]').eq(0).val()+"|";
	            placeString += $(this).find('input[type=hidden]').eq(0).val() + "|";
	            placeString += $(this).find('input[type=hidden]').eq(1).val() + "|";
	            placeString += $(this).find('input[type=hidden]').eq(2).val() + "|";
	            
	            var tempPath = $(this).find('input[type=hidden]').eq(3).val();
	            if(!(tempPath.includes('icons'))){
	               var totalPath = photopath + photoRf(tempPath) + apikey;
	               placeString += totalPath + "|";
	               thumbnailString += totalPath + ",";
	            }else{
	               placeString += tempPath + "|";
	               thumbnailString += tempPath + "|";
	            }
	            placeString += $(this).find('input[type=hidden]').eq(4).val() + "|";
	            placeString += $(this).find('input[type=hidden]').eq(5).val() + "|";
	            placeString += "^";
	            
	            
	            nationString += $(this).find('input[type=hidden]').eq(6).val() + ",";
	            cityString += $(this).find('input[type=hidden]').eq(7).val() + ",";
	         });
			
			data.String = placeString;
			tourlist.push(data);
			
			thumbnaildata.String = thumbnailString;
			thumbnail.push(thumbnaildata);
			
			nationdata.String = nationString;
			nation.push(nationdata);
			
			citydata.String = cityString;
			city.push(citydata);
			
			console.log(tourlist);
			console.log(nation);
			console.log(city);
			
			
			//tooltip -- ?????????????????? <br>?????? ??????
			var placecontent = "";
			$("#addlist").find("th").each(function(){
				placecontent += $(this).find('input[type=time]').eq(0).val() + $(this).find("pre").eq(1).text() + "\n";
			});
			
			//???????????????
			calendar.addEvent({'title':'??????', 'start':formatdate, 'end':formatdate, 'description':placecontent});
			
			//alert
			toastr.options.positionClass = "toast-top-right";
			toastr.success(formatdate + "?????? ????????????");
			
			clearTh();
			clearDay();
			
		}
		
	}
	
	   function photoRf(path){
		      var temp = path.split("Photo?1s");
		      
		      var temp2 = temp[1].split("&callback");
		      
		      return(temp2[0]);
		   }
	
	
	
	//hotel , place, ??? ?????? ??? ????????? ????????? ????????? ???????????? ????????? ?????? ???????????? ??????
	let clickVal = "";
	
	/* ????????? ???????????? ??????????????? ????????? */
	$(function(){
		$(".clickval").click(function(){
			clickVal = $(this).attr("id");
			console.log(clickVal);
		});
		
		
		//form
		$("#formclick").click(function(){
			
			if(userid == ""){
				toastr.options.positionClass = "toast-top-right";
				toastr.warning("???????????? ???????????????.");
				return;
			} 
			
			
			if(tourlist.length == 0){
				alert("????????? ???????????? ????????????.");
				return;
			}
		
			if($("#title").val() == ""){
				alert("????????? ???????????????.");
				$("#title").focus();
				return;
			}
			
			if($("#content").val() == ""){
				alert("????????? ????????? ???????????????.");
				$("#content").focus();
				return;
			}
			
			//nation ???????????????
			var nationSorted = nation.sort(function(a,b){
				let x = a.date;
				let y = b.date;
				
				if(x < y){
					return -1;
				}
				if(x > y){
					return 1;
				}
				return 0;
			});
			
			//city ???????????????
			var citySorted = city.sort(function(a,b){
				let x = a.date;
				let y = b.date;
				
				if(x < y){
					return -1;
				}
				if(x > y){
					return 1;
				}
				return 0;
			});
			
			//thumbnail ???????????????
			var thumbnailSorted = thumbnail.sort(function(a,b){
				let x = a.date;
				let y = b.date;
				
				if(x < y){
					return -1;
				}
				if(x > y){
					return 1;
				}
				return 0;
			});
			
			
			
			
			
			
			var nationarr = new Array();
			var cityarr = new Array();
			
			//nation
			for(var i = 0; i < nationSorted.length; i++){
				var arr = nationSorted[i].String.split(",");
				for(var j = 0; j < arr.length; j++){
					nationarr.push(arr[j]);
				}
			}
			//????????????
			for(var i = 0; i < nationarr.length; i++){
				if(nationarr[i] == ""){
					nationarr.splice(i,1);
				}
			}
			nationarr = Array.from(new Set(nationarr));
			console.log(nationarr);
			//city
			for(var i = 0; i < citySorted.length; i++){
				var arr = citySorted[i].String.split(",");
				for(var j = 0; j < arr.length; j++){
					cityarr.push(arr[j]);
				}
			}
			//????????????
			for(var i = 0; i < cityarr.length; i++){
				if(cityarr[i] == ""){
					cityarr.splice(i,1);
				}
			}
			cityarr = Array.from(new Set(cityarr));
			console.log(cityarr);
			for(var i = 0; i < nationarr.length; i++){
				nations_citys += nationarr[i] + ",";
			}
			for(var i = 0; i < cityarr.length; i++){
				nations_citys += cityarr[i] + ",";
			}
			console.log(nations_citys);
			nations_citys = nations_citys.slice(0,-1);
			console.log(nations_citys);
			
			var thumbarr = thumbnailSorted[0].String.split(",");
			thumbnailpath = thumbarr[0];
			
			
			//tourlist ???????????????
			var tourlistSorted = tourlist.sort(function(a,b){
				let x = a.date;
				let y = b.date;
				
				if(x < y){
					return -1;
				}
				if(x > y){
					return 1;
				}
				return 0;
			});
			
			//????????? ??????, ???????????? ?????? ??????
			$("#nationid").val(nations_citys);
			$("#thumbid").val(thumbnailpath);
			var jsonData = JSON.stringify(tourlistSorted);
			$("#valueid").val(jsonData);
			console.log(jsonData);
/* 			console.log("nationval" + $("#nationid").val());
			console.log("thumbval" + $("#thumbid").val());
			console.log(jsonData);		 */	
			
			if(confirm("??????????????? ?????????????????????????")){
				location.href="javascript:document.form.submit()";
			}else{
				nations_citys = "";
				thumbnailpath = "";
			}
			
		});
	});
	
</script>


<script type="text/javascript">
	/* datepicker & timepicker*/
	$(function(){
		$("#datepicker").datepicker({
			dateFormat: 'yy-MM-dd' //Input Display Format ??????
            ,showOtherMonths: true //??? ????????? ???????????? ???????????? ????????? ??????
            ,showMonthAfterYear:true //?????? ?????? ?????????, ?????? ??? ??????
            ,changeYear: true //?????????????????? ??? ?????? ??????
            ,changeMonth: true //?????????????????? ??? ?????? ??????                
            ,showOn: "both" //button:????????? ????????????,????????? ???????????? ?????? ?????? ^ both:????????? ????????????,????????? ???????????? input??? ???????????? ?????? ??????  
            ,buttonImage: "<%=request.getContextPath()%>/img/calendar.png" //?????? ????????? ??????
            ,buttonImageOnly: true //?????? ????????? ?????? ????????? ?????????, ???????????? ????????? ???
            ,buttonText: "??????" //????????? ????????? ?????? ?????? ??? ???????????? ?????????                
            ,yearSuffix: "???" //????????? ?????? ?????? ?????? ?????? ?????????
            ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //????????? ??? ?????? ?????????
            ,monthNames: ['1???','2???','3???','4???','5???','6???','7???','8???','9???','10???','11???','12???'] //????????? ??? ?????? Tooltip ?????????
            ,dayNamesMin: ['???','???','???','???','???','???','???'] //????????? ?????? ?????? ?????????
            ,dayNames: ['?????????','?????????','?????????','?????????','?????????','?????????','?????????'] //????????? ?????? ?????? Tooltip ?????????
            ,minDate: 0 //?????? ????????????(-1D:?????????, -1M:?????????, -1Y:?????????)
        });
		//?????? ??????picker??? ???????????? ?????? ???????????? -> input type = time?????? ??????
		$(".timepicker").timepicker({
			timeFormat: 'HH:mm',
			interval: 30,
			startTime: '00:00',
			dynamic: false,
			dropdown: true,
			scrollbar: true
		});
	});
</script>

</head>
			
			


<body>
	<!-- ??????(??????) -->
	<div id="header">
		<%@ include file="/form/header.jsp"%>
	</div> 
 
         <!-- ????????????-->
 
 <div class="btn-group dropstart" style="position:absolute; top:200px; right:15px;">
  <button type="button" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" style="font-size:14px; padding:4px;">
   <img src="schedule/img/heartmarker2.png" style="width:40%; ">???
  </button>
  <div class="dropdown-menu" style="width:300px; height:370px; text-align:center;">
 
    <h5 style="font-size:15px;"><a class="btn-3d red"  id="drop"	 ><img src="schedule/img/heartmarker2.png" style="width:10%; margin-top:15px; "></a><br>????????????	 
		</h5>
    	 <div style="padding-left:10%; padding-right:10%;">
		 	<table class="table table-hover" style="overflow:auto;">
  			<thead>
    		<tr>
      			<th colspan="2" style="width:50px;"> </th>
      			<th colspan="2" style="width:50px;"> </th>
    		</tr>
  			</thead>
  			<tbody> 
			 <c:forEach items="${wished_list }" var="HeartDto">
							<tr> 
								<td  id="clickdrop" colspan="2"><img style="width:100px; height:60px;" src="<c:url value='${HeartDto.thumbnail }' />" /> </td>
								<td  colspan="2">${HeartDto.place_name }</td>
								<td  style="display:none;">{ lat: ${HeartDto.latitude}, lng: ${HeartDto.longtitude} }</td>
								 
							</tr>
						</c:forEach>
			 </tbody>
			</table>
		 </div> 
  </div>
</div> 
     <!-- map -->
    <div class="container">
		<div class="row">
			<div class="col-lg-8">
				<%@ include file="maptest/maptest2.jsp" %>
			</div>
			<div class="col-lg-4">
				
				<div style='float:center;width:100%;height:500px;font-size:0.6em;' id='calendar'></div><br>
				
				<!-- ????????? -->
				<form name="form" action="<%=request.getContextPath() %>/schedule.do?command=addschedule" method="post">
				<table style="width: 100%;">
				<tr>
					<td>
					
					<input type="hidden" name="nation" id="nationid" value="">
					<input type="hidden" name="thumbnail" id="thumbid" value="">
					<input type="hidden" name="value" id="valueid" value="">
					<h5><input type="button" id="formclick" value="???????????? ??????" style="float:right; margin-bottom:20px; font-size:17px; padding:10px;"class="button-67" role="button" /></h5><br>
					</td>
				</tr>
				<tr>
					<td class="travleInput"><input type="text" name="title" id="title" placeholder="?????? ???????????? ???????????????" style="width: 100%; height: 30px; text-align:center; border:0px;"></td>
				</tr>
				<tr>
					<td class="travleInput"><textarea rows="" cols="" name="content" id="content" placeholder="?????? ????????? ???????????????." style="height: 140px; width:100%; text-align:center; padding:40px; border:0px;"></textarea></td>
				</tr>
				</table>
				</form>
			
			</div>
		</div>
	</div>
	
	<!-- schedule -->		
	<div class="container">		
	
		<div class="row align-items-center">
			<div class="col-lg-12">
				<hr style="margin-top: 30px;">
				<h4 style="font-size:20px;">???????????? ????????? ?????? ??? ????????? ??????????????????.</h4>
				<div style="margin-top: 30px; margin-bottom: 30px;">
					<form>
						<!-- datepicker -->
						<input type="text" id="datepicker" onchange="dateChange()" placeholder="????????? ???????????????" >&nbsp;
      					<input id="input_submit" type="button" value="?????? ??????" class="button-67" onclick="input();" style="font-size:17px; padding:10px;"/>
      					&nbsp;&nbsp;&nbsp;<span style="text-align: center; font-size:15pt; font-weight:bold;" id="temp"></span>

					</form>
				</div>
			</div>
		</div>
	</div>
	
	
	
	<!-- ???????????? -->
	<div class="container">
		<div class="row">
			<div class="col-lg-12" style="overflow-x:scroll;" id="dragdrop">
				<%@ include file="droptest.html" %>
			</div>
		</div>
	</div><br><br>
	
	
<!-- ?????? 3?????? -->
 

	<div class="suggestionTable"> 
	
	  			<!-- ??????3: restaurant -->
			<div class="suggestionOpt">
			<i class="material-icons"><img src="img/resticon.png" style="width:13%; height:13%; "></i>
        <h1 style="font-family: 'Lato', sans-serif; font-size:30px;">restaurant</h1>
        <hr />
        	<p id="results_rest" data-bs-toggle="modal" data-bs-target="#Modal" align="center" class="clickval"></p>
        	 <hr />
        	 
			</div>
 
		
			<!-- ??????2: place -->
			<div class="suggestionOpt">
			<i class="material-icons"><img src="img/tourist.png" style="width:13%; height:13%"></i>
        <h1 style="font-family: 'Lato', sans-serif; font-size:30px;">place</h1>
        <hr />
        	<p id="results_ta" data-bs-toggle="modal" data-bs-target="#Modal" align="center" class="clickval"></p>
        	 <hr />
        	 
			</div>
  			
 			<!-- ??????1: hotel -->
			<div class="suggestionOpt">
			<i class="material-icons"><img src="img/hotel2.png" style="width:13%; height:13%"></i>
        <h1 style="font-family: 'Lato', sans-serif; font-size:30px;">hotel</h1>
        <hr />
        	<p id="results" data-bs-toggle="modal" data-bs-target="#Modal" align="center" class="clickval"></p>
        	 <hr />
        	 
			</div>
			 



<!-- Modal start-->
<div class="modal fade" id="Modal" tabindex="-1" aria-labelledby="modalName" aria-hidden="true">
<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content" style="text-align:center; font-family: 'Lato', sans-serif;">
      <div class="modal-header">
        <h5 class="modal-title" id="modalName" style="font-weight: bolder; margin-left:30px;"></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      		<div>
      		<br> 
      		<p id="modalimage"></p> 
      		<p id="modalRating"></p> 
      		<p id="modalAddress"></p> 
      		<p id="modalPhone"></p> 
      		<p id="modaldetailpage"></p> 
      		<hr>
      		<a href="" id="modalUrl">go to web site</a>
      		<hr>
      		<!-- <p>review</p>-->
      		
      		</div>
      		
      </div>
      <div class="modal-footer">
      	<input type="hidden" id="address" value="">
      	<input type="hidden" id="url" value="">
      	<input type="hidden" id="lng" value="">
      	<input type="hidden" id="lat" value="">
      	<input type="hidden" id="nation" value="">
      	<input type="hidden" id="city" value="">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick="addlist()">Add</button>
      </div>
    </div>
  </div>
</div>
<!-- modal end -->
			
			

    
		 
		</div>
<script type="text/javascript">
	function addlist(){
		if($("#datepicker").datepicker("getDate")==null){
			alert("????????? ??????????????????."); 
			return;
		}
		//????????? ???????????? ???????????????????????? ??????
		if(tourlist.length == 0 && $("#addlist").find("th").length == 0 && clickVal != "results"){
			if(!confirm("?????? ????????? ???????????? ???????????????. ?????? ?????????????????????????")){
				return;
			}
		}
		
		$("#addlist").find("tr").append(createTh($("#modalimage").find("img").attr("src"),
										$("#modalName").text(),
										$("#address").val(),
										$("#url").val(),
										$("#lng").val(),
										$("#lat").val(),
										$("#nation").val(),
										$("#city").val()
										));
		toastr.options.positionClass = "toast-top-right";
		toastr.success("????????????");
	}
	
	function createTh(src, name, addr, url, lng, lat, nation, city){
		var html = "";												 
		html = "<th style='width:200px;'><pre style='margin-top:0px; margin-bottom:10px;'><input type='time' value='00:00' class='time' placeholder='time' style='width:100px;'></pre>" +
			   "<img src = '" + src + "' width=150px height=100px><pre style='margin-top:0px; margin-bottom:0px;'>" + name + "</pre>" + 
			   "<pre style='margin-top:0px; margin-bottom:0px;'><img onclick='delPlace(this)' src='<%=request.getContextPath()%>/img/icons/x.svg' alt='Bootstrap' width='21' height='21'></pre>" +
		       "<input type='hidden' value='"+ name +"'>" + 
		       "<input type='hidden' value='"+ addr +"'>" +
		       "<input type='hidden' value='"+ url +"'>" +
		       "<input type='hidden' value='"+ src +"'>" +
		       "<input type='hidden' value='"+ lng +"'>" +
		       "<input type='hidden' value='"+ lat +"'>" +
		       "<input type='hidden' value='"+ nation +"'>" +
		       "<input type='hidden' value='"+ city +"'>" +
			   "</th>";
		return html;
	}

	function delPlace(val){//x?????? ????????? ???????????? ??????????????? ??????
		var index = $(val).closest("th").index();
		console.log(index);
		$("#addlist").find("th").eq(index).remove();
	}
	
	function clearTh(){
		$("#addlist").find("tr").html("");
	}
	
	function clearDay(){
		$("#datepicker").datepicker("setDate", null);
		$("#temp").text("");
	}
	
	
</script>
 
 
	
<br><br><br><br><br><br><br><br><br><br>

<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>

	<!-- ??????(??????) -->
	<div id="footer">
		<%@ include file="/form/footer.jsp"%>
	</div>
</body>
</html>