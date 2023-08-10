<%@page import="java.sql.Date"%>
<%@page import="Ticketing.TicketingDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Ticketing.homeMatchDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"											
pageEncoding="UTF-8"%>	
<%@ page import="org.json.simple.*"%>
<%@ page import="java.util.HashMap"%>
<%
	ArrayList<homeMatchDto> MatchList = (ArrayList<homeMatchDto>)request.getAttribute("MatchList");
	TicketingDao TDao = new TicketingDao();
%>
<!DOCTYPE html>
<html>											
<head>											
	<meta charset="UTF-8">										
	<title>FC SEOUL</title>	
	<link rel="shortcut icon" type="image/x-icon" href="https://fcseoulpub.s3.ap-northeast-2.amazonaws.com/multi01/Club/Club/1675316444376.png">									
	<link rel="stylesheet" href="css/ticketingP1.css">	
	<script src="JS/jquery-3.7.0.min.js"></script>								
	<script>		
	function validation(){
		var checkbox = $(":checkbox[value='Y']");
		  for(var i = 0; i < checkbox.length; i++) {
		    var $this = $(checkbox[i]);
		    if(!$this.is(":checked")) {
		        alert('약관에 동의하지 않을 경우 가입할 수 없습니다.');
		        $this.focus();
		        return false;
		    }
		  }
		  return true;
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
				<li class="step1 on">
					<span>날짜/회차선택</span>
				</li>
				<li class="step2">
					<span>등급/좌석선택	
					</span>
				</li>
				<li class="step3">
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
			<div class ="area_reserve">
			<div class="bx_notice">
                    <strong class="title">예매안내</strong>
                    <pre class="area_txt">[2023시즌 예매안내]
36개월 이상 미취학 아동도 반드시 개별좌석 티켓 구매하셔야 입장 가능합니다.
원정석을 제외한 모든 좌석은 FC서울 응원 전용구역입니다.
경기당일 매표소를 최소화로 운영하기에 비대면 서비스인 무인발권기와 스마트티켓을 적극 이용해주시기 바랍니다.</pre>
                </div>
                <div id = "scheduleListDiv" class = "basic_tbl first_step">
                <table>
                	<colgroup>
	                	<col style="width: 160px;"> 
	                	<col style="width: 440px;"> 
	                	<col style="width: 188px;"> 
	                	<col style="width: 122px;">
                	</colgroup>
                	<thead>
                		<tr>
                			<th scope="col" style="padding-right: 20px;">
                				경기일시
                			</th> 
                			<th scope="col">
                				경기명
                			</th> 
                			<th scope="col" style="padding-left: 10px;">
                				경기장
                			</th> 
                			<th scope="col">
                				티켓예매
                			</th>
                		</tr>
                	</thead>
                	<tbody>
                	<% 
                	int count = 0;
                	for (homeMatchDto hMDto : MatchList) { %>
                		<tr>
                			<td class = "match_day">
                				<span class="date_num" style = "font-size : 20px;">
	                                 <%= hMDto.getDate() %>
	                            </span>
                			</td>
                			<td class = "match_team_info">
                				<div class = "emblem_bx">
                				<span class="bx_img">
                					<img src="<%= hMDto.getHome_logo() %>" alt="구단 엠블럼" style = "width : 70px;">
                				</span>
                				<span class="versus">VS</span>
                				<span class="bx_img">
                					<img src="<%= hMDto.getAway_logo() %>" alt="구단 엠블럼" style = "width : 70px;">
                				</span>
                				</div>
                				<div class="match_info_bx">
                					<div class="team_name">
                					<span><%= hMDto.getHome_name() %></span> vs <span><%= hMDto.getAway_name() %></span>
                					</div>
                				</div>
                			</td>
                			<td class="place"><span style = "display: flex; justify-content: center; font-size : 15px;"><%= hMDto.getStadium() %></span></td>
                			<td>
                			<a style = "display: flex; justify-content: center;" href="<%=count==0?"TicketingServlet?command=p2":"" %>" class="btn <%=count==0?"btn_reserve":"btn_reserve2"%>">
                                <%=count==0?"예매하기":"판매예정"%>
                            </a> <!----></td>
                		</tr>
                		<%count++;} %>
                	</tbody>
               	 </table>
                </div>
                <a href="/product/list?partnerNo=yKTAnaezRSnrAcQDjvoZSw%3D%3D" style = "
    display: flex;
    justify-content: center; margin-top: 40px;" class="btn_link">닫기</a>
                </div>								
		</div>									
	</div>										
</body>											
</html>												