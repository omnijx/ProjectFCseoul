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
	String faqPage = (String)request.getAttribute("faqPage");
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
<link rel="shortcut icon" type="image/x-icon" href="https://fcseoulpub.s3.ap-northeast-2.amazonaws.com/multi01/Club/Club/1675316444376.png">
<script src="js/jquery-3.7.0.min.js"></script>
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

		$(".FAQtab .tabs li").removeClass("active");
		$(".container > div").css("display","none");
		$(".<%=faqPage%>").addClass("active");
		$("#<%=faqPage%>").css("display","block");
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
			$(".FAQtab dl dt").click(function() {
				if ($(this).hasClass("on")) {
					$(".FAQtab dl dt").removeClass("on");
					$(this).removeClass("on");
				} else {
					$(".FAQtab dl dt").removeClass("on");
					$(this).addClass("on");
				}
			});
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
<link rel="stylesheet" href="css/FAQ.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<title>FC SEOUL</title>
</head>
<body>
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
	<main>
		<section class="bannertop">
				<div class="container">
					<h2>FAN ZONE</h2>
				</div>
				<div class="contentButton">
					<div class="content">
						<ul>
							<li class="home"><a href="https://www.fcseoul.com/"></a></li>
							<li>
								<button class="button">
									FAN ZONE</button>
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
									FAQ</button>
								<ul id="buttonUI2" class = button123 style="display: none;">
									<li><a href="http://localhost:9080/FCseoul/MatchInfo.html">공식 SNS</a>
									</li>
									<li><a href="http://localhost:9080/FCseoul/rankingList.html">소셜게시판</a>
									</li>
									<li><a href="http://localhost:9080/FCseoul/rankingList.html">FAQ</a>
									</li>
									<li><a href="http://localhost:9080/FCseoul/rankingList.html">Q&A</a>
									</li>
									<li><a href="http://localhost:9080/FCseoul/rankingList.html">이벤트 ZONE</a>
									</li>
									<li><a href="http://localhost:9080/FCseoul/rankingList.html">FC서울 승리버스</a>
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
				<h3 class="h3">FAQ</h3>
				<div class="right">
					<button type="button">URL 복사</button>
				</div>
			</section>
			<section>
				<div class = "boxSearch">
					<form method = "get">
						<input type="text" name="searchValue" placeholder="자주 묻는 질문을 검색해보세요." value="">
						<input type = "submit" value = "검색">
					</form>
				</div>
				<div class = "FAQtab">
					<ul class = "tabs">
						<li class = "t1 active">
							<a href = "FcController?command=faq&page=t1">FC서울 경기 관련 문의</a>
						</li>
						<li class = "t2">
							<a href = "FcController?command=faq&page=t2">티켓 및 입장 관련 문의</a>
						</li>
						<li class = "t3">
							<a href = "FcController?command=faq&page=t3">멤버십 관련 문의</a>
						</li>
						<li class = "t4">
							<a href = "FcController?command=faq&page=t4">교통 관련 문의</a>
						</li>
						<li class = "t5">
							<a href = "FcController?command=faq&page=t5">기타 문의</a>
						</li>
					</ul>
					<div class = "container">
						<div id="t1">
						<div class = "faqWrap">
							<dl>
								<dt>경기는 몇 시간 동안 진행되나요?</dt>
								<dd>
									<div>
										<p>대략 2시간 정도라고 생각하면 됩니다.</p>
									</div>
								</dd>
							</dl>
							<dl>
								<dt>재입장 가능한가요?</dt>
								<dd>
									<div>
										<p>재입장은 입장게이트의 안내요원에 안내에 따라주시길 바랍니다.</p>
									</div>
								</dd>
							</dl>
							<dl>
								<dt>경기장 입장 시간은?</dt>
								<dd>
									<div>
										<p>경기 시작 2시간 전부터 가능합니다.</p>
									</div>
								</dd>
							</dl>
							<dl>
								<dt>비가 와도 경기가 진행되나요?</dt>
								<dd>
									<div>
										<p>우천 시에도 경기는 취소되지 않으며 경기장 한 가운데만 뚫려있고, 가장자리는 둥그렇게 지붕이
											덮여있어서 아주 앞쪽 자리만 아니면 비를 안 맞고 경기 관람 가능합니다.</p>
									</div>
								</dd>
							</dl>
						</div>
						<div class = "pageNumber">
							<a href = ""></a>
							<a href = "" class = "on">1</a>
							<a href = ""></a>
						</div>
						</div>
						<div id="t2">
						<div class = "faqWrap">
							<dl>
								<dt>경기장 반입이 금지된 물건은 무엇인가요?</dt>
								<dd>
									<div>
										<p>
											<span>경기장 안전 가이드라인에 따라 장내 반입금지물은 아래와 같습니다.</span>
										</p>
										</br>
										<p>
											<span>- 정치, 종교, 인종차별, 허가받지 않은 선전물 등 개인이나 단체의 경기 외적인
												주의, 주장 및 이익을 위한 표현물</span>
										</p>
										<p>
											<span>- 연맹 또는 상대팀을 비방하기 위한 공격적인 표현물</span>
										</p>
										<p>
											<span>- 상업적, 개인의 이익을 위한 목적의 전자기기</span>
										</p>
										<p>
											<span>- 무기류, 화기류, 화약류, 인화성 물질</span>
										</p>
										<p>
											<span>- 마약류, 생화학물질, 유독성 물질</span>
										</p>
										<p>
											<span>- 일체의 알코올류 (공식판매업자가 장내에서 판매하는 경우만 허용)</span>
										</p>
										<p>
											<span>- 유리병, 캔류, 600ml 초과 PET병 (단, 연맹 및 구단이 인정하는 개인음료
												보관 용기는 반입 허용)</span>
										</p>
										<p>
											<span>- 정상적인 경기관람에 방해를 주는 물품 (대형풍선 등)</span>
										</p>
										<p>
											<span>- 파편이 생기거나 매우 단단한 물질</span>
										</p>
										<p>
											<span>- 애완동물</span>
										</p>
										<p>
											<span>- 원활한 경기진행을 방해하는 물품</span>
										</p>
										<p>
											<span>- 기타 안전에 지장을 초래할 것으로 판단하여 연맹과 구단이 정한 물품</span>
										</p>
									</div>
								</dd>
							</dl>
							<dl>
								<dt>티켓 예매는 언제 열리나요?</dt>
								<dd>
									<div>
										<p>2022시즌 FC서울의 홈경기 티켓 예매는 경기일 5일 전 18시에 정식 오픈됩니다(예매일이
											경기일과 겹치는 경우 등 예외 시 별도 공지).</p>
									</div>
								</dd>
							</dl>
							<dl>
								<dt>무료입장 대상자</dt>
								<dd>
									<div>
										<p>복지등급이 중증(1,2,3급) 장애인 분들은 동반 1인까지 무료 입장가능(복지카드 지참),나머지
											등급 할인헤택이나 무료입장 불가</p>
										<br />
										<p>36개월 미만 영유아 무료입장 가능(좌석 점유 시 티켓 구매하셔야 합니다)</p>
										<p>국방부소속 현역 군인들: 군 신분증, 휴가증, 외출증 지참 시 동반 1인까지
											무료입장가능(사회복무요원은 불가능-행정안전부 소속)</p>
										<p>경찰들: 경찰공무원증 제시 시 동반 1인까지 무료입장 가능</p>
										<p>모두 일반석에 한해서 가능</p>
									</div>
								</dd>
							</dl>
							<dl>
								<dt>임원동호회 카드?</dt>
								<dd>
									<div>
										<p>서측 6번 게이트 앞에서 표를 나눠 드립니다. 카드 소지자와 동반 1인에게 배부합니다.</p>
									</div>
								</dd>
							</dl>
						</div>
						<div class = "pageNumber">
							<a href = ""></a>
							<a href = "" class = "on">1</a>
							<a href = ""></a>
						</div>
						</div>
						<div id = "t3">
							<div class="faqWrap">
								<dl>
									<dt>예매 결제 창에서 신용카드 선택이 안 돼요</dt>
									<dd>
										<div>
											<p>예매를 하시려면, FC서울 멤버십 카드를 꼭~! 가입하셔야 합니다.</p>
											<p>&nbsp;</p>
											<p>그래서 결제창에 보시면</p>
											<p>&nbsp;</p>
											<p>1. 적립 선택</p>
											<p>2. 결제수단 선택 (신용카드, 무통장 입금, 포인트 결제)</p>
											<p>&nbsp;</p>
											<p>중 선택을 하게 되는데,</p>
											<p>멤버십 카드 적립 인증을 하기 전까지는 신용카드를 선택하실 수 없습니다.</p>
										</div>
									</dd>
								</dl>
								<dl>
									<dt>아이핀 가입자라 멤버십이 안 돼요</dt>
									<dd>
										<div>
											<p>FC서울 멤버십 카드는</p>
											<p>GS&amp;POINT&nbsp;제휴 카드입니다.</p>
											<p>&nbsp;</p>
											<p>GS&amp;POINT는 아이핀으로 가입이 불가능하십니다.</p>
											<p>&nbsp;</p>
											<p>그러므로,</p>
											<p>FC서울 홈페이지를 아이핀으로 가입하신 고객님이</p>
											<p>멤버십 가입을 하시려면,</p>
											<p>&nbsp;</p>
											<p>기존 아이디를 탈퇴하신 뒤에 새로 주민번호로 가입을 하셔서</p>
											<p>멤버십 가입을 해 주셔야 합니다.</p>
											<p>&nbsp;</p>
											<p>관련하여 신청을 하실 때는</p>
											<p>&nbsp;</p>
											<p>1. 멤버십 Q&amp;A란에</p>
											<p>[아이핀 관련 재가입신청]으로 말머리를 달고 글 내용에</p>
											<p>성명, 전화번호, 아이디, 비밀번호를 남겨 주시면</p>
											<p>&nbsp;</p>
											<p>2. 구단에서 해당 아이디를 삭제 처리한 후, 연락을 드리겠습니다.</p>
											<p>&nbsp;</p>
											<p>3. 그 후에, 주민번호로 재 가입 하시고, 멤버십 가입을 진행 해 주시면 되겠습니다.</p>
											<p>&nbsp;</p>
										</div>
									</dd>
								</dl>
								<dl>
									<dt>적립이 제대로 안 되었어요~!</dt>
									<dd>
										<div>
											<p>현장이나 예매, 온라인 상 물품 결재시,</p>
											<p>적립에 오류가 있는 경우가 있습니다.</p>
											<p>&nbsp;</p>
											<p>영수증과 카드번호, 성함, 주민번호를 멤버십 Q&amp;A 란에</p>
											<p>비공개로 넣어 주시면&nbsp;개별 적립 처리를 해 드립니다.</p>
											<p>&nbsp;</p>
											<p>개별&nbsp;적립은 열흘에서 보름 정도가 걸립니다.</p>
											<p>감사합니다.</p>
										</div>
									</dd>
								</dl>
								<dl>
									<dt>포인트 사용(적립) 하려는데 비밀번호가 뭐죠?</dt>
									<dd>
										<div>
											<p>안녕하십니까.</p>
											<p>&nbsp;</p>
											<p>FC서울 GS&amp;POINT카드 사용시 비밀번호는</p>
											<p>가입시 기입한 명의자의 생일 네자리입니다.</p>
											<p>&nbsp;</p>
											<p>예시. 4월 1일&nbsp;&nbsp;&nbsp; -&nbsp;&nbsp; 0401</p>
											<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												12월5일&nbsp;&nbsp;&nbsp; -&nbsp;&nbsp; 1205</p>
											<p>&nbsp;</p>
										</div>
									</dd>
								</dl>
								<dl>
									<dt>GS&amp;POINT 홈페이지 가입에 관해.</dt>
									<dd>
										<div>
											<p>우선 한 가지 유념하셔야 할 것은,</p>
											<p>FC서울 보너스 GS&amp;POINT 카드는 반드시 FC서울 홈페이지에서 가입 및 카드 등록을
												먼저</p>
											<p>하셔야 된다는 점입니다.</p>
											<p>&nbsp;</p>
											<p>FC서울 홈페이지에서는 전체 누적 포인트 조회까지만 조회하실 수 있으며,</p>
											<p>FC서울 홈페이지에 가입 하신 뒤, GS&amp;POINT 홈페이지에 가입하시면 전체 가지고 있는
												카드를 조회할 수 있고</p>
											<p>자세한 적립 내역을 확인하실 수 있습니다.</p>
											<p>&nbsp;</p>
											<p>기존에 GS&amp;POINT 카드를 보유하고 계셨으며, FC서울 보너스 카드를 새로 발급 받으신
												분은</p>
											<p>FC서울 홈페이지에서 가입을 완료하시면, 자동으로 기존 갖고 계신 GS&amp;POINT 아이디에</p>
											<p>FC서울 보너스 카드가 새로 등록이 됩니다.</p>
											<p>&nbsp;</p>
										</div>
									</dd>
								</dl>
								<dl>
									<dt>나는 원래 GS &amp;POINT 카드가 있어요.</dt>
									<dd>
										<div>
											<p>FC서울 보너스 카드는 GS&amp;POINT의 일종입니다.</p>
											<p>&nbsp;</p>
											<p>다만 일반 여타 GS&amp;POINT 카드와 다른 적립율이 FC서울 관련 상품에서 적용됩니다.</p>
											<p>주유소, 편의점 등 일반 GS 가맹점에서 사용하실 때에는 같은 적립율을 경험하실 수 있습니다.</p>
											<p>&nbsp;</p>
											<p>&nbsp;</p>
											<p>
												<span style="COLOR: #ff0000">GS&amp;POINT 카드는 한 명의
													명의로 여러개의 카드를 소유할 수 있으며,</span>
											</p>
											<p>
												<span style="COLOR: #ff0000">포인트는 통합되어 사용됩니다.</span>
											</p>
											<p>&nbsp;</p>
											<p>ex. 홍길동 씨가 GS칼텍스 GS&amp;POINT카드로 500P 적립 + FC서울 보너스
												카드로 경기 관람하며 500P 적립</p>
											<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 홍길동씨 1,000 P 보유.&nbsp;</p>
										</div>
									</dd>
								</dl>
								<dl>
									<dt>FC서울 온라인 예매, 쇼핑몰, 온라인 시즌티켓 구매시 포인트 사용/적립</dt>
									<dd>
										<div>
											<p>&nbsp;</p>
											<p>FC서울 보너스카드와</p>
											<p>여타 일반 GS &amp;POINT 카드는 사용 방법을 조금 달리 하셔야 합니다.</p>
											<p>&nbsp;</p>
											<p>온라인에서 포인트를 적립하거나 차감 사용하실 시,</p>
											<p>&nbsp;</p>
											<p>FC서울 보너스카드의 적립율을 적용 받으시려면 반드시! [카드 번호]를 넣으며 인증하셔야 합니다.</p>
											<p>[주민번호]를 넣으실 경우, 해당 명의로 가지고 계신 다른 일반 GS &amp;POINT 카드들이
												검색되어</p>
											<p>낮은 적립율을 적용 받으실 수 있습니다.</p>
											<p>&nbsp;</p>
											<p>포인트 차감 사용시에도 정확한 사용 내역을 기록하시려면,</p>
											<p>FC서울 카드로 카드번호를 넣으셔야 합니다.</p>
											<p>&nbsp;</p>
											<p>&nbsp;</p>
											<p>FC서울 보너스카드가 아닌 일반 GS &amp;POINT 카드를 사용하실 경우에는</p>
											<p>주민번호를 넣으셔도 됩니다.</p>
										</div>
									</dd>
								</dl>
								<dl>
									<dt>왜 적립이 제대로 안 되죠?</dt>
									<dd>
										<div>
											<p>FC서울 보너스 카드는 FC서울 홈페이지를 통해 가입 및 등록을 마치신 후에</p>
											<p>원활하게 사용하실 수 있습니다.</p>
											<p>&nbsp;</p>
											<p>미등록된 카드를 이용하시면 적립액과 횟수에 제한을 받습니다.</p>
											<p>&nbsp;</p>
											<p>기타 이용 장애는 Q&amp;A를 통해 문의 주시기 바랍니다.</p>
										</div>
									</dd>
								</dl>
								<dl>
									<dt>카드 등록이 안 돼요 ( +기등록 카드 메시지 관련.)</dt>
									<dd>
										<div>
											<p>FC서울 GS&amp;POINT 카드는 FC서울 홈페이지에서 등록을 하셔야 합니다.</p>
											<p>GS&amp;POINT 홈페이지에서 먼저 카드 등록을 하시면 기등록 카드 오류가 생깁니다.</p>
											<p>이 경우 정상적인 이용을 하실 수 없습니다.</p>
											<p>&nbsp;</p>
											<p>기타 이용 장애의 경우는 Q&amp;A를 통해 문의 주시면 감사하겠습니다.</p>
											<p>&nbsp;</p>
										</div>
									</dd>
								</dl>
								<dl>
									<dt>카드는 어디서 받나요?</dt>
									<dd>
										<div>
											<p>1. 온라인 통해 멤버십 가입시</p>
											<p>배송신청을 하실 수 있습니다.</p>
											<p>가입과 즉시에 배송될 카드의 번호를 확인하실 수 있기 때문에</p>
											<p>온라인 예매 등 할인과 적립의&nbsp;혜택을 받으실 수 있습니다.</p>
											<p>&nbsp;</p>
											<p>또, 현장에서 미리 수령하셨던 카드를 등록하실 수도 있습니다.</p>
											<p>&nbsp;</p>
											<p>현장 카드 수령은 FC서울 경기 당일 별도 부스(FC서울 회원센터), 장내 로비,</p>
											<p>매표소, 용품샾 등에서 가능하십니다.</p>
											<p>단, 카드를 처음 받을 시에는 미등록 카드이기에 적립이나 이용이 제한되며,</p>
											<p>온라인에서 가입 및 카드등록을 마치셔야 원활한 이용이 가능하십니다.</p>
										</div>
									</dd>
								</dl>
								<dl>
									<dt>FC서울 보너스 카드가 뭐죠?</dt>
									<dd>
										<div>
											<p>FC서울 보너스 카드는 GS&amp;POINT를 기반으로 하는 포인트 적립 시스템입니다.</p>
											<p>&nbsp;</p>
											<p>FC서울 경기를 관람할 시, 차별화 된 할인과 적립 서비스를 경험하실 수 있습니다.</p>
											<p>&nbsp;</p>
											<p>포인트 적립은 현장(티켓, 상품)과 온라인(예매, 쇼핑몰, 시즌티켓 등)에서 모두 가능하며</p>
											<p>포인트 사용은 온라인에서 가능합니다.</p>
											<p>&nbsp;</p>
											<p>다른 GS 모든 가맹점(GS칼텍스, GS25, GS SHOP 등)에서도 적립 및 포인트 사용이
												똑같이 가능합니다.</p>
											<p>&nbsp;</p>
											<p>자세한 내용은 FC서울 GS&amp;POINT 소개 페이지에서 확인하시기 바랍니다.</p>
										</div>
									</dd>
								</dl>
								<dl>
									<dt>현장에서 카드를 받았는데 어떻게 등록하나요?</dt>
									<dd>
										<div>
											<p>1. 홈페이지 회원의 경우</p>
											<p>&nbsp;- 보너스 카드 회원 가입 및 카드 번호 등록</p>
											<p>&nbsp;</p>
											<p>2. 홈페이지 회원 및 보너스카드 가입자</p>
											<p>&nbsp;- [카드등록하기] 메뉴 이용</p>
											<p>&nbsp;</p>
											<p>3. FC서울 홈페이지 회원이 아닌 경우</p>
											<p>&nbsp;- 회원 가입(홈페이지 + 보너스카드 동시) 및 카드등록.</p>
											<p>&nbsp;</p>
											<p>감사합니다.</p>
										</div>
									</dd>
								</dl>
							</div>
							<div class = "pageNumber">
								<a href = ""></a>
								<a href = "" class = "on">1</a>
								<a href = ""></a>
							</div>
						</div>
						<div id = "t4">
							<div class="faqWrap">
								<dl>
									<dt>대중교통은 무엇을 이용하면 되나요?</dt>
									<dd>
										<div>
											<p>지하철 6호선 월드컵경기장역을 나오면 바로 저희 경기장이 보입니다.</p><br/>
											<p>인근 버스 정류장도 안내해드리겠습니다.</p><br/>
											<p>마포농수산물시장, 월드컵경기장(14-550)->마포 08</p><br/>
											<p>월드컵경기장서측, 문화비축기지(14-105)->571, 710, 7019, 7715, 9711A, 8777</p><br/>
											<p>월드컵경기장서측, 문화비축기지(14-106)->571, 710, 6715, 7019, 7715, 9711A</p><br/>
											<p>월드컵경기장남측, 월드컵공원(14-104)->730, 733, 271A, 571, 710, 7011, 7715, 9711A, 8777, 마포08</p><br/>
										</div>
									</dd>
								</dl>
								<dl>
									<dt>지하철 몇 번 출구로 나오면 되나요?</dt>
									<dd>
										<div>
											2번 출구로 나와서 에스컬레이터를 이용하면 바로 북측광장입니다.
										</div>
									</dd>
								</dl>
								<dl>
									<dt>경기장 안 주차는 어떻게 하나요?</dt>
										<dd>
										<div>
											<p>경기 날에는 워낙 복잡하기 때문에 가급적 대중교통을 타는 게 가장 빠릅니다. 그러나 차를 가지고
												오셔야하는 상황이라면, 경기장 안쪽이나 남측 건너편 평화의 공원에 주차하시면 됩니다.</p>
											<br />
											<p>경기장 안은 주차 공간이 좁아서 보통 경기 세 시간 전에 이미 만차되기 때문에 남측 건너편 평화의
												공원에 하는 게 편합니다.</p>
											<br />
											<p>평화의 공원 주차요금은 서울시에서 운영하고 있기 때문에 4시간에 5,000원으로 책정됩니다.</p>
											<br />
											<p>평화의 공원에서 경기장 오는 법: 연결 다리가 있어서 건너편 남쪽으로 입장 가능합니다.</p>
										</div>
									</dd>
								</dl>
							</div>
							<div class = "pageNumber">
								<a href = ""></a>
								<a href = "" class = "on">1</a>
								<a href = ""></a>
							</div>
						</div>
						<div id = "t5">
							<div class = "faqWrap">
								<dl>
									<dt>FC서울 관련 용품(유니폼, 응원도구 등)은 어디서 구매 가능한가요?</dt>
									<dd>
										<div>
											<a>월드컵경기장역 2번 출구로 나오면 보이는 팬파크, 혹은 경기장 내 가판대에서 구매 가능합니다.</a>
										</div>
									</dd>
								</dl>
								<dl>
									<dt>시즌티켓 40주년 소장용 카드 수령 안내</dt>
									<dd>
										<div>
											<a>북측 회원센터에서 가능합니다.</a>
										</div>
									</dd>
								</dl>
								<dl>
									<dt>음식 반입 및 취식이 가능한가요?</dt>
									<dd>
										<div>
											<a>음식 반입 및 경기장 내 취식이 가능하며, 음료의 경우 유리병, 캔류, 600ml 초과 PET병은 반입이 불가능합니다.
												한국프로축구연맹 지침에 따라 주류는 반입이 불가하며, 경기장 내 판매 주류만 구입 및 음용이 가능합니다.</a>
										</div>
									</dd>
								</dl>
							</div>
							<div class = "pageNumber">
								<a href = ""></a>
								<a href = "" class = "on">1</a>
								<a href = ""></a>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
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
	</main>
</body>
</html>