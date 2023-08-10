<%@page import="java.util.ArrayList"%>
<%@page import="Ticketing.homeMatchDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"											
pageEncoding="UTF-8"%>	
<%@ page import="org.json.simple.*"%>
<%@ page import="java.util.HashMap"%>
<%@page import="java.sql.*"%>
<%
	int s1 = (Integer)request.getAttribute("s1");
	int s2 = (Integer)request.getAttribute("s2");
	int s3 = (Integer)request.getAttribute("s3");
	int TicketBno = (int) session.getAttribute("MatchBno");
	ArrayList<Object> ticketArr = (ArrayList<Object>)session.getAttribute("ticketArr");
	homeMatchDto mDto1 = (homeMatchDto)session.getAttribute("MatchInfo");
%>
<!DOCTYPE html>
<html>											
<head>											
	<meta charset="UTF-8">										
	<title>FC SEOUL</title>
	<link rel="shortcut icon" type="image/x-icon" href="https://fcseoulpub.s3.ap-northeast-2.amazonaws.com/multi01/Club/Club/1675316444376.png">										
	<link rel="stylesheet" href="css/TicketBuy.css">	
<!-- 	<script src="JS/jquery-3.7.0.min.js"></script>								 -->
	<!-- jQuery -->					
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>					
	<!-- iamport.payment.js -->					
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>					
	<script>		
 		var IMP = window.IMP;
 		IMP.init("imp07271320");
		function requestPay() {
				// IMP.request_pay(param, callback) 결제창 호출
				<%int n = (int)(Math.random()*1000000);%>
				IMP.request_pay({ // param
				pg: "tosstest",
				pay_method: "card",
				merchant_uid: <%=n%>,
				name: "FC서울 티켓",
				amount: 100,
				buyer_email: "",				
				buyer_name: "",				
				buyer_tel: "",				
				buyer_addr: "주소",				
				buyer_postcode: "우편번호"
						}, function(rsp) { // callback				
							if (rsp.success) {
								// 결제 성공 시 로직,			
								$("#member").submit();
								alert("결제되었습니다!");
								window.close();
							} else {
								// 결제 실패 시 로직,				
								alert("결제가 취소되었습니다.");
							}
						});
				}
	$(function(){
		$('#submit').click(function(){
			if(($('#checkBox1').is(":checked"))&&($('#checkBox2').is(":checked"))&&
					($('#checkBox3').is(":checked"))&&($('#checkBox4').is(":checked"))&&($('#phone').val())&&($('#email').val())){
							requestPay();
						} else {
							alert("입력사항과 체크박스에 모두 동의해주세요!");
						}
					});
		});
	</script>
