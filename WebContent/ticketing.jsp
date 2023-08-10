<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.GoodsDto"%>
<%@ page import="dto.MatchDBDto"%>
<%@ page import="dto.RankDto"%>
<%@ page import="dto.MainNoticeDto"%>
<%@ page import="dto.MainNewsDto"%>
<%@ page import="dto.MainPhotoDto"%>
<%@ page import="java.util.ArrayList"%>
<%
	String id = (String)session.getAttribute("id");
	ArrayList<MainPhotoDto> pdto = (ArrayList<MainPhotoDto>)request.getAttribute("pdto");
	ArrayList<MainNewsDto> ndto = (ArrayList<MainNewsDto>)request.getAttribute("ndto");
	ArrayList<MainNoticeDto> ntdto = (ArrayList<MainNoticeDto>)request.getAttribute("ntdto");
	ArrayList<RankDto> radto = (ArrayList<RankDto>)request.getAttribute("radto");
	ArrayList<MatchDBDto> prevdto = (ArrayList<MatchDBDto>)request.getAttribute("prevdto");
	ArrayList<MatchDBDto> nextdto = (ArrayList<MatchDBDto>)request.getAttribute("nextdto");
	ArrayList<MatchDBDto> nextnextdto = (ArrayList<MatchDBDto>)request.getAttribute("nextnextdto");
	ArrayList<GoodsDto> goodsbandto = (ArrayList<GoodsDto>)request.getAttribute("goodsdto");
	ArrayList<GoodsDto> goodsbandto2 = (ArrayList<GoodsDto>)request.getAttribute("goodsdto2");
	ArrayList<GoodsDto> goodsbandto3 = (ArrayList<GoodsDto>)request.getAttribute("goodsdto3");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>FC SEOUL</title>
	<link rel="shortcut icon" type="image/x-icon" href="https://fcseoulpub.s3.ap-northeast-2.amazonaws.com/multi01/Club/Club/1675316444376.png">
	<link rel="stylesheet" href="css/TicketingV2.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<!-- bxslider -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
	<script>
	$('html').click(function(e) {
		if($(e.target).hasClass("button")) {
			if ($(e.target).parent().find(".button123").css("display") == "none") {
				$(".button123").css("display","none");
				$(".button123").removeClass("on");
				$(e.target).addClass("on");
				$(e.target).parent().find(".button123").css("display","block");
			} else if($(e.target).parent().find(".button123").css("display") == "block"){
				$(e.target).parent().find(".button123").css("display","none");
				$(e.target).removeClass("on");
			}
		}
		if(!($(e.target).hasClass("button"))) {
			$(".button123").parent().find(".button").removeClass("on");
			$(".button123").css("display","none");
		}
	});
	$("document").ready(function() {  
		let menu = $(".contentButton");
		let menuLocation = menu.offset();
	    $(window).scroll(function() {  
	    	if($(window).scrollTop()>=menuLocation.top){
	    		$(".contentButton").css("position","fixed");
	    		$(".contentButton").css("top","0");
	    	}
	    	else {
	    		$(".contentButton").css("position","absolute");
	    		$(".contentButton").css("top","");
	    	}
	    }); 
	    
        $(".slider").bxSlider({
        	
        });
      
        $(".mslide").bxSlider({
        		
        });
         
        $(".slide3").bxSlider({
        	
        }); 
        
		var currentPosition = parseInt($(".sidebar").css("top"));
		
	 	$(window).scroll(function() {
	    	var position = $(window).scrollTop(); 
	    	$(".sidebar").stop().animate({"top":position+currentPosition+"px"},700);
	  	});
	 	
		$(document).on("click",".sbtn",function(){
			$(".sbtn").removeClass("snsbutton");
			$(this).parent().find(".sbtn").addClass("snsbutton");
			});
		});
	
		let v1 = false;
		let v2 = false;
		$(function(){
			$(".ticketingBtn").click(function() {
<%-- 				if(<%=id%> == null){ --%>
// 					alert("로그인이 필요합니다.")
// 					location.href="FcController?command=login";
// 				}else{
					var openNewWindow = window.open("about:blank");
					openNewWindow.location.href = "TicketingServlet?command=p1";
// 				}
			});
			$(".lpBtn").click(function(){
				$(".buttonImage").css("display","flex");
			})
			$(".lpCloseBtn").click(function() {
				$(".buttonImage").css("display","none");
			})
			let smSlider = $(".inner1").bxSlider({
				pager: false,
                touchEnabled:false
	        });
			
			$("#amenu").click(function(){
				if($(".allList").css('display') == 'none'){
					$(".allList").css('display','block');
					$(".allmenu").addClass('on');
					$(".bannerlayer").css('display','block');					
				}else{
					$(".allList").css('display','none');
					$(".allmenu").removeClass('on');
					$(".bannerlayer").css('display','none');
				}
			});
			
			$(".menulist li").each(function(index){
				$(this).mouseenter(function(){
					let idx = $(this).index();
					let mName = $(this).attr("id");
					$(".menulist li").removeClass("over");
					$(".detailmenu li.dm").hide();
					$(this).addClass("over");
					$("."+mName).show();
					$(".bannerlayer2").show();
					smSlider.reloadSlider();
					$("."+mName).mouseenter(function(){
						$(this).show();
						$(".menulist li").eq(idx).addClass("over");
						smSlider.reloadSlider();
					});
				});
				$("html, body").mouseleave(function(){
					hideFunc();
				});
				$(".bannerlayer2").mouseover(function(){
					hideFunc();
				});
			});
		});
    	function hideFunc() {
    		$(".menulist li").removeClass("over");
    		$(".detailmenu li.dm").hide();
    		$(".bannerlayer2").hide();
    	} 	
    	function ready() {
			alert("준비중입니다.");
		}
    </script>
</head>
<body>
	<!-- 사이드바 -->
	<div class="sidebar">
		<ul>
			<li>
				<a href=""></a>
			</li>
			<li>
				<a href="https://www.facebook.com/fcseoul" target="_blank"></a>
			</li>
			<li>
				<a href="https://instagram.com/fcseoul/" target="_blank"></a>
			</li>
			<li>
				<a href="http://www.youtube.com/user/FCSEOUL" target="_blank"></a>
			</li>
			<li>
				<a href="/vr/stadium" target="_blank"></a>
			</li>
		</ul>
	</div>
	<!-- 사이드바 -->
	
	<!-- 티켓예매 -->
	<!-- 티켓예매 -->


	<!-- 배너 -->
	<div class="wrap">
        <header class="header">
        <!-- 배너 -->
            <div class="subheader">
                <div class="header1">
                    <div class="left">
                        <ul>
                            <li><a href="" target="_blank"><img src="https://www.fcseoul.com/resources/front/images/common/btn_sns1.png" alt=""></a></li>
                            <li><a href="" target="_blank"><img src="https://www.fcseoul.com/resources/front/images/common/btn_sns2.png" alt=""></a></li>
                            <li><a href="" target="_blank"><img src="https://www.fcseoul.com/resources/front/images/common/btn_sns3.png" alt=""></a></li>
                            <li><a href="" target="_blank"><img src="https://www.fcseoul.com/resources/front/images/common/btn_vr.png" alt=""></a></li>
                        </ul>
                    </div>
                    <div class="center">
                        <a href="FcController?command=fcSeoulMain"><img src="https://www.fcseoul.com/resources/front/images/common/img_logo_gold.png" alt=""></a>
                    </div>
                    <div class="right">
                        <ul>
                            <%
                            	if(session.getAttribute("id")==null){
                            %>
                            	<li><a href="FcController?command=join1">회원가입</a></li>
                            	<li><a href="FcController?command=login">로그인</a></li>
                            <%
                            	}else{
                            %>
                           		<li><a href="FcController?command=fcmyPage">마이페이지</a></li>
                           		<li><a href="FcController?command=logout">로그아웃</a></li>
                            <%
                            	}
                            %>
                            <li><a href="" class="eng">ENG</a></li>
                        </ul>
                    </div>
                </div>  
                <div class="header2">
      <!-- 클릭 -->	<div class="allmenu" id="amenu" >
                        <span class="all1"></span>
                        <span class="all2"></span>
                        <span class="all3"></span>
                    </div>
                    <ul class="menulist">
                        <li id="media"><a href="FcController?command=news2">MEDIA</a></li>
                        <li id="matches"><a href="FcController?command=matchInfo">Matches</a></li>
                        <li id="tickets"><a href="FcController?command=ticketing">Tickets</a></li>
                        <li id="membership"><a href="">Membership</a></li>
                        <li id="club"><a href="FcController?command=teamMember">Club</a></li>
                        <li id="fanzone"><a href="FcController?command=officialSNS">Fanzone</a></li>
                        <li id="shopb"><a href="FcController?command=main" target="_blank" class="shop">shop</a></li>
                    </ul>
                </div>
            </div>
        <!-- 배너 -->
        <!-- 메뉴드롭 -->
        	<div class="bannerList">
        		<div class="subBanner">
      <!-- 나옴 -->  	<div class="allList" id="alist" style="display: none;">
        				<div class="list1">
        					<div class ="list1box" style="width: 135px">	
        						<ul>
        							<li><a href="FcController?command=news2">NEWS</a></li>
        							<li><a href="FcController?command=notice">NOTICE</a></li>
        							<li><a href="FcController?command=photo">PHOTO</a></li>
        						</ul>
        					</div>		<!-- 미디어 -->
        					<div class ="list1box" style="width: 158px">
        						<ul>
        							<li> <a href="FcController?command=matchInfo">일정 / 결과</a></li>
        							<li> <a href="FcController?command=rankingList">기록 / 순위</a></li>
        						</ul>
        					</div>	<!-- 매치 -->
        					<div class ="list1box" style="width: 150px">
        						<ul>
        							<li><a href= "FcController?command=ticketing">티켓 예매</a></li>
        							<li><a href= "#">시즌티켓</a></li>
        							<li><a href= "#">단체 입장권</a></li>
        							<li><a href= "#">1865 스카이박스</a></li>
        						</ul>
        					</div>	<!-- 티켓 -->
        					<div class ="list1box" style="width: 220px">
        						<ul>
        							<li><a href= "">멤버십(GS&POINT) 카드</a></li>
        							<li><a href= "">멤버십(GS&POINT) 카드 안내</a></li>
        						</ul>
        					</div>	<!-- 맴버쉽 -->
        					<div class ="list1box" style="width: 125px">
        						<ul>
        							<li><a href= "FcController?command=teamMember">선수단 소개</a></li>
        							<li><a href="" >유스팀 소개</a></li>
        							<li><a href= "FcController?command=clubIntro">구단 소개</a></li>
        							<li><a href= "">스폰서</a></li>
        							<li><a href= "">전자공고</a></li>
        						</ul>
        					</div>	<!-- 클럽 -->
        					<div class ="list1box"style="width: 160px">
        						<ul>
        							<li><a href= "FcController?command=officialSNS">공식SNS</a></li>
        							<li><a href= "FcController?command=socialBoard">소셜계시판</a></li>
        							<li class="allfaq"><a href="FcController?command=faq">FAQ</a></li>
        							<li class="allqna"><a href="FcController?command=QA">Q&A</a></li>
        							<li><a href= "" onclick="ready()">이벤트ZONE</a></li>
        							<li><a href= "" onclick="ready()">FC서울승리버스</a></li>
        						</ul>
        					</div>	<!-- 팬좀 -->
        					<div class ="list1box" style="width: 164px">
        						<ul>
        							<li><a href="FcController?command=main" target="_blank">온라인쇼핑몰</a></li>
        						</ul>
        					</div>	<!-- 샵 -->
        				</div>
        				<div class="vrbanner">
        					<a href="#" target="_blank">
        						<img alt="vr배너" src="https://fcseoulpub.s3.ap-northeast-2.amazonaws.com/multi01/Imgs/menu_banner/1593407759624.jpg">
        					</a>
        				</div>
        			</div>
        			<div class="detailmenu">
        				<ul>
        					<li class="media dm" style="display: none;">
        						<div class="detailleft">
        							<h2>MEDIA</h2>
        							<ul>
        								<li><a href="FcController?command=news2">NEWS</a></li>
        								<li><a href="FcController?command=notice">NOTICE</a></li>
        								<li><a href="FcController?command=photo">PHOTO</a></li>
        							</ul>
        						</div>
        						<div class="detailright">
        							<div class="mediabox">
        								<h4>NEWS</h4>
        								<div>
        								<%
        									for(MainNewsDto nedto: ndto ){ 
        								        									System.out.println("nedto: "+ nedto.getImage());
        								%>
        									<a href="FcController?command=newsDetail&seq=<%=nedto.getBno()%>">
        										<input type="hidden" name="bno" value="<%=nedto.getBno()%>">
        										<img class="mediaimg" alt="news이미지" src="<%=nedto.getImage()%>">
        										<p class="text"><%=nedto.getTitle() %></p>
        									</a>
        								<%} %>
        								</div>
        								<!-- <div>
        									<a href="#">
        										<img class="mediaimg" alt="news이미지" src="https://files.fcseoul.com/multi01/News/FcNews/1677553176924.png">
        										<p class="text">FC서울, 2023시즌 다문화 축구교실 참가자 모집</p>
        									</a>
        								</div> -->
        							</div>
        							<div class="mediabox">
        								<h4>NOTICE</h4>
        								<div class="noticebox">
        								<%for(MainNoticeDto ntcdto:ntdto){ %>
        									<a href="FcController?command=noticeDetail&bno=<%=ntcdto.getBno()%>">
        										<div class="nbox1">
        											<input type="hidden" value="<%=ntcdto.getBno()%>">
        											<p class="ntext"><%=ntcdto.getTitle() %></p>
        											<div class="ntext2"><p><%=ntcdto.getContent() %></p></div>
        											<div class="ndate"><%=ntcdto.getW_date() %></div>
        										</div>
        									</a>
        									<%} %>
        								</div>
        							</div>
        							<div class="mediabox">
        								<h4>PHOTO</h4>
        								<div>
        								<%
        								for(MainPhotoDto phoDto : pdto){ 
        									
        								%>
        									<a href="FcController?command=photoDetail&bno=<%=phoDto.getBno()%>">
        										<input type="hidden" name="bno" value="<%=phoDto.getBno()%>">
        										<img class="mediaimg" alt="" src="<%=phoDto.getImage()%>">
        										<p class="text"><%=phoDto.getTitle() %></p>
        									</a>
        								<%} %>
        								</div>
        								
        							</div>
        						</div>
        					</li>
        					<li class="matches dm"  style="display: none;" >
        						<div class="detailleft">
        							<h2>MATCHES</h2>
        							<ul>
        								<li><a href="FcController?command=matchInfo">일정 / 결과</a></li>
        								<li><a href="FcController?command=rankingList">기록 / 순위</a></li>
        							</ul>
        						</div>
        						<div class="detailright">
        							<div class="mbox">
        								<h4>PREV MATCHES</h4>
        								<%for(MatchDBDto matdto : prevdto){ %>
        								<div class="scorebox">
        									<div class="mleft">
        										<img alt="homelogo" src="<%=matdto.getHome_logo()%>">
        										<p><%=matdto.getHome_name() %></p>
        									</div>
        									<div class="mcenter">
        										<div class="mc1">
        											<p><%=matdto.getHome_fulltime() %></p>	<!-- 졌을때 클래스 -->
        											<p>:</p>	
        											<p><%=matdto.getAway_fulltime() %></p>	<!-- 이겼을때 클래스 -->
        										</div>
        									</div>
        									<div class="mright">
        										<img alt="awaylogo" src="<%=matdto.getAway_logo()%>">
        										<p><%=matdto.getAway_name() %></p>
        									</div>
        									<div class="matchtime">
        										<p><%=matdto.getM_date() %></p>
        										<p><%=matdto.getStadium() %></p>
        									</div>
        									<div class="matchresult">
        										<a href="FcController?command=matchInfoPrev">경기결과</a>
        									</div>
        								</div>
        								<%} %>
        							</div>
        							<div class="mbox mid">
        								<h4>NEXT MATCHES</h4>
        								<%for(MatchDBDto madto: nextdto){ %>
        								<div class="scorebox">
        									<div class="mleft">
        										<img alt="homelogo" src="<%=madto.getHome_logo()%>">
        										<p><%=madto.getHome_name() %></p>
        									</div>
        									<div class="mcenter">
        										<p class="vs">VS</p>
        									</div>
        									<div class="mright">
        										<img alt="awaylogo" src="<%=madto.getAway_logo()%>">
        										<p><%=madto.getAway_name() %></p>
        									</div>
        								</div>
        								<div class="matchtime">
        									<p><%=madto.getM_date() %></p>
        									<p><%=madto.getStadium() %></p>
        								</div>
        								<a href="FcController?command=ticketing" class="cket" style="display: <%=madto.getIs_home().equals("True") ? "block":"none" %>">티켓예매</a>
        								<%} %>
        								<div class="nomatch" style="display: none;">		<!-- 매치가 없을때 사용-->
        									<img alt="" src="https://www.fcseoul.com/resources/front/images/common/nogame_dropdown.jpg">
        								</div>
        							</div>
        							<div class="mbox2">
        								<p>
        									<img alt="k리그 logo" src="https://www.fcseoul.com/resources/front/images/common/ico_kLeague.png">
        									K LEAGUE 1
        								</p>
        								<%for(RankDto ranDto:radto){ %>
        								<p>현재순위 (<%=ranDto.getGames() %>경기 기준)</p>
        								<p>
        									<strong><%=ranDto.getRank() %></strong>
        									위
        								</p>
        								<div class="teamrecode">
        									<span>
        										<b><%=ranDto.getWin() %></b>
        										승
        									</span>
        									<span>
        										<b><%=ranDto.getDraw() %></b>
        										무
        									</span>
        									<span>
        										<b><%=ranDto.getLose() %></b>
        										패
        									</span>
        									<span>
        										<b><%=ranDto.getPoint() %></b>
        										점
        									</span>
        								</div>
        								<%} %>
        								<div class="allrecode">
        									<a href="FcController?command=rankingList" class="arbtn">전체순위</a>
        								</div>
        							</div>
        						</div>
        					</li>
        					<li class="tickets dm"  style="display: none;" >
        						<div class="detailleft">
        							<h2>TICKETS</h2>
        							<ul>
        								<li><a href="FcController?command=ticketing">티켓 예매</a></li>
        								<li><a href="#">시즌티켓</a></li>
        								<li><a href="#">단체 입장권</a></li>
        								<li><a href="#">1865 스카이박스</a></li>
        							</ul>
        						</div>
        						<div class="detailright">
        							<a href="FcController?command=ticketing">
        								<img alt="" src="https://www.fcseoul.com/resources/front/images/common/img_drop_t4.jpg?20230216">
        							</a>
        						</div>
        					</li>
        					<li class="membership dm"  style="display: none;" >
        						<div class="detailleft">
        							<h2>MEMBERSHIP</h2>
        							<ul>
        								<li><a href="" onclick="ready()">멤버십(GS&POINT) 카드</a></li>
        								<li><a href="" onclick="ready()">멤버십(GS&POINT) 카드 안내</a></li>
        							</ul>
        						</div>
        						<div class="detailright">
									<div class="membox">	 <!-- float left marginleft 60px  -->
        								<a href="">
        									<img alt="" src="https://www.fcseoul.com/resources/front/images/common/img_drop_m1.jpg">
        								</a>
        							</div>
        							<div class="membox">
        								<a href="">
        									<img alt="" src="https://www.fcseoul.com/resources/front/images/common/img_drop_m2.jpg">
        								</a>
        							</div>
        						</div>
        					</li>
        					<li class="club dm"  style="display: none;" >
        						<div class="detailleft">
        							<h2>CLUB</h2>
        							<ul>
        								<li><a href="FcController?command=teamMember&position=FW">선수단 소개</a></li>
        								<li><a href="" onclick="ready()">유스팀 소개</a></li>
        								<li><a href="FcController?command=clubIntro">구단 소개</a></li>
        								<li><a href="" onclick="ready()">스폰서</a></li>
        								<li><a href="" onclick="ready()">전자공고</a></li>
        							</ul>
        						</div>
        						<div class="rightclub">
        							<div class="clubbox">
        								<div class="lbtn "> <img alt="" src="https://www.fcseoul.com/resources/front/images/sub/common/btn_seatPrev.png"> </div>
	        								<ul>
	        									<li>
	        										<a href="FcController?command=teamMember">
	        											<div class="pinfo">
	        												<p class="position">
	        													<span>FW</span> 
	        													<span>7</span>
	        												</p>	
	        												<p class="name">나상호</p> 	
	        												<br>
	        												<p class="goal"> 
	        													<strong>득점</strong> <span>8</span>
	        												</p>
	        												<p class="assist">
	        													<strong>도움</strong> <span>2</span>
	        												</p>
	        											</div>
	        											<img alt="" src="https://files.fcseoul.com/data03/Club/front_sml_img/1676855921670.png">
	        										</a>
	        									</li>	
	        								</ul>
	        							<div class="rbtn"> <img alt="" src="https://www.fcseoul.com/resources/front/images/sub/common/btn_seatNext.png"> </div>
        							</div>
        							<div class="clubbox">
        								<a href="">
        									<img alt="FC서울 유스" src="https://www.fcseoul.com/resources/front/images/common/img_drop_c2.jpg?2023022101">
        								</a>
        							</div>
        							<div class="clubbox">
        								<a href="">
        									<img alt="코칭스태프" src="https://www.fcseoul.com/resources/front/images/common/img_drop_c3.jpg?210909">
        								</a>
        							</div>
        						</div>
        					</li>
        					<li class="fanzone dm"  style="display: none;" >
        						<div class="detailleft">
        							<h2>FAN ZONE</h2>
        							<ul>
        								<li><a href="FcController?command=officialSNS">공식 SNS</a></li>
        								<li><a href="FcController?command=socialBoard">소셜게시판</a></li>
        								<li><a href="FcController?command=faq">FAQ</a></li>
        								<li><a href="FcController?command=QA">Q&A</a></li>
        								<li><a href="" onclick="ready()">이벤트 ZONE</a></li>
        								<li><a href="" onclick="ready()">FC서울 승리버스</a></li>
        							</ul>
        						</div>
        						<div class="detailright">
        							<div class="fanbox">	<!-- margin-left27px  float left-->
        								<a href="">
        									<img alt="" src="https://www.fcseoul.com/resources/front/images/common/img_drop_f3.jpg">
        								</a>
        							</div>
        							<div class="fanbox">
        								<a href="">
        									<img alt="" src="https://www.fcseoul.com/resources/front/images/common/img_drop_f2.jpg">
        								</a>
        							</div>
        							<div class="fanbox">
        								<a href="">
        									<img alt="" src="https://www.fcseoul.com/resources/front/images/common/img_drop_f1.jpg">
        								</a>
        							</div>
        						</div>
        					</li>
        					<li class="shopb dm"  style="display: none;" >
        						<div class="detailleft">
        							<h2>SHOP</h2>
        							<ul>
        								<li><a href="FcController?command=main" target="_blank" class="dshop">온라인 쇼핑몰</a></li>
        							</ul>
        						</div>
        						<div class="detailright">
        							<div class="shopbox">
        								<strong>BEST ITEM</strong>
        								<div class="shopitem">
        								
        									<div class="inner">
        										<button class="lbtn">  </button>
	        										<div class="inner1">
		        										<ul>
		        											<div class="shopslide">
		        											<%for(GoodsDto gdto: goodsbandto) {%>
			        											<li>
			        												<a href="FcController?command=detailPage&goodsId=<%=gdto.getGoods_id()%>" target="_blank">
			        													<div class="shopimg">
																			<img alt="" src="<%=gdto.getGoods_img()%>">
																		</div>
																		<p><%=gdto.getGoods_name() %></p>
																		<p class="price">₩<%=gdto.getPrice() %></p>
			        												</a>
			        											</li>
			        											<%} %>
		           											</div>
		           										</ul>
		           										<ul>
		           											<div class="shopslide">	
		           											<%for(GoodsDto gdto : goodsbandto2){ %>
			           											<li>
			        												<a href="FcController?command=detailPage&goodsId=<%=gdto.getGoods_id()%>" target="_blank">
			        													<div class="shopimg">
			        														<img alt="" src="<%=gdto.getGoods_img()%>">
			        													</div>
			        													<p><%=gdto.getGoods_name() %></p>
			        													<p class="price">₩<%=gdto.getPrice() %></p>
			        												</a>
			        											</li>
			        											<%} %>
		        											</div>
		        										</ul>
		        										<ul>
		        											<div class="shopslide">
		        											<%for(GoodsDto gdto: goodsbandto3){ %>
			        											<li>
			        												<a href="FcController?command=detailPage&goodsId=<%=gdto.getGoods_id()%>" target="_blank">
			        													<div class="shopimg">
			        														<img alt="" src="<%=gdto.getGoods_img()%>">
			        													</div>
			        													<p><%=gdto.getGoods_name() %></p>
			        													<p class="price">₩<%=gdto.getPrice()%></p>
			        												</a>
			        											</li>
			        											<%} %>
		        											</div>
		        										</ul>
		        									</div>
	        									<button class="rbtn">  </button>>
        									</div>
        									
        								</div>
        							</div>
        						</div>
        					</li>
        				</ul>
        			</div>	
        		</div>
        	</div>
        </header>
    </div>
	<!-- 배너 -->
	<div class="bannerlayer" style="display: none;"></div>
	<div class="bannerlayer2" style="display: none;"></div>
	<!-- 메인 -->
	<section class="bannertop">
				<div class="container">
					<h2>TICKETS</h2>
				</div>
				<div class="contentButton">
					<div class="content">
						<ul>
							<li class="home"><a href="https://www.fcseoul.com/"></a></li>

							<li>
								<button class="button">
									TICKETS</button>
								<ul id="buttonUI" class = button123 style="display: none;">
									<li><a href="FcController?command=news2">MEDIA</a>
									</li>
									<li><a
										href="FcController?command=matchInfo">MATCHES</a>
									</li>
									<li><a
										href="FcController?command=ticketing">TICKETS</a>
									</li>
									<li><a
										href="FcController?command=teamMember">CLUB</a>
									</li>
									<li><a href="FcController?command=officialSNS">FAN
											ZONE</a></li>
								</ul>
							</li>

							<li>
								<button class="button">
									티켓 예매</button>
								<ul id="buttonUI2" class = button123 style="display: none;">
									<li><a href="FcController?command=ticketing">티켓 예매</a>
									</li>
									<li><a href="">시즌티켓</a>
									</li>
									<li><a href="">단체 입장권</a>
									</li>
									<li><a href="">1865 스카이박스</a>
									</li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
		</section>
		<div class="mainSection">
			<section class="subtop">
				<div class="left">
					<span>share <img
						src="https://www.fcseoul.com/resources/front/images/sub/common/ico_gt.png" />
					</span> <a
						href="https://www.facebook.com/login.php?skip_api_login=1&api_key=966242223397117&signed_next=1&next=https%3A%2F%2Fwww.facebook.com%2Fshare.php%3Fu%3Dhttps%253A%252F%252Fwww.fcseoul.com%252Fmedia%252FnewsList&cancel_url=https%3A%2F%2Fwww.facebook.com%2Fdialog%2Fclose_window%2F%3Fapp_id%3D966242223397117%26connect%3D0%23_%3D_&display=popup&locale=ko_KR">
						<img
						src="https://www.fcseoul.com/resources/front/images/sub/common/ico_sns1.png" />
					</a>
				</div>
				<h3 class="h3">단일 경기 티켓 예매</h3>
				<div class="right">
					<button type="button">URL 복사</button>
				</div>
			</section>
			
			<section class = "ticketing1">
				<h4>
					좌석배치도
				</h4>
				<div class = "imgWrap">
					<img src = "https://www.fcseoul.com/resources/front/images/sub/tickets/img_a_seating_plan02.jpg?23022301" class="seatImg">
					<div class="btnWrap">
                        <a class = "ticketingBtn">티켓 예매하기</a>
                    </div>
				</div>
			</section>
			
			<section class="ticketing2">
                <h4>요금표</h4>

                <div class="tblWrap">
                    <div>
                        <img src="https://www.fcseoul.com/resources/front/images/sub/tickets/img_charges1.jpg" alt="신나는 응원으로 경기를 즐기고 싶다면?">
                    </div>
                    <table class="seatTable">
                        <thead>
                            <tr>
                                <th>구역</th>
                                <th>권종</th>
                                <th class="price">예매 가격</th>
                                <th class="onsite">현장 가격</th>
                                <th>제공사항</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="first">
                                    <strong>VIP테이블석</strong>
                                </td>
                                <td>일반</td>
                                <td class="price">40,000원</td>
                                <td class="onsite">43,000원</td>
                                <td class="last">-</td>
                            </tr>
                            <tr>
                                <td class="first">
                                    <strong>프리미엄<br>서측 센터지정석</strong>
                                </td>
                                <td>일반</td>
                                <td class="price">33,000원</td>
                                <td class="onsite">36,000원</td>
                                <td class="last">-</td>
                            </tr>
                            <tr>
                                <td class="first">
                                    <strong>프리미엄<br>서측 지정석</strong>
                                </td>
                                <td>일반</td>
                                <td class="price">28,000원</td>
                                <td class="onsite">31,000원</td>
                                <td class="last">-</td>
                            </tr>
                            <tr>
                                <td class="first">
                                    <strong>서측 지정석</strong>
                                </td>
                                <td>일반</td>
                                <td class="price">23,000원</td>
                                <td class="onsite">26,000원</td>
                                <td class="last">-</td>
                            </tr>
                            <tr>
                                <td class="first" rowspan="3">
                                    <div><img src="https://www.fcseoul.com/resources/front/images/sub/tickets/shinhan_play.jpg" alt="신한플레이"></div>
                                    <strong>신한플레이 동측 지정</strong>
                                </td>
                                <td>성인</td>
                                <td class="price">18,000원</td>
                                <td class="onsite">21,000원</td>
                                <td class="last" rowspan="3">- FA컵 경기에는 '동측 지정석'으로 운영</td>
                            </tr>
                            <tr>
                                <td>청소년</td>
                                <td class="price">13,000원</td>
                                <td class="onsite">16,000원</td>
                            </tr>
                            <tr>
                                <td>어린이</td>
                                <td class="price">7,000원</td>
                                <td class="onsite">10,000원</td>
                            </tr>
                            <tr>
                                <td class="first" rowspan="3">
                                    <strong>동측 지정석</strong>
                                </td>
                                <td>성인</td>
                                <td class="price">16,000원</td>
                                <td class="onsite">19,000원</td>
                                <td class="last" rowspan="3">
                                    <p>-</p>
                                </td>
                            </tr>
                            <tr>
                                <td>청소년</td>
                                <td class="price">11,000원</td>
                                <td class="onsite">14,000원</td>
                            </tr>
                            <tr>
                                <td>어린이</td>
                                <td class="price">5,000원</td>
                                <td class="onsite">8,000원</td>
                            </tr>

							<tr>
                                <td class="first" rowspan="3">
                                    <strong>북측 자유석</strong>
                                </td>
                                <td>성인</td>
                                <td class="price">16,000원</td>
                                <td class="onsite">19,000원</td>
                                <td class="last" rowspan="3">
                                    <p>-</p>
                                </td>
                            </tr>
                            <tr>
                                <td>청소년</td>
                                <td class="price">11,000원</td>
                                <td class="onsite">14,000원</td>
                            </tr>
                            <tr>
                                <td>어린이</td>
                                <td class="price">5,000원</td>
                                <td class="onsite">8,000원</td>
                            </tr>


                            <tr>
                                <td class="first" rowspan="2">
                                    <strong>원정석</strong>
                                </td>
                                <td>성인/청소년</td>
                                <td class="price">16,000원</td>
                                <!-- <td class="discount">-</td> -->
                                <td class="onsite">19,000원</td>
                                <td class="last" rowspan="2">
                                    <p>-</p>
                                </td>
                            </tr>
                            <tr>
                                <td>어린이</td>
                                <td class="price">5,000원</td>
                                <!-- <td class="discount">-</td> -->
                                <td class="onsite">8,000원</td>
                            </tr>
                        </tbody>
                    </table>
                    <!-- <div class="no">정부정책에 따라 무기한 운영하지 않습니다.</div> -->

                    <div class="bottomTxtWrap">
                        <!-- <p>* 원정석 가격은 상대팀 정책에 따라 인상될 수 있습니다.</p> -->

                        <p>* 어린이는 36개월 이상부터 초등학생, 청소년은 중학생부터 고등학생까지 해당됩니다.</p>
                        <p>* FC서울 홈경기 티켓 예매는 경기일 기준 D-5일 18시에 정식 오픈되며, 1인당 최대 6매까지 예매 가능합니다. (예매 시 장당 1,000원의 예매 수수료 발생)</p>
                        <p>* PLUS 멤버십 회원 “THR RED” 는 정식 오픈 3시간 전, 최대 2매까지 선예매 가능합니다.</p>
                        <p>* 북측 자유석을 제외하고 전 좌석 지정좌석으로 운영하고 있습니다.</p>
                        <p>* FC서울 GS&amp;POINT 멤버십 할인은 예매/현장 구매시 최대 2매까지 장당 2,000원(일반 GS&amp;POINT 멤버십은 1,000원)의 할인이 적용됩니다.<br>&nbsp;&nbsp;&nbsp;(스카이라운지, 스카이펍, 테이블석, 프리미엄 서측센터지정석, 프리미엄 서측지정석, 원정석 제외)</p>
                        <p>* 원정석 가격은 상대팀 티켓 정책에 따라 변경될 수 있습니다. 원정석 외 구역에서 원정팀을 응원하는 행위 및 원정팀 관련 MD 착용/소지자는 입장 거부 또는 퇴장 조치를 당할 수 &nbsp;&nbsp;&nbsp;있으며, 이에 따른 모든 책임은 본인에게 있습니다.</p>
                        <p>* FC서울 홈경기 당일은 경기장 내 일반 차량의 주차가 제한됩니다. 관람 시 대중교통 이용을 부탁드리며, 불가피한 경우 주변 공원 등 외부 주차장 이용 바랍니다.</p>
                    </div>
                </div>

                <div class="tblWrap col">
                    <div class="img_charges">
                        <img src="https://www.fcseoul.com/resources/front/images/sub/tickets/img_charges2.jpg" alt="먹거리와 함께 경기를 즐기고 싶다면?">
                    </div>
                    <table class="seatTable">
                        <thead>
                            <tr>
                                <th colspan="2">구역</th>
                                <th>권종</th>
                                <th class="price">예매 가격</th>
                                <th class="onsite">현장 가격</th>
                                <th>제공사항</th>
                            </tr>
                        </thead>
                        <tbody>
                            
                            <tr>
                                <td class="first" colspan="2">
                                    <div>
                                        <img src="https://www.fcseoul.com/resources/front/images/sub/tickets/tmon.jpg" alt="티몬">
                                    </div>
                                    <strong>티몬 몬스터 룸</strong>
                                </td>
                                <td>일반</td>
                                <td class="price">329,000원</td>
                                <!-- <td class="discount">-</td> -->
                                <td class="onsite">-</td>
                                <td class="last">
				                    - 단독룸<br>
									- 맥주, 와인, 음료, 다과 제공<br>
									* 최대 12인 입장 가능<br>
									- FA컵 경기에는 미운영
									
                                </td>
                            </tr>
                            <tr>
                                <td class="first" colspan="2">
                                    <div>
                                        <img src="https://www.fcseoul.com/resources/front/images/sub/tickets/tmon.jpg" alt="티몬">
                                    </div>
                                    <strong>티몬 몬스터 라운지</strong>
                                </td>
                                <td>일반</td>
                                <td class="price">32,000원</td>
                                <!-- <td class="discount">-</td> -->
                                <td class="onsite">-</td>
                                <td class="last">
									- 맥주, 와인, 음료, 다과 제공<br>
									* 최대 20인 입장 가능<br>
									- FA컵 경기에는 미운영
                                </td>
                            </tr>
                            

                            <tr>
                                <td class="first" rowspan="4">
                                    <div><img src="https://www.fcseoul.com/resources/front/images/sub/tickets/tmon.jpg" alt="한돈 스카이펍"></div>
                                    
                                    <strong>한돈스카이펍</strong>
                                </td>
                                <td rowspan="2">테이블석</td>
                                <td>성인</td>
                                <td class="price">40,000원</td>
                                <!-- <td class="discount">-</td> -->
                                <td class="onsite">43,000원</td>
                                <td class="last" rowspan="4">
                                    <p>- 무제한 생맥주, 음료 제공</p>
                                    <p>- 한돈 안주메뉴 제공 (1인 1SET)</p>
                                    <p>* 추가 음식 구매 가능</p>
                                </td>
                            </tr>
                            <tr>
                                <td>청소년/어린이</td>
                                <td class="price">28,000원</td>
                                <!-- <td class="discount">-</td> -->
                                <td class="onsite">31,000원</td>
                            </tr>
                            <tr>
                                <td rowspan="2">테라스석</td>
                                <td>성인</td>
                                <td class="price">35,000원</td>
                                <!-- <td class="discount">-</td> -->
                                <td class="onsite">38,000원</td>
                            </tr>
                            <tr>
                                <td>청소년/어린이</td>
                                <td class="price">23,000원</td>
                                <td class="onsite">26,000원</td>
                            </tr>
                            <tr>
                                <td class="first" colspan="2" rowspan="2">
                                    <div>
                                    </div>
                                    <strong>가족<br>테이블석</strong>
                                </td>
                                <td>성인</td>
                                <td class="price">35,000원</td>
                                <td class="onsite">38,000원</td>
                                <td class="last" rowspan="2">
                                    <p>-</p>
                                </td>
                            </tr>
                            <tr>
                                <td>청소년/어린이</td>
                                <td class="price">28,000원</td>
                                <td class="onsite">31,000원</td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="tblWrap col">
                    <div class="img_charges">
                        <img src="https://www.fcseoul.com/resources/front/images/sub/tickets/img_charges3.jpg" alt="특별한 공간에서 경기를 즐기고 싶다면?">
                    </div>
                    <table class="skyTable">
                        <thead>
                            <tr>
                                <th>구역</th>
                                <th>권종</th>
                                <th class="price">가격</th>
                                <th class="onsite">현장 가격</th>
                                <th>제공사항</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="first" rowspan="2">
                                	<div>
                                        <img src="https://www.fcseoul.com/resources/front/images/sub/tickets/1865.png" alt="1865">
                                    </div>
                                    <strong>1865 스카이박스</strong>
                                    <p><button data-seat="seat22">경기장 View</button></p>
                                </td>
                                <td>22인실</td>
                                <td class="price">350만원</td>
                                <td class="onsite">-</td>
                                <td class="last" rowspan="2">
                                    <p>- FA컵 경기에는 미운영</p>
                                </td>
                            </tr>
                            <tr>
                                <td>12인실</td>
                                <td class="price">250만원</td>
                                <td class="onsite">-</td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <section class="tickets t2 sub3">
                    <h4>할인 / 무료 입장 안내</h4>

                    <div class="tblWrap">
                        <table class = "sale">
                            <thead>
                                <tr>
                                    <th>구분</th>
                                    <th>구역</th>
                                    <th class="price">할인</th>
                                    <th>세부내용</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="first">장애인</td>
                                    <td>일반 지정석</td>
                                    <td class="price">무료(동반 1인)</td>
                                    <td class="last">
                                        <p style="letter-spacing:-0.2px;">
                                            - 중증 장애인(1-3급)에 해당하며 보호자 동반 1인까지 무료 <br>

                                            - 서울월드컵경기장 메가박스 입구 옆 D1 게이트에서 장애인등록증 확인 후 티켓 제공 및 입장 (사전 예매 X)

                                        </p>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="first">군경 무료 혜택</td>
                                    <td>일반 지정석</td>
                                    <td class="price">무료</td>
                                    <td class="last">
                                        <p>- K리그 한정 / 한국프로축구연맹 - 국방부 &amp; 경찰청 협약사항</p>
                                        <p>- 군인(현역병&amp;직업군인), 경찰(의경&amp;직업경찰) 본인 및 동반 1인까지 무료 </p>
                                        <p>- 매표소에서 군인, 경찰 신분 증명 확인 후 티켓 제공 및 입장 (사전 예매 X)</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="first">36개월 미만 영유아</td>
                                    <td>전구역</td>
                                    <td class="price">무료</td>
                                    <td class="last">
                                        <p>- 좌석 점유 시 티켓을 구매하셔야 합니다</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="first">65세 이상 노인</td>
                                    <td>일반 지정석</td>
                                    <td class="price">할인<br>(1인 5,000원)</td>
                                    <td class="last">
                                        <p>- 매표소에서 신분증 확인 후 티켓 구매 및 입장</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="first">국가유공자</td>
                                    <td>일반 지정석</td>
                                    <td class="price">할인<br>(1인 5,000원)</td>
                                    <td class="last">
                                        <p>- 매표소에서 국가유공자증 확인 후 티켓 구매 및 입장</p>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="first">K리그 축덕카드</td>
                                    <td>전 구역</td>
                                    <td class="price">신용카드 5,000원 <br>체크카드 3,000원</td>
                                    <td class="last">
                                        <p>- 월 2회 사용 가능</p>
                                        <p>- 1회당 최대 2장씩 혜택 적용 가능</p>
                                    </td>
                                </tr>
                            </tbody>
                        	</table>
                    </div>
                </section>



                <section>
                    <div class="grayBox">
                        <div class="left">
                            <div class="guideTitle">
                                <strong>장애인 전용 게이트 구역별 입장 동선 안내</strong>
                            </div>

                            <ul class="guideUl">
                                <li>
                                    <span>1층 E석 :</span> 상암 메가박스 입구 정면 좌측 D-1 GATE
                                    입장 후 좌측 휠체어석 이용
                                </li>
                                <li>
                                    <span>3층 E석 :</span> 북동측 엘리베이터 3층 하차, E구역
                                    18번 GATE 입장
                                </li>
                                <li>
                                    <span>3층 N석 :</span> 북동측 엘리베이터 3층 하차, N구역 1번
                                    GATE 입장
                                </li>
                            </ul>

                            <div class="btnWrap">
                                <button type="button" class="lpBtn">
                                    장애인 전용 구역 입장 동선 안내 이미지
                                </button>
                            </div>
                        </div>
						
                        <div class="right">
                            <div>
                                <iframe width="548" height="309" src="https://www.youtube.com/embed/sedMwfkU-gQ?loop=1;playlist=sedMwfkU-gQ"></iframe>
                            </div>
                        </div>
                    </div>
                </section>
        </section>
			</div>
			<div class = "buttonImage" style = " display : none; ">
				<div class = "top">
					<strong class="title">입장동선 안내</strong>
					<button type="button" class="lpCloseBtn"></button>
				</div>
				<div class = "bottom">
					<div>
                        <img src="https://www.fcseoul.com/resources/front/images/sub/tickets/img_map1.jpg" alt="">
                    </div>
				</div>
			</div>
	<!-- 메인 -->
		<footer class="footer" id="footer">
			<section class="mainbot">
				<div class="contentwrap">
					<div class="sponsorwrap">
						<strong> main sponsors </strong>
						<div class="imgl">
							<a href="http://www.gs.co.kr" target="_blank"> <img
								src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_01.jpg
                                                                "
								alt="GS">
							</a>
						</div>
						<div class="imgr">
							<a href="http://www.gsenc.com/" target="_blank"> <img
								src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_02.jpg?20230310"
								alt="GS건설">
							</a>
						</div>
						<div class="imgl">
							<a href="http://www.gscaltex.com" target="_blank"> <img
								src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_03.jpg"
								alt="GS칼텍스]">
							</a>
						</div>
						<div class="imgr">
							<a href="http://www.gs25.gsretail.com" target="_blank"> <img
								src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_05.jpg"
								alt="GS 25">
							</a>
						</div>
						<div class="imgl">
							<a href="http://www.gsshop.com" target="_blank"> <img
								src="        https://www.fcseoul.com/resources/front/images/main/sponsor/img_04.jpg"
								alt="GS SHOP">
							</a>
						</div>
						<div class="imgr">
							<a href="http://www.gseps.com" target="_blank"> <img
								src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_06.jpg"
								alt="GS EPS">
							</a>
						</div>
						<div class="imgl">
							<a href="http://www.gspower.com" target="_blank"> <img
								src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_07.jpg"
								alt="GS 파워">
							</a>
						</div>

					</div>
					<div class="sponsorwrap">
						<strong> official sponsors </strong>
						<div class="imgl">
							<a href="http://www.shinhancard.com" target="_blank"> <img
								src="        https://www.fcseoul.com/resources/front/images/main/sponsor/img_08.jpg
                                                                "
								alt="신한카드">
							</a>
						</div>
						<div class="imgr">
							<a href="http://www.truefriend.com" target="_blank"> <img
								src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_09.jpg"
								alt="한국투자증권">
							</a>
						</div>
						<div class="imgl">
							<a href="http://www.kbinsure.co.kr" target="_blank"> <img
								src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_10.jpg"
								alt="KB손해보험">
							</a>
						</div>
						<div class="imgr">
							<a href="http://www.kbsec.com/go.able" target="_blank"> <img
								src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_11.jpg"
								alt="KB증권">
							</a>
						</div>
						<div class="imgl">
							<a href="http://www.nhqv.com/" target="_blank"> <img
								src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_12.jpg"
								alt="NH투자증권">
							</a>
						</div>
						<div class="imgr">
							<a href="http://www.uplus.co.kr" target="_blank"> <img
								src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_13.jpg
                                                                "
								alt="엘지유플러스">
							</a>
						</div>
						<div class="imgl">
							<a href="http://www.lgensol.com" target="_blank"> <img
								src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_14.jpg"
								alt="엘지 에너지솔루션">
							</a>
						</div>
						<div class="imgr">
							<a href="http://www.lgchem.com" target="_blank"> <img
								src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_15.jpg"
								alt="엘지화학">
							</a>
						</div>
					</div>
					<div class="sponsorwrap2">
						<strong> official kit supplier </strong>
						<div class="imgl">
							<a href="http://www.prospecs.com" target="_blank"> <img
								src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_16.jpg"
								alt="프로스펙스">
							</a>
						</div>
					</div>
					<div class="sponsorwrap3">
						<strong> ofiicial principal partners </strong>
						<div class="imgl">
							<a href="http://www.tmon.co.kr" target="_blank"> <img
								src="        https://www.fcseoul.com/resources/front/images/main/sponsor/img_18.jpg"
								alt="티몬">
							</a>
						</div>
						<div class="imgr">
							<a href="http://www.han-don.com" target="_blank"> <img
								src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_17.jpg?20230310"
								alt="한돈">
							</a>
						</div>
						<div class="imgl">
							<a href="http://www.keumyang.com" target="_blank"> <img
								src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_20.jpg?20230310"
								alt="1865">
							</a>
						</div>
						<div class="imgr">
							<a
								href="http://www.https://www.theclasshyosung.com/ko/desktop/passenger-cars.html"
								target="_blank"> <img
								src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_21.jpg"
								alt="더클래스 효성">
							</a>
						</div>
						<div class="imgl">
							<a href="http://www.heineken.com/nl" target="_blank"> <img
								src="        https://www.fcseoul.com/resources/front/images/main/sponsor/img_19.jpg"
								alt="하이네켄">
							</a>
						</div>
						<div class="imgr">
							<a href="http://www.hurom.co.kr/" target="_blank"> <img
								src="        https://www.fcseoul.com/resources/front/images/main/sponsor/img_22.jpg?20230310"
								alt="휴롬">
							</a>
						</div>
						<div class="imgl">
							<a href="http://www.https://www.fedex.com/ko-kr/home.html"
								target="_blank"> <img
								src="https://www.fcseoul.com/resources/front/images/main/sponsor/logo-37.jpg"
								alt="페덱스">
							</a>
						</div>
					</div>
					<div class="sponsorwrap">
						<strong> ofiicial partners </strong>
						<div class="imgl">
							<a href="http://seoultwotop.com/" target="_blank"> <img
								src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_25.jpg"
								alt="서울투탑정형외과 재활의학과">
							</a>
						</div>
						<div class="imgr">
							<a href="http://www.madisesang.com/" target="_blank"> <img
								src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_24.jpg"
								alt="마디세상병원">
							</a>
						</div>
						<div class="imgl">
							<a href="http://www.xn--9m1b22a80igvdu3q.kr/" target="_blank">
								<img
								src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_00.jpg"
								alt="더드림병원">
							</a>
						</div>
						<div class="imgr">
							<a href="https://www.seoul1hospital.com/" target="_blank"> <img
								src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_23.jpg?20230310"
								alt="서울원병원">
							</a>
						</div>
						<div class="imgl">
							<a href="https://www.redcap.co.kr/" target="_blank"> <img
								src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_27.jpg?20230310"
								alt="redcap투어">
							</a>
						</div>
						<div class="imgr">
							<a href="http://www.cocacola.co.kr/" target="_blank"> <img
								src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_28.jpg
                                                                "
								alt="코카콜라">
							</a>
						</div>
						<div class="imgl">
							<a href="https://amigonacho.com/" target="_blank"> <img
								src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_31.jpg"
								alt="아미고">
							</a>
						</div>
					</div>
				</div>
				<div style="clear: both;"></div>
			</section>
			<div class="contentwrap2">
				<div class="footer1">
					<div class="foot">
						<div class="pri">
							<a href="">개인정보처리방침</a>
						</div>
						<div class="pri1">
							<a href="">이용약관</a>
						</div>
						<div class="pri1">
							<a href="">이메일무단수집거부</a>
						</div>
						<div class="pri1">
							<a href="">사이트맵</a>
						</div>
						<div class="pri1">
							<a href="">윤리경영제보</a>
						</div>
						<div class="pri1">
							<a href="">마케팅 제휴문의</a>
						</div>
						<div class="pri2">
							<a href="https://www.fcseoul.com/vr/stadium" target="_blank">
								<img
								src="        https://www.fcseoul.com/resources/front/images/common/btn_vr.png"
								alt="경기장 vr 보기">
							</a>
						</div>
						<div class="pri2">
							<a href="http://www.youtube.com/user/FCSEOUL" target="_blank">
								<img
								src="https://www.fcseoul.com/resources/front/images/common/btn_sns3.png"
								alt="유튜브">
							</a>
						</div>
						<div class="pri2">
							<a href="https://instagram.com/fcseoul/" target="_blank"> <img
								src="https://www.fcseoul.com/resources/front/images/common/btn_sns2.png"
								alt="인스타그램">
							</a>
						</div>
						s
						<div class="pri2">
							<a href="https://www.facebook.com/fcseoul" target="_blank"> <img
								src="https://www.fcseoul.com/resources/front/images/common/btn_sns1.png"
								alt="페이스북">
							</a>
						</div>
					</div>
					<div style="clear: both;"></div>
				</div>
				<div class="footer2">
					<div class="foot1">
						<img
							src="https://www.fcseoul.com/resources/front/images/common/img_logo_gray.png"
							alt="FC SEOUL">
					</div>
					<div class="foot2">
						<ul>
							<li>대표자명 : 여은주</li>
							<li>대표전화 : 02-306-5050</li>
							<li>개인정보정책책임자 : 이재근</li>
							<li>서울시 마포구 월드컵로 240 서울월드컵경기장 내</li>
						</ul>
						<p>Copyright©2019 GS Sports Football Club Seoul</p>
					</div>
					<div class="foot3">
						<img
							src="https://www.fcseoul.com/resources/front/images/common/img_award.png">
					</div>
				</div>
			</div>
		</footer>
</body>
</html>