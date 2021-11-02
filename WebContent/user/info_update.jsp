<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type="text/css">
	ul {
		list-style-type : none;
	    margin: 0px;
	    padding: 0px;
	    width: 200px;
	    background-color: white;
	}
	li a {
	    display: block;
	    color: #000;
	    padding: 8px 16px;
	    text-decoration: none;
	}
	li a:hover {
	    background-color: green;
	    color: white;
	    position : 
	}
	.flex-container{
		display: flex;
		float:right;
		flex-direction: column;	
			
	}
	.header, .sidebar,
	.footer, .flex-container {
	  display: flex;
	  align-items: center;
	  justify-content: center;
	}
	.user_list{
		display:flex;
		margin-left: 200px;
		margin-bottom: 20px;
	}
	.sidebar {
	  width: 15%;
	  float: left;
	  height: 50%;
	}
	form{
		margin-left: 160px;
	}
	input{
	border : 0;
	border-bottom: 2px solid lightgrey;
	}
	
	h3 {
		padding: 0;
		margin: 0;
	}
	body {
		margin: 0;
		padding: 0;
	}
#id{
	border:0;
	border-bottom: 2px solid;
}

.btn {
	padding : 5px 10px;
	width:130px;
	background-color: white;
}
.btn:hover{
	background-color: grey;
}
.noti{
	font-size: 5pt;
	
}
.num{
	border-bottom: 1px solid;
	color : red;
}
</style>
<script type="text/javascript">
	function popup(){
		window.open("unregister_1.jsp","_blank","width=300px, height=150px");
		
	}
	
	var func = function(){
		//정보얻기
		var user_id = doc.getElementById('user_id').value;
		var passwd = doc.getElementById('passwd').value;
		var pw_change = doc.getElementById('pw_change').value;
		var pw_chek = doc.getElementById('pw_chek').value;
		
		console.log(user_id);
		console.log(passwd);
		console.log(pw_change);
		console.log(pw_chek);
		
		if(pw_change != pw_chek){
			$("#pw_equal").css("color","red").text("비밀번호가 다릅니다.");
		
			//다를경우 비밀번호 값 비워줌
			doc.getElementById('pw_change').value='';
			doc.getElementById('pw_chek').value='';
			
			//비밀번호 수정에 커서가기
			doc.getElementById('pw_change').focus();
			
			return;
		}
		if(passwd.length<4){
			$("#pw_length").css("color","red").text("비밀번호는 최소 6자리 이상 작성해야 합니다.");	
		}
	}
</script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    <!-- 주소 API-->
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("roadAddress").value = roadAddr;
                document.getElementById("jibunAddress").value = data.jibunAddress;
         
                document.getElementById("engAddress").value = data.addressEnglish;
                       
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>

<title>Insert title here</title>
</head>
<body>
	<!-- 고정(헤더) -->
	<div id="header">
		<%@ include file="/form/header.jsp"%>
	</div>
	

	<br>
	<div style="text-align: center;">마이페이지</div>
	<br>

	<!-- 사이드바 -->
	<div id="left" class="sidebar">
		<ul>
			<li><a href="<%=request.getContextPath()%>/mypage.do?command=mypage">내여행</a></li>
			<hr>
			<li><a href="<%=request.getContextPath()%>/mypage.do?command=infoupdate">정보수정</a></li>
			<hr>
			<li><a href="#" onclick="popup();">회원탈퇴</a></li>	
			<hr>
			<li><a href="<%=request.getContextPath()%>/Companion.do?command=message">채팅하기</a></li>	
		</ul>
	</div>
	
	
	<!-- 메인 -->
	<div id="right" class="flex_container">
	
		<!-- 정보수정 -->
		<div class="user_list">
			<form action="mypage.do" method="post">
				<input type="hidden" name="command" value="updateUser">
				<h3 style="text-align:center">회원정보수정</h3>
				<table>
					<col width=150px><col width=300px>
					<tr>
						<td class="col1">아이디</td>
						<td class="col2">${dto.user_id }</td>
					</tr>

					<tr>
						<td class="col1">현재비밀번호</td>
						<td class="col2">
							<input type="password" id="passwd" name="passwd" maxlength="16" >
							<p class="noti">비밀번호는<span class="num">문자,숫자,특수문자조합으로 8자리-16자리</span> 입력이 가능합니다.</p>
						</td>
					</tr>
					<tr>
						<td class="col1">비밀번호 수정</td>
						<td class="col2">
							<input type="password" id="pw_change" name="pw_change" maxlength="16">
							<p class="pw_length"></p>
						</td>	
					</tr>
					<tr>
						<td class="col1">비밀번호 확인</td>
						<td class="col2">
							<input type="password" id="pw_chek" name="pw_check" maxlength="16">
							<span id="pw_equal"></span>
						</td>	
					</tr>
					<tr>
						<td class="col1">이름</td>
						<td class="col2"><input type="text" name="name" value="${dto.name }"></td>
					</tr>
					<tr>
						<td class="col1">닉네임</td>
						<td class="col2"><input type="text" name="nickname" value="${dto.nickname }"></td>
					</tr>
					<tr>
						<td class="col1">이메일</td>
						<td class="col2">
							<input type="text" name="email" value="<%=dto.getEmail().split("@")[0] %>"> @ 
							<select name="dot">
								<option value="naver">naver.com</option>
								<option value="daum">daum.net</option>
								<option value="google">google.com</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="col1">국적</td>
						<td class="col2">
							<select name="nation">
								<option value="kr">한국</option>
								<option value="us">미국</option> 
								<option value="ch">중국</option>
								<option value="jp">일본</option>
								<option value="sp">스페인</option>
							</select>
						</td>
					</tr>
					
					<!-- 주소 API -->
					<tr>
						<td class="col1">주소</td>
						<td class="col2">
							<input type="text" id="postcode" name="postcode" placeholder="우편번호">
							<input type="button" class="btn" style="border: 2px solid grey" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
							<input type="text" id="roadAddress" name="roadAddress" placeholder="도로명주소" size="60" ><br>
							<input type="hidden" id="jibunAddress" placeholder="지번주소"  size="60">
							<span id="guide" style="color:#999;display:none"></span>
							<input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소"  size="60"><br>
							<input type="hidden" id="extraAddress" placeholder="참고항목"  size="60">
							<input type="hidden" id="engAddress" placeholder="영문주소"  size="60" ><br>
						</td>
					</tr>
					<tr>
						<td class="col1">성별</td>
						<td class="col2">
							<select name="gender">
								<option value="M">남자</option>
								<option value="F">여자</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="col1">나이</td>
						<td class="col2">
							<input type="number" name="age" value="${dto.age }">
						</td>
					</tr>
					<tr>
						<td class="col1">핸드폰번호</td>
						<td class="col2"><input type="text" name="phone" value=${dto.phone }></td>
					</tr>
				</table>
				<br><br>
				<div style="text-align: center;">
					<input type="submit" class="btn" style="border: 2px solid grey" value="회원정보수정">
					<input type="button" class="btn" style="border: 2px solid grey" value="취소" onclick="location.href='index.jsp'">
				</div>
			</form>
		</div>
	</div>

	<!-- 고정(푸터) -->
	<div id="footer">
		<%@ include file="/form/footer.jsp"%>
	</div>
</body>
</html>