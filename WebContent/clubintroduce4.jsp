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
	<link rel="stylesheet" href="css/clubintro4.css">
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
	});
	$(function () {
       $(document).ready(function(){
	        $(".slider").bxSlider({
	        	
	        });
       
           $(".mslide").bxSlider({
           		
           });
          
           $(".slide3").bxSlider({
           	
           }); 
         });   
	});
    </script>
    <script>
		let v1 = false;
		let v2 = false;
		$(function(){
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
			
			$(document).ready(function(){
  				var currentPosition = parseInt($(".sidebar").css("top"));
  			 	$(window).scroll(function() {
  			    	var position = $(window).scrollTop(); 
  			    	$(".sidebar").stop().animate({"top":position+currentPosition+"px"},700);
  			  	});
  			});
			$(document).ready(function() {
				$(document).on("click",".sbtn",function(){
					$(".sbtn").removeClass("snsbutton");
					$(this).parent().find(".sbtn").addClass("snsbutton");
				});
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
	<div class="ticketbox">
		<span> <img alt="k리그 로고" src="https://files.fcseoul.com/multi01/Match/League/1673574666175.png"> </span>
		<strong>2023.06.11(일) 18:00</strong>
		<span>서울월드컵경기장</span>
		<div class="matchinfo">
			<div class="mi1">
				<div class="home">
					<img alt="fc서울로고" src="https://fcseoulpub.s3.ap-northeast-2.amazonaws.com/multi01/Club/Club/1675316444376.png">
					<p>FC 서울</p>
				</div>
				<div class="vs"> 
					<p>VS</p>
				</div>
				<div class="away">
					<img alt="포항로고" src="https://fcseoulpub.s3.ap-northeast-2.amazonaws.com/multi01/Club/Club/em_K03.png">
					<p>포항</p>
				</div>
				</div>
		</div>
		<div class="ticketbtn">
			<a href="">티켓예매</a>
		</div>
	</div>
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
									CLUB</button>
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
									구단 소개</button>
								<ul id="buttonUI2" class = button123 style="display: none;">
									<li><a href="http://localhost:9080/FCseoul/MatchInfo.html">티켓 예매</a>
									</li>
									<li><a href="http://localhost:9080/FCseoul/rankingList.html">시즌티켓</a>
									</li>
									<li><a href="http://localhost:9080/FCseoul/rankingList.html">단체 입장권</a>
									</li>
									<li><a href="http://localhost:9080/FCseoul/rankingList.html">1865 스카이박스</a>
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
			<div class="sns1">
			
			<div class="fctab">
				<ul class="tab">
					<li>
						<a href="FcController?command=clubIntro">인사말</a>
					</li>
					<li>
						<a href="FcController?command=clubIntro2">구단 역사</a>
					</li>
					<li>
						<a href="FcController?command=clubIntro3">엠블럼</a>
					</li>
					<li class="on">
						<a href="FcController?command=clubIntro4">응원안내</a>
					</li>
					<li>
						<a href="FcController?command=clubIntro5">마스코트</a>
					</li>
					<li>
						<a href="FcController?command=clubIntro6">홈경기장</a>
					</li>
					<li>
						<a href="FcController?command=clubIntro7">클럽훈련장</a>
					</li>
					<li>
						<a href="FcController?command=clubIntro8">프런트</a>
					</li>
				</ul>
			</div>
			
			<div class="htitle">
				<h4>응원안내</h4>
				<span>FC서울 경기를 가장 신나게 관람하는 방법! FC서울 승리를 위해 신나게 응원해 보세요~</span>
			</div>
			
			<div>
				<ul class="info">
					<li class="active"><a>응원존</a></li>
					<li><a href="FcController?command=clubIntro4Music">응원가</a></li>
					<li><a href="FcController?command=clubIntro4Suport">서포터즈</a></li>
				</ul>
				
				<div class="zone">
					<strong>응원존이란?</strong>
					<p>
						경기장 동쪽 일반석에 위치한 응원존은 경기와 신나는 응원을 동시에 즐길 수 있는 구역입니다.
						미모와 화려한 댄스를 겸비한 V걸스, 그리고 귀여운 마스코트 씨드와 함께 뛰어 놀고
						싶으시다면 FC서울 응원존으로 오세요! 잊지 못할 추억을 만들어드리겠습니다.
					</p>
				</div>
				<div class="seat">
					<img alt="" src="https://www.fcseoul.com/resources/front/images/sub/club/img_club_seat.jpg">
				</div>
				<img class="i" alt="" src="https://www.fcseoul.com/resources/front/images/sub/club/img_club.jpg">
				<div class="tic"><a href="">응원존 티켓 예매하기</a></div>
				
			</div>
			<div class="htitle">
				<h4>FC서울 응원존 미리보기</h4>
			</div>
			<div class="tube">
				<div>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/laluUpTPd0M" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
					<div class="tubetex">V맨, V걸스와 함께 즐기는 신나는 <span>FC서울 응원존</span> </div>
				</div>
				<div>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/PHNTTzhJLhI" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
					<div class="tubetex">응원존의 주인공,<span>V걸스의 하루</span> </div>
				</div>
				<div class="tube2">
					<iframe width="560" height="315" src="https://www.youtube.com/embed/WgBK7GZcL2g" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
					<div class="tubetex">경기가 끝나도 뜨거움은 계속된다 <span>“FC서울 EDM PARTY”</span> </div>
				</div>
				<div class="tube2">
					<iframe width="560" height="315" src="https://www.youtube.com/embed/MrgUf0NIsRE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
					<div class="tubetex">FC서울 아나운서 & V팀<span>생생 화보촬영</span> </div>
				</div>
			</div>
			
			<div class="ana">
				<p>
					<strong>FC서울의 목소리! <span>장내 아나운서!</span> </strong><br/>
					경기장에 울려 퍼지는 든든한 목소리의 주인공! <br/>
					환상의 호흡을 자량하는 FC서울의 장내 아나운서를 소개합니다.
				</p>
			</div>
			<div class="htitle">
				<h4>장내 아나운서/이벤트MC</h4>
			</div>
			<div class="anainfo">
				<div class="ai">
					<img alt="" src="https://www.fcseoul.com/resources/front/images/sub/club/img_kks.jpg">
					<div class="in">
						<p class="ananame">고경섭</p>
						<div class="aa">
							<div class="a1">
							<p>별명</p>
							<p>취미</p>
							<p>매력포인트</p>
							<p>시즌각오</p>
							</div>
							<div class="a2">
								<p>  푸뚱^^</p>
								<p> 걷기, 여행, 전통시장 투어</p>
								<p> 신뢰감 있는 목소리, 편안함</p>
								<p>오늘이 처음이자 마지막 같은 마음으로 FC서울과 <br>
									동고동락하는 서울의 목소리가 되겠습니다.!
								</p>
							</div>
						</div>
					</div>
				</div>
				<div class="ai">
					<img alt="" src="https://www.fcseoul.com/resources/front/images/sub/club/img_mch.jpg">
					<div class="in">
						<p class="ananame">MC휘(장용휘)</p>
						<div class="aa">
							<div class="a1">
							<p>별명</p>
							<p>취미</p>
							<p>매력포인트</p>
							<p>시즌각오</p>
							</div>
							<div class="a2">
								<p> 북광남(북측광장의 남자)</p>
								<p> 토크</p>
								<p> 해맑음</p>
								<p>FC서울의 모든 팬과 친구되기!</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="ana">
				<p>
					<strong>FC서울의 에너지! <span>응원단!</span> </strong><br/>
					여러분의 신나는 응원을 책임지겠습니다! <br/>
					미모와 실력을 겸비한 FC서울 응원단을 소개합니다.
				</p>
			</div>
			<div class="htitle">
				<h4>V-GIRLS</h4>
			</div>
			
			<div class="cheer">
				<div class="cher2">
					<div class="cheerinfo">
						<img alt="" src="https://www.fcseoul.com/resources/front/images/sub/club/img_vgirl01.jpg">
						<div class="cheerinfo2">
							<p class="cname">이나경</p>
							<div class="c1">
								<p>생년월일</p>
								<p>신장</p>
								<p>별명</p>
								<p>취미</p>
								<p>매력포인트</p>
							</div>
							<div class="c2">
								<p>02월 01일</p>
								<p>168cm</p>
								<p>나자</p>
								<p>게임</p>
								<p>꼬부기웃음</p>
							</div>
						</div>
					</div>
					<div class="cheerinfo">
						<img alt="" src="https://www.fcseoul.com/resources/front/images/sub/club/img_vgirl02.jpg">
						<div class="cheerinfo2">
							<p class="cname">서현숙</p>
							<div class="c1">
								<p>생년월일</p>
								<p>신장</p>
								<p>별명</p>
								<p>취미</p>
								<p>매력포인트</p>
							</div>
							<div class="c2">
								<p>04월 22일</p>
								<p>168cm</p>
								<p>쑤기</p>
								<p>게임</p>
								<p>금발 단발</p>
							</div>
						</div>
					</div>
				</div>
				<div class="cher2">
					<div class="cheerinfo">
						<img alt="" src="	https://www.fcseoul.com/resources/front/images/sub/club/img_vgirl03.jpg">
						<div class="cheerinfo2">
							<p class="cname">천온유</p>
							<div class="c1">
								<p>생년월일</p>
								<p>신장</p>
								<p>별명</p>
								<p>취미</p>
								<p>매력포인트</p>
							</div>
							<div class="c2">
								<p>11월 15일</p>
								<p>170cm</p>
								<p>천태풍</p>
								<p>컴퓨터게임</p>
								<p>일자다리</p>
							</div>
						</div>
					</div>
					<div class="cheerinfo">
						<img alt="" src="	https://www.fcseoul.com/resources/front/images/sub/club/img_vgirl04.jpg">
						<div class="cheerinfo2">
							<p class="cname">정희정</p>
							<div class="c1">
								<p>생년월일</p>
								<p>신장</p>
								<p>별명</p>
								<p>취미</p>
								<p>매력포인트</p>
							</div>
							<div class="c2">
								<p>01월 17일</p>
								<p>167cm</p>
								<p>까불이</p>
								<p>영화보기</p>
								<p>히덩이</p>
							</div>
						</div>
					</div>
				</div>
				<div class="cher2">
					<div class="cheerinfo">
						<img alt="" src="	https://www.fcseoul.com/resources/front/images/sub/club/img_vgirl06.jpg">
						<div class="cheerinfo2">
							<p class="cname">이다영</p>
							<div class="c1">
								<p>생년월일</p>
								<p>신장</p>
								<p>별명</p>
								<p>취미</p>
								<p>매력포인트</p>
							</div>
							<div class="c2">
								<p>02월 02일</p>
								<p>170cm</p>
								<p>다염</p>
								<p>음악듣기</p>
								<p>개미허리</p>
							</div>
						</div>
					</div>
					<div class="cheerinfo">
						<img alt="" src="https://www.fcseoul.com/resources/front/images/sub/club/img_vgirl05.jpg">
						<div class="cheerinfo2">
							<p class="cname">박성은</p>
							<div class="c1">
								<p>생년월일</p>
								<p>신장</p>
								<p>별명</p>
								<p>취미</p>
								<p>매력포인트</p>
							</div>
							<div class="c2">
								<p>02월 16일</p>
								<p>168cm</p>
								<p>바넬로피(주먹왕랄프 여주인공)</p>
								<p>넷플릭스 보기</p>
								<p>큰 눈</p>
							</div>
						</div>
					</div>
				</div>
				<div class="cher2">
					<div class="cheerinfo">
						<img alt="" src="	https://www.fcseoul.com/resources/front/images/sub/club/img_vgirl08.jpg">
						<div class="cheerinfo2">
							<p class="cname">고가빈</p>
							<div class="c1">
								<p>생년월일</p>
								<p>신장</p>
								<p>별명</p>
								<p>취미</p>
								<p>매력포인트</p>
							</div>
							<div class="c2">
								<p>11월 02일</p>
								<p>167cm</p>
								<p>가비, 갑니</p>
								<p>노래듣기</p>
								<p>눈웃음</p>
							</div>
						</div>
					</div>
					<div class="cheerinfo">
						<img alt="" src="https://www.fcseoul.com/resources/front/images/sub/club/img_vgirl07.jpg">
						<div class="cheerinfo2">
							<p class="cname">안혜지</p>
							<div class="c1">
								<p>생년월일</p>
								<p>신장</p>
								<p>별명</p>
								<p>취미</p>
								<p>매력포인트</p>
							</div>
							<div class="c2">
								<p>10월 20일</p>
								<p>174cm</p>
								<p>혜자</p>
								<p>드라마보기</p>
								<p>롱다리</p>
							</div>
						</div>
					</div>
				</div>
				<div class="cher2">
					<div class="cheerinfo">
						<img alt="" src="	https://www.fcseoul.com/resources/front/images/sub/club/img_vgirl09.jpg">
						<div class="cheerinfo2">
							<p class="cname">김수현</p>
							<div class="c1">
								<p>생년월일</p>
								<p>신장</p>
								<p>별명</p>
								<p>취미</p>
								<p>매력포인트</p>
							</div>
							<div class="c2">
								<p>02월 01일</p>
								<p>167cm</p>
								<p>수하니</p>
								<p>게임</p>
								<p>반전매력</p>
							</div>
						</div>
					</div>
					<div class="cheerinfo">
						<img alt="" src="https://www.fcseoul.com/resources/front/images/sub/club/img_vgirl10.jpg">
						<div class="cheerinfo2">
							<p class="cname">김수현</p>
							<div class="c1">
								<p>생년월일</p>
								<p>신장</p>
								<p>별명</p>
								<p>취미</p>
								<p>매력포인트</p>
							</div>
							<div class="c2">
								<p>06월 25일</p>
								<p>167cm</p>
								<p>쪼꼬미</p>
								<p>드라마 몰아보기</p>
								<p>비글미</p>
							</div>
						</div>
					</div>
				</div>
				
			</div>
			
			<div class="mas">
				<div>
					<div class="htitle">
						<h4>MASCOT (씨드)</h4>
					</div>
					<div class="cheerinfo">
						<img alt="" src="https://www.fcseoul.com/resources/front/images/sub/club/img_mascot01.jpg">
						<div class="cheerinfo2">
							<p class="cname">씨드</p>
							<div class="c2">
								<p>
									안녕하세요! 외계인 씨드에요. <br>
									팬 분들이 저를 많이 무서워해서 슬퍼요.<br>
									올해 팬 여러분들과 함께 호흡하며<br>
									서울의 승리를 외칠게요!<br>
									저 많이 사랑해주세요!!
								</p>
							</div>
						</div>
					</div>
				</div>
				<div>
					<div class="htitle">
						<h4>서울이</h4>
					</div>
					<div class="cheerinfo">
						<img alt="" src="	https://www.fcseoul.com/resources/front/images/sub/club/img_mascot02.jpg">
						<div class="cheerinfo2">
							<p class="cname">서울이</p>
							<div class="c2">
								<p>
									안녕하세요! <br>
									씨드와 함께 서울을 응원하는 서울이에요!<br>
									올 한해도 팬 여러분들과 함께 서울을 응원할게요!<br>
									저랑 씨드 많이 사랑해주세요!<br>
								</p>
							</div>
						</div>
					</div>
				</div>
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