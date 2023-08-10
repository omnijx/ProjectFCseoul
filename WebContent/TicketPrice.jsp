<%@page import="Ticketing.homeMatchDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Ticketing.TicketingDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"											
pageEncoding="UTF-8"%>	
<%@ page import="org.json.simple.*"%>
<%@ page import="java.util.HashMap"%>
<%@page import="java.sql.*"%>
<%
	TicketingDao tDao = new TicketingDao();
	int bno = (Integer)request.getAttribute("bno");
	session.setAttribute("MatchBno",bno);
	int TicketBno = (int) session.getAttribute("MatchBno");
	ArrayList<Object> jarr = tDao.getArray(TicketBno);
	session.setAttribute("ticketArr",jarr);
	ArrayList<Object> ticketArr = (ArrayList<Object>)session.getAttribute("ticketArr");
	homeMatchDto mDto1 = (homeMatchDto)session.getAttribute("MatchInfo");
%>
<%

%>
<!DOCTYPE html>
<html>											
<head>											
	<meta charset="UTF-8">										
	<title>FC SEOUL</title>	
	<link rel="shortcut icon" type="image/x-icon" href="https://fcseoulpub.s3.ap-northeast-2.amazonaws.com/multi01/Club/Club/1675316444376.png">									
	<link rel="stylesheet" href="css/TicketPrice.css">	
	<script src="js/jquery-3.7.0.min.js"></script>
	<script>
		var s1 = Number($("#select1").val());
		var s2 = Number($("#select2").val());
		var s3 = Number($("#select3").val());
		var currMoney = s1*16000+s2*11000+s3*5000;
		var charge = (s1+s2+s3)*1000;
		function selectFx(){
			var v1 = Number($("#select1").val());
			var v2 = Number($("#select2").val());
			var v3 = Number($("#select3").val());
			if(v1+v2+v3><%=jarr.size()%>){
				alert("너무 커용!");
				/* $("#select1").attr("value",s1);
				$("#select2").attr("value",s2);
				$("#select3").attr("value",s3); */
				$("#select1").val(s1).prop("selected", true);
				$("#select2").val(s2).prop("selected", true);
				$("#select3").val(s3).prop("selected", true);
			}else{
				s1 = v1;
				s2 = v2;
				s3 = v3;
			}
			console.log("s1 : "+s1+" s2 : "+s2+" s3 : "+s3);
			currMoney =s1*16000+s2*11000+s3*5000;
			$("#ticketPay").text(currMoney);
			charge = (s1+s2+s3)*1000;
			$("#charge").text(charge);
			console.log(currMoney);
			$("#allPrice").text(currMoney+charge);
		}
		function GoP4(){
			if(s1+s2+s3===<%=ticketArr.size()%>){
				location.href = "TicketingServlet?command=p4&s1="+s1+"&s2="+s2+"&s3="+s3;
			}else{
				alert("티켓을 모두 골라주세요!");
			}
		}
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
				<li class="step3 on">							
					<span>권종/할인/매수선택</span>						
				</li>							
				<li class="step4">							
					<span>배송선택/예매확인</span>						
				</li>							
				<li class="step5">							
					<span>결제</span>						
				</li>							
			</ul>								
		</div>									
		<div id="container">									
			<div class="reserve_content">								
				<div class="reserve_left">							
					<div class="reserve_prdt_info">	
						
						<div class="getticket">
							<p>선택하신 좌석이 고객님께 선정되었습니다.<span>8분이내 결제하시면 예매가 완료</span>됩니다.</p>
						</div>
						<h3>티켓종류,할인,매수 선택</h3>
						<form method = "get" action = "TicketingServlet?command=p4&bno=<%=bno %>&ticketPrice=" id = "ticketInfo">
							<table>
								<tr>
									<td colspan="3" > <p class="whereticket"><strong> 동측 지정석</strong>을&nbsp;<strong><%=jarr.size()%></strong>매를 선택하셨습니다.</p></td>
								</tr>
								<tr>
									<th rowspan="3"> <strong>일반(정가)</strong> </th>
							 		<td > <p class="tprice" >성인(예) <strong>16,000원</strong></p> </td>
									<td> 
										<select id = select1 onchange="selectFx()">
										<%for(int i = 0 ; i<=ticketArr.size(); i++){ %>
										<option value = "<%=i%>"><%=i%></option>
										<%} %>
										</select> 
									</td> 
								</tr>
								<tr>
									<td > <p class="tprice">청소년 <strong>11,000원</strong></p></td>
									<td> 
										<select id = select2 onchange="selectFx()">
										<%for(int i = 0 ; i<=ticketArr.size(); i++){ %>
										<option value = "<%=i%>"><%=i%></option>
										<%} %>
										</select> 
									</td>
								</tr>
								<tr>
									<td> <p class="tprice">어린이 <strong>5,000원</strong></p></td>
									<td> 
										<select id = select3 onchange="selectFx()">
										<%for(int i = 0 ; i<=ticketArr.size(); i++){ %>
										<option value = "<%=i%>"><%=i%></option>
										<%} %>
										</select> 
									</td>
								</tr>
							</table>	
						</form>
					</div>						
				</div>							
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
							<span id = "ticketPay">0</span>
						</div>
						<div class="prc">
							<p>예매 수수료</p>
							<span id = "charge">0</span>
						</div>
						<div class="prc">
							<p>배송료</p>
							<span>0</span>
						</div>
						<div class="prc">
							<p>쿠폰 할인</p>
							<span>0</span>
						</div>
						<div class="prc point">
							<p>포인트 사용</p>
							<span>0</span>
						</div>
						<div class="prc allprice">
							<p>티켓금액</p>
							<span class="myprice" id = "allPrice"></span>
						</div>
					</div>
					<div class="explain">
						<p> <span>취소기한: </span>2023.08.04 16:30 </p>
						<p> <span>취소수수료: </span>티켓금액의 0~30% </p>
					</div>
					<div class="reserve_btn">						
						<a href="TicketingServlet?command=p2&session=delete" class="btn btn_blank">이전단계</a>					
						<a id = "nextSubmit" onclick="GoP4()" class="btn btn_blank">다음단계</a>				
					</div>						
				</div>							
			</div>								
		</div>									
	</div>										
</body>											
</html>												