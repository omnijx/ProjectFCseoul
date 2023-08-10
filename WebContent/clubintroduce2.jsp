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
	<link rel="stylesheet" href="css/clubintro2.css">
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
    	$(function() {
			$(document).ready(function(){
				 $(".st1").click(function(){
						$(".yeartab li").removeClass("active");
						$(this).addClass("active");
						$(".yeartitle").css("display","none");
						$("#tab1").css("display","block");
						
					});
				$(".st2").click(function(){
					$(".yeartab li").removeClass("active");
					$(this).addClass("active");
					$(".yeartitle").css("display","none");
					$("#tab2").css("display","block");
					
				});
				$(".st3").click(function(){
					$(".yeartab li").removeClass("active");
					$(this).addClass("active");
					$(".yeartitle").css("display","none");
					$("#tab3").css("display","block");
					
				});
				$(".st4").click(function(){
					$(".yeartab li").removeClass("active");
					$(this).addClass("active");
					$(".yeartitle").css("display","none");
					$("#tab4").css("display","block");
					
				});
				$(".st5").click(function(){
					$(".yeartab li").removeClass("active");
					$(this).addClass("active");
					$(".yeartitle").css("display","none");
					$("#tab5").css("display","block");
					
				});
				
			});
		});
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
				<h3 class="h3">구단소개</h3>
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
					<li class="on">
						<a href="FcController?command=clubIntro2">구단 역사</a>
					</li>
					<li>
						<a href="FcController?command=clubIntro3">엠블럼</a>
					</li>
					<li>
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
				<h4>구단역사</h4>
			</div>
			<div class="history">
				<img alt="" src="	https://www.fcseoul.com/resources/front/images/sub/club/img_club_logo.jpg">
				<div class="histext">
					<strong> 아시아 최고의 클럽 ‘<span>FC서울</span>'이 되겠습니다. </strong>
					<p>
						팬을 위한 화끈한 공격축구와 흥미진진한 플레이로 정규리그와 리그컵 모두 정상에 올라 K리그를 평정함은 물론 한국프로스포츠 사상 단일 경기 
					<br/> 최다 관중 신기록을 비롯하여 각종 최다 관중 신기록을 수립하며 성적과 흥행
						모두에서 최고의 자리를 올랐습니다. 	
					<br/> 이제 명실상부한 한국 최고의 프로축구단으로서 반드시 아시아 정상에
						올라 K리그의 글로벌 위상을 드높이는데 최선을 다해 앞장설 것입니다.
					
					</p>
				</div>
			</div>
			<div class="ytab">
				<ul class="yeartab">
					<li class="active st1">2020s</li>
					<li class="st2">2010s</li>
					<li class="st3">2000s</li>
					<li class="st4">1990s</li>
					<li class="st5">1980s</li>
				</ul>
			</div>
			
			<div class="allhis">
				<div id="tab1" class="yeartitle" >
					<h5>2020~</h5>
					<div class="hisexplain">
						<div class="year">
							<p>20<span>22</span> </p>
						</div>
						<div class="yearlist">
							<ul>
								<li><p>제27회 하나원큐 FA컵 준우승</p></li>
								<li><p>K리그1 유소년클럽상 수상</p></li>
								<li><p>K리그1 유소년클럽상 수상</p></li>
							</ul>
						</div>
					</div>
					<div class="hisexplain">
						<div class="year">
							<p>20<span>21</span> </p>
						</div>
						<div class="yearlist">
							<ul>
								<li><p>안익수 감독 선임 (14대)</p></li>
								<li><p>K리그 유소년클럽상 수상</p></li>
							</ul>
						</div>
					</div>
					<div class="hisexplain">
						<div class="year">
							<p>20<span>20</span> </p>
						</div>
						<div class="yearlist">
							<ul>
								<li><p>박진섭 감독 선임 (13대)</p></li>
							</ul>
						</div>
					</div>
				</div>
				<!-- 2010 -->
				<div id="tab2" class="yeartitle" style="display: none;">
					<h5>2010~</h5>
					<div class="hisexplain">
						<div class="year">
							<p>20<span>19</span> </p>
						</div>
						<div class="yearlist">
							<ul>
								<li><p>K리그 30만 관중 돌파(관중수 1위 324,162명)</p></li>
								<li><p>K리그 관중 입장수익 1위, 관중 1인당 입장수익 1위</p></li>
								<li><p>K리그 풀스타디움상(평균 관중 17,061명)</p></li>
							</ul>
						</div>
					</div>
					<div class="hisexplain">
						<div class="year">
							<p>20<span>18</span> </p>
						</div>
						<div class="yearlist">
							<ul>
								<li><p>최용수 감독(12대) 취임</p></li>
							</ul>
						</div>
					</div>
					<div class="hisexplain">
						<div class="year">
							<p>20<span>17</span> </p>
						</div>
						<div class="yearlist">
							<ul>
								<li><p>K리그 최초 8년 연속 30만 관중 돌파(310,061명)</p></li>
								<li><p>K리그 페어플레이상</p></li>
								<li><p>K리그 풀스타디움상(평균 관중 16,319명)</p></li>
							</ul>
						</div>
					</div>
					<div class="hisexplain">
						<div class="year">
							<p>20<span>16</span> </p>
						</div>
						<div class="yearlist">
							<ul>
								<li><p>황선홍 감독(11대) 취임</p></li>
								<li><p>현대오일뱅크 K리그 클래식 우승</p></li>
								<li><p>제21회 KEB하나은행 FA컵 준우승</p></li>
								<li><p>2016 AFC챔피언스리그 4강</p></li>
								<li><p>K리그 단일 경기 최다 관중 기록 9위 달성(6월 18일 47,899명)</p></li>
								<li><p>K리그 최초 7년 연속 30만 관중 돌파</p></li>
								<li><p>K리그 감독상: 황선홍</p></li>
								<li><p>K리그 감독상: 황선홍</p></li>
								<li><p>FA컵 득점왕: 아드리아노(5골)</p></li>
								<li><p>K리그 베스트11 DF 고광민, 오스마르, FW 아드리아노</p></li>
								<li><p>K리그 최초 객단가 1만원 돌파(10,287원)</p></li>
								<li><p>K리그 풀스타디움상(평균 관중 18,007명)</p></li>
							</ul>
						</div>
					</div>
					<div class="hisexplain">
						<div class="year">
							<p>20<span>15</span> </p>
						</div>
						<div class="yearlist">
							<ul>
								<li><p>제20회 KEB하나은행 FA컵 우승</p></li>
								<li><p>AFC 클럽랭킹 K리그 1위(아시아 4위)</p></li>
								<li><p>K리그 최고 6년 연속 30만 관중 돌파</p></li>
								<li><p>구단 통산 1,500호 골 달성(4월 15일 대전전 득점자 김현성)</p></li>
								<li><p>K리그 최초 객단가 9천원 돌파(9,485원)</p></li>
								<li><p>K리그 경기당 평균 최다 유료관중 기록(14,846명)</p></li>
								<li><p>리그 특별상 오스마르(시즌 전 경기 풀타임)</p></li>
								<li><p>리그 베스트11 DF 차두리, FW 아드리아노)</p></li>
							</ul>
						</div>
					</div>
					<div class="hisexplain">
						<div class="year">
							<p>20<span>14</span> </p>
						</div>
						<div class="yearlist">
							<ul>
								<li><p>제19회 하나은행 FA컵 준우승</p></li>
								<li><p>AFC 챔피언스리그 4강</p></li>
								<li><p>K리그 최초 2년 연속 AFC 챔피언스리그 4강 진출</p></li>
								<li><p>AFC 클럽랭킹 K리그 1위(아시아 2위)</p></li>
								<li><p>K리그 역대 최다 관중 1~10위 석권(7월 12일 vs 수원 46,549명, K리그 역대 최다 관중 9위 기록)</p></li>
								<li><p>바이엘04 레버쿠젠 친선경기(7월 31일)</p></li>
								<li><p>K리그 페어플레이상</p></li>
								<li><p>리그 베스트11 DF 김주영, 차두리, MF 고명진</p></li>
							</ul>
						</div>
					</div>
					<div class="hisexplain">
						<div class="year">
							<p>20<span>13</span> </p>
						</div>
						<div class="yearlist">
							<ul>
								<li><p>AFC 챔피언스리그 준우승</p></li>
								<li><p>AFC 올해의 감독상 최용수</p></li>
								<li><p>K리그 통산 400승 달성</p></li>
								<li><p>리그 득점상 데얀(19골, 3년 연속 득점상), 도움상 몰리나(13도움, 2년 연속 도움상)</p></li>
								<li><p>리그 베스트11 DF 아디, MF 하대성, FW 데얀</p></li>
								<li><p>K리그 페어플레이상</p></li>
							</ul>
						</div>
					</div>
					<div class="hisexplain">
						<div class="year">
							<p>20<span>12</span> </p>
						</div>
						<div class="yearlist">
							<ul>
								<li><p>현대오일뱅크 K리그 우승</p></li>
								<li><p>K리그 단일 정규리그 최다 승점 신기록 수립(96점)</p></li>
								<li><p>K리그 단일 정규리그 최다 승수 신기록 수립(29승)</p></li>
								<li><p>K리그 3시즌 연속 최다 총관중 달성</p></li>
								<li><p>리그 감독상 최용수, MVP 데얀, 득점상 데얀(31골), 도움상 몰리나(19도움)</p></li>
								<li><p>베스트11 GK 김용대, DF 아디, MF 몰리나, 하대성, FW 데얀</p></li>
								<li><p>K리그 풀스타디움상(평균 관중 20,502명)</p></li>
							</ul>
						</div>
					</div>
					<div class="hisexplain">
						<div class="year">
							<p>20<span>11</span> </p>
						</div>
						<div class="yearlist">
							<ul>
								<li><p>황보관 감독(9대) 취임</p></li>
								<li><p>최용수 감독(10대) 취임</p></li>
								<li><p>AFC 챔피언스리그 8강</p></li>
								<li><p>구단 최다 7연승 신기록 수립</p></li>
								<li><p>K리그 최초 2시즌 연속 50만 총관중 달성</p></li>
								<li><p>리그 득점상 데얀(24골)</p></li>
								<li><p>리그 베스트11 MF 하대성, FW 데얀</p></li>
								<li><p>K리그 페어플레이상</p></li>
							</ul>
						</div>
					</div>
					<div class="hisexplain">
						<div class="year">
							<p>20<span>10</span> </p>
						</div>
						<div class="yearlist">
							<ul>
								<li><p>넬로 빙가다 감독(8대) 취임</p></li>
								<li><p>쏘나타 K리그 우승</p></li>
								<li><p>포스코컵 우승</p></li>
								<li><p>프로스포츠 단일 경기 최다 관중 신기록 수립(vs 성남, 5월 5일, 60,747명)</p></li>
								<li><p>K리그 단일 시즌 최다 총관중 신기록(546,397명)</p></li>
								<li><p>K리그 최다 홈 18연승 타이기록 수립</p></li>
								<li><p>리그 베스트11 GK 김용대, DF 최효진, 아디, FW 데얀</p></li>
								<li><p>K리그 특별상 김용대(시즌 전 경기 풀타임)</p></li>
							</ul>
						</div>
					</div>
				</div>
				<!-- 2010 -->
				<!-- 2000~2009 -->
				<div id="tab3" class="yeartitle" style="display: none;">
					<h5>2000~2009</h5>
					<div class="hisexplain">
						<div class="year">
							<p>20<span>09</span> </p>
						</div>
						<div class="yearlist">
							<ul>
								<li><p>AFC챔피언스리그 8강</p></li>
								<li><p>맨체스터 유나이티드 친선경기(7월 24일)</p></li>
								<li><p>베스트11 MF 기성용</p></li>
							</ul>
						</div>
					</div>
					<div class="hisexplain">
						<div class="year">
							<p>20<span>08</span> </p>
						</div>
						<div class="yearlist">
							<ul>
								<li><p>삼성 하우젠 K-리그 준우승</p></li>
								<li><p>LA갤럭시 친선경기(3월 1일)</p></li>
								<li><p>FC도쿄 친선경기(6월 15일)</p></li>
								<li><p>FC서울 25년사 발간</p></li>
								<li><p>신인상 이승렬</p></li>
								<li><p>베스트11 DF 아디, MF 이청용, 기성용</p></li>
							</ul>
						</div>
					</div>
					<div class="hisexplain">
						<div class="year">
							<p>20<span>07</span> </p>
						</div>
						<div class="yearlist">
							<ul>
								<li><p>세뇰 귀네슈 감독(7대) 취임</p></li>
								<li><p>삼성 하우젠컵 준우승</p></li>
								<li><p>프로스포츠 단일 경기 최다 관중 기록 수립(vs 수원, 4월 8일, 55,397명)</p></li>
								<li><p>맨체스터 유나이티드 친선경기(7월 20일)</p></li>
								<li><p>FC도쿄 친선경기(7월 26일, 도쿄)</p></li>
								<li><p>베스트11 DF 아디</p></li>
								<li><p>K리그 특별상 김병지(시즌 전 경기 풀타임)</p></li>
							</ul>
						</div>
					</div>
					<div class="hisexplain">
						<div class="year">
							<p>20<span>06</span> </p>
						</div>
						<div class="yearlist">
							<ul>
								<li><p>삼성 하우젠컵 우승</p></li>
								<li><p>구단 통산 1,000호골 달성(6월 3일 포항전 득점자 곽태휘)</p></li>
								<li><p>FC도쿄 친선경기(61,235명, 8월 5일)</p></li>
								<li><p>리그 특별상 김병지(시즌 전 경기 풀타임)</p></li>
								<li><p>베스트11 FW 김은중</p></li>
							</ul>
						</div>
					</div>
					<div class="hisexplain">
						<div class="year">
							<p>20<span>05</span> </p>
						</div>
						<div class="yearlist">
							<ul>
								<li><p>이장수 감독(6대) 취임</p></li>
								<li><p>보카 주니어스 친선경기(7월 26일)</p></li>
								<li><p>K리그 단일 시즌 최다 관중 신기록 수립(458,605명)</p></li>
								<li><p>도움상 히칼도(9도움), 신인상 박주영</p></li>
								<li><p>베스트11 FW 박주영</p></li>
							</ul>
						</div>
					</div>
					<div class="hisexplain">
						<div class="year">
							<p>20<span>04</span> </p>
						</div>
						<div class="yearlist">
							<ul>
								<li><p>서울 연고지 복귀</p></li>
								<li><p>구단 공식 명칭 ‘FC서울’로 변경 및 엠블럼 발표(3월 19일)</p></li>
								<li><p>GS스포츠 출범(6월 1일)</p></li>
								<li><p>베스트11 MF 김동진</p></li>
							</ul>
						</div>
					</div>
					<div class="hisexplain">
						<div class="year">
							<p>20<span>03</span> </p>
						</div>
						<div class="yearlist">
							<ul>
								<li><p>신인왕 정조국</p></li>
							</ul>
						</div>
					</div>
					<div class="hisexplain">
						<div class="year">
							<p>20<span>02</span> </p>
						</div>
						<div class="yearlist">
							<ul>
								<li><p>2001-2002 아시안 클럽 챔피언십 준우승</p></li>
							</ul>
						</div>
					</div>
					<div class="hisexplain">
						<div class="year">
							<p>20<span>01</span> </p>
						</div>
						<div class="yearlist">
							<ul>
								<li><p>포스데이타 수퍼컵 우승</p></li>
								<li><p>포스코 K-리그 준우승</p></li>
								<li><p>리그 베스트11 GK 신의손, DF 이영표</p></li>
								<li><p>리그 특별상 신의손(시즌 전 경기 풀타임)</p></li>
							</ul>
						</div>
					</div>
					<div class="hisexplain">
						<div class="year">
							<p>20<span>00</span> </p>
						</div>
						<div class="yearlist">
							<ul>
								<li><p>삼성 디지털 K-리그 우승</p></li>
								<li><p>리그 감독상 조광래, MVP 최용수, 도움상 안드레(10도움)</p></li>
								<li><p>리그 베스트11 GK 신의손, MF 안드레, FW 최용수</p></li>
							</ul>
						</div>
					</div>
				</div>
				<!-- 2000~2009 -->
				<!-- 1990~1999 -->
				<div id="tab4" class="yeartitle" style="display: none;">
					<h5>1999~1990</h5>
					<div class="hisexplain">
						<div class="year">
							<p>19<span>99</span> </p>
						</div>
						<div class="yearlist">
							<ul>
								<li><p>아디다스컵 준우승</p></li>
								<li><p>티켓링크 수퍼컵 준우승</p></li>
								<li><p>조광래 감독(5대) 취임</p></li>
								<li><p>제3회 삼보체인지업 FA컵 우승</p></li>
							</ul>
						</div>
					</div>
					<div class="hisexplain">
						<div class="year">
							<p>19<span>98</span> </p>
						</div>
						<div class="yearlist">
							<ul>
								<li><p>제3회 삼보체인지업 FA컵 우승</p></li>
								<li><p>제3대 허창수 구단주 취임</p></li>
							</ul>
						</div>
					</div>
					<div class="hisexplain">
						<div class="year">
							<p>19<span>97</span> </p>
						</div>
						<div class="yearlist">
							<ul>
								<li><p>제2회 FA컵 3위</p></li>
								<li><p>박병주 감독(4대) 취임</p></li>
							</ul>
						</div>
					</div>
					<div class="hisexplain">
						<div class="year">
							<p>19<span>96</span> </p>
						</div>
						<div class="yearlist">
							<ul>
								<li><p>안양 연고지 이전</p></li>
								<li><p>구단 공식 명칭 '안양 LG 치타스'로 변경</p></li>
							</ul>
						</div>
					</div>
					<div class="hisexplain">
						<div class="year">
							<p>19<span>95</span> </p>
						</div>
						<div class="yearlist">
							<ul>
								<li><p>프로축구 올해의 인기구단 선정(총관중 1위)</p></li>
								<li><p>리그 베스트11 MF 김판근</p></li>
							</ul>
						</div>
					</div>
					<div class="hisexplain">
						<div class="year">
							<p>19<span>94</span> </p>
						</div>
						<div class="yearlist">
							<ul>
								<li><p>아디다스컵 준우승</p></li>
								<li><p>조영증 감독(3대) 취임</p></li>
								<li><p>리그 득점상 윤상철(21골) 도움상 고정운(10도움) 신인상 최용수</p></li>
								<li><p>리그 베스트11 FW 윤상철</p></li>
							</ul>
						</div>
					</div>
					<div class="hisexplain">
						<div class="year">
							<p>19<span>93</span> </p>
						</div>
						<div class="yearlist">
							<ul>
								<li><p>한국프로축구대회 준우승</p></li>
								<li><p>도움상 윤상철(8도움), 감투상 윤상철</p></li>
								<li><p>베스트11 MF 김동해, FW 윤상철</p></li>
							</ul>
						</div>
					</div>
					<div class="hisexplain">
						<div class="year">
							<p>19<span>92</span> </p>
						</div>
						<div class="yearlist">
							<ul>
								<li><p>아디다스컵 준우승</p></li>
								<li><p>리그 득점상 임근재(10골)</p></li>
								<li><p>리그 베스트11 FW 임근재</p></li>
							</ul>
						</div>
					</div>
					<div class="hisexplain">
						<div class="year">
							<p>19<span>91</span> </p>
						</div>
						<div class="yearlist">
							<ul>
								<li><p>구단명칭 ‘LG치타스’로 변경(마스코트: 황소->치타)</p></li>
								<li><p>제2대 구본무 구단주 취임</p></li>
								<li><p>리그 베스트11 MF 이영진</p></li>
							</ul>
						</div>
					</div>
					<div class="hisexplain">
						<div class="year">
							<p>19<span>90</span> </p>
						</div>
						<div class="yearlist">
							<ul>
								<li><p>90 한국프로축구대회 우승</p></li>
								<li><p>서울 연고지 이전</p></li>
								<li><p>리그 감독상 고재욱, MVP 최진한, 득점상 윤상철(12골), 도움상 최대식(7도움), 감투상 최태진</p></li>
								<li><p>리그 베스트11 DF 최영준, 최태진, MF 최진한, 최대식, FW 윤상철</p></li>
							</ul>
						</div>
					</div>
				</div>
				<div id="tab5" class="yeartitle" style="display: none;">
					<h5>1989~1983</h5>
					<div class="hisexplain">
						<div class="year">
							<p>19<span>89</span> </p>
						</div>
						<div class="yearlist">
							<ul>
								<li><p>한국프로축구대회 준우승</p></li>
								<li><p>고재욱 감독(2대) 취임</p></li>
								<li><p>리그 골키퍼상: 차상광</p></li>
								<li><p>리그 베스트11 GK 차상광, DF 이영익, FW 윤상철</p></li>
							</ul>
						</div>
					</div>
					<div class="hisexplain">
						<div class="year">
							<p>19<span>88</span> </p>
						</div>
						<div class="yearlist">
							<ul>
								<li><p>제6회 홍콩 구정컵 3위</p></li>
								<li><p>제 43회 전국축구선수권대회 우승</p></li>
								<li><p>리그 감투상 최진한</p></li>
								<li><p>리그 베스트11 MF 최진한</p></li>
							</ul>
						</div>
					</div>
					<div class="hisexplain">
						<div class="year">
							<p>19<span>87</span> </p>
						</div>
						<div class="yearlist">
							<ul>
								<li><p>제 1회 윈풀라이컵 준우승</p></li>
								<li><p>리그 베스트11 DF: 구상범</p></li>
							</ul>
						</div>
					</div>
					<div class="hisexplain">
						<div class="year">
							<p>19<span>86</span> </p>
						</div>
						<div class="yearlist">
							<ul>
								<li><p>축구대제전 준우승</p></li>
								<li><p>리그 도움상: 강득수(8도움), 골키퍼상 김현태</p></li>
								<li><p>리그 베스트11 GK 김현태, DF 조영증, MF 조민국</p></li>
							</ul>
						</div>
					</div>
					<div class="hisexplain">
						<div class="year">
							<p>19<span>85</span> </p>
						</div>
						<div class="yearlist">
							<ul>
								<li><p>축구대제전 수퍼리그 우승</p></li>
								<li><p>리그 감독상 박세학, MVP 한문배, 득점상 피아퐁(12골), 도움상 피아퐁(6도움) 골키퍼상 김현태</p></li>
								<li><p>리그 베스트11 GK 김현태, DF 한문배, MF 박항서, FW 피아퐁, 강득수</p></li>
							</ul>
						</div>
					</div>
					<div class="hisexplain">
						<div class="year">
							<p>19<span>84</span> </p>
						</div>
						<div class="yearlist">
							<ul>
								<li><p>프로리그 참가</p></li>
								<li><p>연고지 : 충청도</p></li>
								<li><p>리그 모범상: 조영증, 베스트 11 MF: 조영증</p></li>
							</ul>
						</div>
					</div>
					<div class="hisexplain">
						<div class="year">
							<p>19<span>83</span> </p>
						</div>
						<div class="yearlist">
							<ul>
								<li><p>럭키금성 황소 축구단 창단(12월 22일) - 국내 프로축구단 제 5호</p></li>
								<li><p>초대 구단주 : 구자경, 초대 감독 : 박세학</p></li>
							</ul>
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