</head>											
<body>											
	<div id="wrap_reserve">										
		<div id="header">									
			<div class="reserve_title">								
				<h1>							
					<span class="blind"></span>
				</h1>
				<h2>예매</h2>	
			</div>
			<ul class="reserve_step">
				<li class="step1">
					<span>날짜/회차선택</span>
				</li>
				<li class="step2">
					<span>등급/좌석선택	
					</span>
				</li>
				<li class="step3">
					<span>권종/할인/매수선택</span>
				</li>
				<li class="step4 on">							
					<span>배송선택/예매확인</span>
				</li>
				<li class="step5">
					<span>결제</span>	
				</li>
			</ul>
		</div>
		<div id="container">
			<div class="reserve_content">
			<form id = "member" action="TicketingServlet?command=submit" method="post">
				<input type = "hidden" name = "id" value = "rlagkwls">
				<input type = "hidden" name = "seatArray" value = "<%=ticketArr%>">
				<input type = "hidden" name = "stadium" value = "<%=mDto1.getStadium()%>">
				<input type = "hidden" name = "m_date" value = "<%=mDto1.getDate()%>">
				<input type = "hidden" name = "s1" value = "<%=s1%>">
				<input type = "hidden" name = "s2" value = "<%=s2%>">
				<input type = "hidden" name = "s3" value = "<%=s3%>">
				<input type = "hidden" name = "ticketingbno" value = "<%=TicketBno%>">
				<input type = "hidden" name = "name" value = "김하진">
				<div class="reserve_left">
					<div class="reserve_prdt_info">
						<div class="info1">
							<h3>수령방법</h3>
							<div class="howtoget">
								<div class="tickettitle">
									<h3>티켓</h3>
								</div>
								<div class="whereget">
									현장수령
								</div>
							</div>
							<p>*티켓은 관람일당일 현장에서 예매번호및본인확인 후 수령할 수 있습니다.</p>
						</div>
						
						<div class="info2">
							<h3>주문자 정보</h3>
							<div class="buyerinfo one">
								<div class="yourname">
									<h3>이름*</h3>
								</div>
								<div class="myname">
									<p>김하진</p>
								</div>
								<div class="myphone">
									<h3>휴대폰 번호*</h3>
								</div>
								<input type="text" class="phonenum" id = "phone" required>
							</div>
							<div class="buyerinfo">
								<div class="youremail">
									<h3>이메일</h3>
								</div>
								<input type="text" class="myemail" id = "email" required>
							</div>
						</div>
						
						<div class="info3">
							<h3>예매자 확인</h3>
							<div class="buycheck one">
								<div class="checking">
									<input type="checkbox" id = "checkBox1">
								</div>
								<div class="ex">
									<p>주문자 확인 및 예매처리를 위해 휴대폰번호,이메일,(배송수령시)주소,(입력필요시)생년월일을 수집하며,<br>이용목적 달성 이후 파기합니다.</p>
								</div>
							</div>
							<div class="buycheck">
								<div class="checking">
									<input type="checkbox" id = "checkBox2">
								</div>
								<div class="ex">
									<p>개인정보 제3자 제공에 동의합니다.(고객응대 및 관람정보안내 등을 위함)</p>
								</div>
							</div>
							<div class="buycheck">
								<div class="checking">
									<input type="checkbox" id = "checkBox3">
								</div>
								<div class="ex">
									<p>[동의]FC서울 홈 경기 관람안내</p>
								</div>
							</div>
							<div class="buycheck">
								<div class="checking">
									<input type="checkbox" id = "checkBox4">
								</div>
								<div class="ex">
									<p>[동의]프로스포츠 암표 근절 및 암표매매에 따른 제재사항에 동의합니다.</p>
								</div>
							</div>
						</div>
										
					</div>						
				</div>
				</form>							
				<div class="reserve_right">							
					<div class="matchimg">
						<div class="homelogo">
							<img alt="" src="<%=mDto1.getHome_logo()%>">
						</div>
						<div class="vs">
							<p>vs</p>
						</div>
						<div class="awaylogo">
							<img alt="" src="<%=mDto1.getAway_logo()%>
							">
						</div>
					</div>		
					<div class="whatmatch">
						<p><strong><%=mDto1.getHome_name() %> VS <%=mDto1.getAway_name() %></strong> </p>
						<p class="color"><%=mDto1.getStadium() %></p>
						<p class="color"><%=mDto1.getDate() %></p>
					</div>			
					<p class="ticinfo"><strong>예매정보</strong> </p>
					<div class="ticketinginfo">
						<ul class="seat_list" style="height:72px; overflow:scroll;">
						<% for(int i = 0; i<ticketArr.size(); i++)  {%>
                            <li>            
                            <span class="seat_level">동측 지정석</span>            
                            <span class="seat_price"><%= ticketArr.get(i) %></span>
                            </li>
                          <%} %>
                         </ul>
					</div>
					<div class="pricebox">
						<div class="prc">
							<p>티켓금액</p>
							<span><%=(s1*16000) +(s2*11000) + (s3*5000)%></span>
						</div>
						<div class="prc">
							<p>예매수수료</p>
							<span><%= (s1+s2+s3)*1000%></span>
						</div>
						<div class="prc">
							<p>배송료</p>
							<span>0</span>
						</div>
						<div class="prc">
							<p>쿠폰할인</p>
							<span>0</span>
						</div>
						<div class="prc point">
							<p>포인트 사용</p>
							<span>0</span>
						</div>
						<div class="prc allprice">
							<p>총 결제</p>
							<span class="myprice"><%=(s1*17000)+(s2*12000)+(s3*6000)%></span>
						</div>
					</div>
					<div class="explain">
						<p> <span>취소기한: </span>2023.08.04 16:30 </p>
						<p> <span>취소수수료: </span>티켓금액의 0~30% </p>
					</div>
					<div class="reserve_btn">						
						<a href="TicketingServlet?command=p3&bno=<%=TicketBno%>" class="btn btn_blank">이전단계</a>					
						<button class="btn btn_blank" id = "submit">결제하기</a>		
					</div>						
				</div>							
			</div>								
		</div>									
	</div>										
</body>											
</html>												