<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/bootstrap/css/bootstrap.min.css">
		<script src="${pageContext.request.contextPath}/resource/jquery/jquery.min.js"></script>
		<script	src="${pageContext.request.contextPath}/resource/popper/popper.min.js"></script>
		<script	src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/jquery-ui/jquery-ui.min.css">
		<script	src="${pageContext.request.contextPath}/resource/jquery-ui/jquery-ui.min.js"></script>
		<title>Main Page Layout</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/layout.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/mypage/mypageMain.css" />
		<script>
			function checkDrop() {
				return confirm("회원 탈퇴하시겠습니까?");
			}
			function loginPlease(){
				window.alert("로그인이 필요합니다.");
				location.href = "${pageContext.request.contextPath}/member/login.do";
			}
		</script>
	</head>
	<body>
		<c:if test="${sessionMember == null}">
			<script>
				loginPlease();
			</script>
		</c:if>
		
		<div class="header">
			<h1>
				<a href="${pageContext.request.contextPath}/home/main.do"><img
					width="700px" height="100px"
					src="${pageContext.request.contextPath}/resource/img/gildong.png"></a>
			</h1>
		</div>
	
		<div class="topnav">
		  	<a href="${pageContext.request.contextPath}/home/main.do">Home</a>
			<a href="${pageContext.request.contextPath}/reserve/reservePage.do?fno=1">영화 예매</a>
		  	<a href="${pageContext.request.contextPath}/home/allreview.do?pageNo=1">평점 리뷰</a>
			<c:if test="${sessionMember.mid != null}">
				<a href="${pageContext.request.contextPath}/reserve/showTicket.do">예매 확인</a>
			</c:if>
		</div>
		<div class="container">
			<div class="page-header">
				<h1 class="h2">&nbsp; 내 정보</h1>
				<hr>
			</div>
		</div>
		<div class="mypageList">
			<table class="table table-stripped">
				<tr>
					<td>아이디</td>
					<td>${sessionMember.mid}</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>${sessionMember.mname}</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td>${sessionMember.mtel}</td>
				</tr>
				<tr>
					<td>Email</td>
					<td>${sessionMember.memail}</td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td>${sessionMember.mbirth}</td>
				</tr>
				<tr>
					<td>포인트</td>
					<td>${sessionMember.mpoint}p<a class="btn btn-warning btn-sm"
						href="chargePointForm.do" style="margin-left: 10px">충전</a>
					</td>
				</tr>
			</table>
			<div id="memChange">
				<a class="btn btn-success" href="edit.do" style="margin-left: 10px">수정하기</a>
				<a class="btn btn-danger" onclick="return checkDrop()"
					href="${pageContext.request.contextPath}/member/drop.do"
					style="margin-left: 10px">회원 탈퇴</a>
			</div>
		</div>
		<div class="footer" style="margin-top: 5%;">
		  <p>이용약관 | 개인정보처리방침 | 책임의 한계와 법적고지 | 영화 고객센터</p>
		  <p>사업자등록번호 : 0000-00-000 | 대표이사 : 호정맨 | 최고기술자: 바닐라 멘사맨</p>
		</div>
	
	</body>
</html>