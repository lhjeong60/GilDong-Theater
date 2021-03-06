<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/bootstrap/css/bootstrap.min.css">
		<script src="${pageContext.request.contextPath}/resource/jquery/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/resource/popper/popper.min.js"></script>
		<script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/jquery-ui/jquery-ui.min.css">
		<script src="${pageContext.request.contextPath}/resource/jquery-ui/jquery-ui.min.js"></script>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/layout.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/mypage/mypageMain.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/home/movieDetail.css"/>
		
		<script>
		
			$(function() {
				var rscore = $("#6").text();
				var form = document.getElementById('reviewForm');
				var input = document.createElement("input");
				
				$('#rscore').remove();
				input.id = 'rscore';
				input.type = "hidden";
				input.name = "rscore";
				input.value = rscore;
				form.appendChild(input);
			});
		
			function onclick_handler() {
				var e = window.event,
		          span = e.target || e.srcElement;
				
				var id = '#'+span.id;
				$(id).parent().children('span').removeClass('on');
				$(id).addClass('on').prevAll('span').addClass('on');
				
				var rscore = $(id).text();
				var form = document.getElementById('reviewForm');
				var input = document.createElement("input");
				
				$('#rscore').remove();
				input.id = 'rscore';
				input.type = "hidden";
				input.name = "rscore";
				input.value = rscore;
				form.appendChild(input);
				
				return false;
			}
			
			function checkduplicateid() {
				var rid = $("#rid").val();
				var rfno = $("#rfno").val();
				var returnBool = false;
				var sessionMid = '@Session["sessonMid"]';
				
				$.ajax({
					type:"POST",
					url:"checkDuplicateId.do",
					data:{rid:rid, rfno:rfno},
					async:false,
					success:function(data) {
						var result = data.result;
						if(result == "NotLogined") {
							window.alert("???????????? ???????????????.");
							location.href = "${pageContext.request.contextPath}/member/login.do";
						} else if(result == "alreadyHave") {
							window.alert("?????? ????????? ???????????????.");
						} else if(result == "canWrite") {
							console.log("??????");
							returnBool = true;
						}
					}
				});
				
				return returnBool;
				
			}
			
			function updateForm(rno, rscore, rcontent) {
				var reviewForm = $('#reviewForm');
				var submit = $('#submit');
				reviewForm.attr("action" ,"updateReview.do");
				reviewForm.removeAttr("onsubmit");
				submit.attr("value", "??????");
				submit.attr("class", "btn btn-info");
				
				//????????? ????????? ?????? ???????????? ??????
				$('#reviewForm textarea').text(rcontent);
				
				//????????? ????????? ?????? ????????????
				var scoreId = "#" + (rscore*2);
				$(scoreId).parent().children('span').removeClass('on');
				$(scoreId).addClass('on').prevAll('span').addClass('on');
				
				//????????? ????????????, ?????? form????????? rscore??? ?????? input ????????? ??????.
				//????????? ????????? ????????????, ?????? input ?????? ????????? form????????? ??????
				var form = document.getElementById('reviewForm');
				var input = document.createElement('input');
				
				$('#rscore').remove();
				input.id = 'rscore';
				input.type = 'hidden';
				input.name = 'rscore';
				input.value = rscore;
				form.appendChild(input);
				
				//?????? ???????????? ????????? ?????? ??? ?????? ????????? input ?????? ????????? form????????? ??????
				var oldInput = document.createElement('input');
				
				$('#oldRscore').remove();
				oldInput.id = 'oldRscore';
				oldInput.type = 'hidden';
				oldInput.name = 'oldRscore';
				oldInput.value = rscore;
				form.appendChild(oldInput);
				
				//rno ????????????
				var rnoInput = document.createElement('input');
				
				$('#rno').remove();
				rnoInput.id = 'rno';
				rnoInput.type = 'hidden';
				rnoInput.name = 'rno';
				rnoInput.value = rno;
				form.appendChild(rnoInput);
				
				
			}
			
			function loginPlease(){
				window.alert("???????????? ???????????????.");
				location.href = "${pageContext.request.contextPath}/member/login.do";
			}
		</script>
		
		<style>
			.starR1{
			    background: url('${pageContext.request.contextPath}/resource/img/ico_review.png') no-repeat -52px 0;
			    background-size: auto 100%;
			    width: 15px;
			    height: 30px;
			    float:left;
			    text-indent: -9999px;
			    cursor: pointer;
			}
			.starR2{
			    background: url('${pageContext.request.contextPath}/resource/img/ico_review.png') no-repeat right 0;
			    background-size: auto 100%;
			    width: 15px;
			    height: 30px;
			    float:left;
			    text-indent: -9999px;
			    cursor: pointer;
			}
			.starR1.on {background-position:0 0;}
			.starR2.on {background-position:-15px 0;}
		</style>


		
		
	</head>
	<body>
		<div class="header">
		  <h1><a href="${pageContext.request.contextPath}/home/main.do"><img width="700px" height="100px" src="${pageContext.request.contextPath}/resource/img/gildong.png"></a></h1>
		</div>
		<div class="topnav">
	  	<a href="${pageContext.request.contextPath}/home/main.do">Home</a>
		<a href="${pageContext.request.contextPath}/reserve/reservePage.do?fno=1">?????? ??????</a>
	  	<a href="${pageContext.request.contextPath}/home/allreview.do?pageNo=1">?????? ??????</a>
		<c:if test="${sessionMember.mid != null}">
			<a href="${pageContext.request.contextPath}/reserve/showTicket.do">?????? ??????</a>
		</c:if>
		</div>
		<br/>
		
		<img src="${pageContext.request.contextPath}/resource/img/poster/film${film.fno}.jpg"
		style="width:600px; height:800px; display:inline; margin-left: 21%; margin-top: 20px"/>
		
		<table class="film_table">
		    <thead>
		    <tr>
		        <th scope="col">????????????</th>
		    </tr>
		    </thead>
		    <tbody>
		    <tr>
		        <th scope="row">?????? ??????</th>
		        <td>${film.fno}</td>
		    </tr>
		    <tr>
		        <th scope="row">??????</th>
		        <td>${film.ftitle}</td>
		    </tr>
		    <tr>
		        <th scope="row">??????</th>
		        <td>${film.fsummary}</td>
		    </tr>
		    <tr>
		        <th scope="row">????????????</th>
		        <td>${film.fagelimit}</td>
		    </tr>
		    <tr>
		        <th scope="row">??????</th>
		        <td>${film.fscore}</td>
		    </tr>
		    <tr>
		        <th scope="row">??????</th>
		        <td>${film.fdirector}</td>
		    </tr>
		    <tr>
		        <th scope="row">????????????</th>
		        <td>${film.frunningtime}???</td>
		    </tr>
		    <tr>
		        <th scope="row">??????</th>
		        <td>${film.fgenre}</td>
		    </tr>
		    </tbody>
		</table>
		<br/>
	   	<div style="margin-top: 30px; text-align: center;">
			<form action="${pageContext.request.contextPath}/reserve/reservePage.do">
				<input type="hidden" id="fno" name="fno" value="${film.fno}">
				<input type="submit" class="btn btn-primary" style="width: 150px; height: 40px;" value="????????????"/>
			</form>
		</div>
		
		<br/>
		<br/>
		<hr size="5" width="70%" color="black" style="margin-top: 10% ">
		<br/>
		
		<div style="text-align: center;">
			<font face="?????? ?????? " size="10">??????</font>
			<font face="?????? ?????? " size="4">Review</font>
		</div>
		
		<div style="margin-left: 25%;">
			<table class="table" style="width: 70%;">
				<thead class="thead-dark">
					<tr>
						<th scope="col">??????</th>
						<th scope="col">??????</th>
						<th scope="col">?????????</th>
						<th scope="col">??????</th>
						<th scope="col">??????</th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="review" items="${reviewlist}">			
						<tr>	
							<td>${review.rno}</td>
							<td>${review.rcontent}</td>
							<td>${review.rid}</td>
							<td><fmt:formatDate value="${review.rdate}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
							<td>${review.rscore}</td>
							<c:if test="${review.rid == sessionMid}">
								<td>
									<c:if test="${sessionMember != null}">
										<a class="btn btn-outline-info btn-sm" style="font-size: 8pt; width: 40px; height: 25px;" 
											onclick="updateForm(${review.rno} ,${review.rscore}, '${review.rcontent}')">??????</a>
										<a class="btn btn-outline-danger btn-sm" href="deleteReview.do?fno=${film.fno}&rno=${review.rno}&rscore=${review.rscore}" 
											style="font-size:8pt;width:40px;height:25px">??????</a>
									</c:if>
								</td>
							</c:if>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="6" style="text-align:center;">
							<a class="btn btn-primary" href="movieDetail.do?pageNo=1&fno=${film.fno}">??????</a>
							
							<c:if test="${pager.groupNo > 1}">
								<a class="btn btn-primary" href="movieDetail.do?pageNo=${pager.startPageNo - pager.pagesPerGroup}&fno=${film.fno}">??????</a>
							</c:if>
							<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
								
								<c:if test="${pager.pageNo != i}">
									<a class="btn btn-dark" href="movieDetail.do?pageNo=${i}&fno=${film.fno}">${i}</a>
								</c:if> 
								
								<c:if test="${pager.pageNo == i}">
									<a class="btn btn-outline-dark" href="movieDetail.do?pageNo=${i}&fno=${film.fno}">${i}</a>
								</c:if>
							</c:forEach>
							
							<c:if test="${pager.groupNo < pager.totalGroupNo}">
								<a class="btn btn-primary" href="movieDetail.do?pageNo=${pager.endPageNo+1}&fno=${film.fno}">??????</a>
							</c:if>
							<a class="btn btn-primary" href="movieDetail.do?pageNo=${pager.totalPageNo}&fno=${film.fno}">??????</a>	
						</td>
					</tr> 
				</tbody>
			</table>
		</div>
		<br/>
		<br/>
		<hr size="5" width="70%" color="black">
		
		<div style="text-align: center;">
			<font face="?????? ?????? " size="10">?????????</font>
			<font face="?????? ?????? " size="4">Comment</font>
		</div>
		<br/>
		
		<div style="text-align: center;">
			<c:if test="${sessionMid == null}">
				<h5>??????????????? ?????? ????????? ??? ??? ????????????.</h5>
			  	<a href="${pageContext.request.contextPath}/member/login.do" class="btn btn-success" style="width: 200px;">?????????</a></h2>
			</c:if>
			<c:if test="${sessionMid != null}">
			  	<form id="reviewForm" method="post" action="writeReview.do" onsubmit="return checkduplicateid()" style="text-align: center;">
			        <div class="starRev" style="margin-left: 45%;">
						<span id="1" class="starR1 on" onclick="onclick_handler()">0.5</span>
						<span id="2" class="starR2 on" onclick="onclick_handler()">1.0</span>
						<span id="3" class="starR1 on" onclick="onclick_handler()">1.5</span>
						<span id="4" class="starR2 on" onclick="onclick_handler()">2.0</span>
						<span id="5" class="starR1 on" onclick="onclick_handler()">2.5</span>
						<span id="6" class="starR2 on" onclick="onclick_handler()">3.0</span>
						<span id="7" class="starR1" onclick="onclick_handler()">3.5</span>
						<span id="8" class="starR2" onclick="onclick_handler()">4.0</span>
						<span id="9" class="starR1" onclick="onclick_handler()">4.5</span>
						<span id="10" class="starR2" onclick="onclick_handler()">5.0</span>
					</div>
					<br/>
					<br/>
						<div style="margin-bottom: 20px">
							????????? :
							<input type="text" style="width:400px;" disabled value="${sessionMid}"/>
						</div>
						<div>
							<input type="hidden" id="rfno" name="rfno" value="${film.fno}"/>
							<input type="hidden" id="rid" name="rid" value="${sessionMid}"/>
							<input type="hidden" id="rscore"/>
							<textarea name="rcontent" rows="2" style="width:800px; margin-left: 550px; float: left;"></textarea>
							<input id="submit" type="submit" value="??????" 
									class="btn btn-dark"
									style="margin-top: 5px; margin-right: 470px; float: right;"/>
						</div>			
				</form>
			</c:if>
		</div>
		<br/>
		<br/>
		
		<br/>
		<div class="footer">
		  <p>???????????? | ???????????????????????? | ????????? ????????? ???????????? | ?????? ????????????</p>
		  <p>????????????????????? : 0000-00-000 | ???????????? : ????????? | ???????????????: ????????? ?????????</p>
		</div>
	</body>
</html>