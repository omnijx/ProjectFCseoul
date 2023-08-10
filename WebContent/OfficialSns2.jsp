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
	<link rel="stylesheet" href="css/OfficialSns2.css">
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
			
			$(document).ready(function() {
				$(".btns").click(function() {
					$(".btns").removeClass("act");
					$(this).parent().find(".btns").addClass("act");
				})
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
									FANZONE</button>
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
									공식 SNS</button>
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
			
						<div class="sns1">
			<div class="sns1top">
				<div class="sns1left">
					<span>share</span>
					<img alt="" src="	https://www.fcseoul.com/resources/front/images/sub/common/ico_gt.png">
					<a href="">
						<img alt="" src="https://www.fcseoul.com/resources/front/images/sub/common/ico_sns1.png">
					</a>
				</div>
				<h3>공식 SNS</h3>
				<div class="sns1right">
					<button>URL 복사</button>
				</div>
			</div>
			<div class="sns2top">
				<div class="sns2text">
					<p>언제, 어느곳에서나</p>
					<p> <span>SNS을 통해서 </span> FC서울을 만나보세요!	</p>
					<p>각 소셜 아이콘을 클릭하시면 FC서울 공식 SNS로 이동합니다.</p>
				</div>
				<ul>
					<li>
						<a href="">
							<img alt="" src="https://www.fcseoul.com/resources/front/images/sub/fanzone/img_sns1.png">
						</a>
					</li>
					<li>
						<a href="">
							<img alt="" src="https://www.fcseoul.com/resources/front/images/sub/fanzone/img_sns2.png">
						</a>
					</li>
					<li>
						<a href="">
							<img alt="" src="https://www.fcseoul.com/resources/front/images/sub/fanzone/img_sns3.png">
						</a>
					</li>
					<li>
						<a href="">
							<img alt="" src="https://www.fcseoul.com/resources/front/images/sub/fanzone/img_sns4.png">
						</a>
					</li>
				</ul>
			</div>
			
			<div class="main5">
			<div class="submain5">
				<h3>FC SEOUL SNS</h3>
				<div class="snsbtn">
					<ul class="seoulsns">
						<li class=" sbtn">
							<button class="btns act">ALL</button>
						</li>
						<li class="">
							<button class="btns">Instagram</button>
						</li>
						<li class="">
							<button class="btns">Youtube</button>
						</li>
					</ul>
				</div>
				<div class="snsbox">
					<div class="insta">
						<a href="">
							<img alt="" src="https://scontent-nrt1-1.cdninstagram.com/v/t51.29350-15/353798227_808796260384059_4990971618261906937_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=8ae9d6&_nc_ohc=QRdBof0uyBUAX_PZyBO&_nc_ht=scontent-nrt1-1.cdninstagram.com&edm=ANo9K5cEAAAA&oh=00_AfB2w_1OUMBkwPid2SV6y4QrLl_j7XYS7LoKwQ4MBZSzoA&oe=648EBEBC">
							<div class="stbox">
								<p class="snstext">
									🔍 윌리를 찾아라! 이벤트 안내

A매치 브레이크로 K리그 경기가 없는 이번주. FC서울에 푹 빠진 윌리안은 팬들이 너무 보고싶은 나머지 서울시내로 팬들을 찾아나서는데... 윌리는 어디있을까요?

서울시 어딘가에 숨어있는 FC서울 선수 찾기.
본격 팬 참여형 미션 콘텐츠! 윌리를 찾아라!



- 금요일 (16일) 오후 2시 30분 인스타그램/페이스북을 통해 공개되는 장소 힌트를 잘 보고 해석하기
- 윌리는 당일 오후 3시부터 4시 30분까지만 해당 장소에 있으므로 최대한 빠르게 출발하기 (4시 30분 단체사진 촬영 후 해산 예정)
- 윌리를 만나 사인, 사진, 대화 등 즉석 팬미팅을 즐기기

* 제일 먼저 윌리를 찾아와 "찾았다 윌리!"를 외치는 분께는 윌리안의 친필 사인 유니폼을 현장에서 선물로 드립니다.

* 윌리를 찾아온 분들은 FC서울 공식 채널에 업로드될 사진/영상에 노출될 수 있으며 이에 동의한 것으로 간주됩니다. 간단한 인터뷰 요청이 있을 수 있습니다.

* 선수단 훈련 등 스케줄을 고려해 정해진 일정으로 평일 오후에 진행하는 점 양해 바랍니다.

* FC서울은 팬 여러분들의 연차, 반차, 땡땡이를 책임지지 않습니다. 서울시내 지리에 익숙하며 퀴즈를 풀고 윌리를 찾을 자신이 있는 분들만 적극적으로 참여 부탁드립니다.

#FC서울 #FCSEOUL #윌리안 #윌리를찾아라
								</p>
							</div>
							<p class="instaimg"></p>
						</a>
					</div>
					<div class="insta">
						<a href="">
							<img alt="" src="https://scontent-nrt1-1.cdninstagram.com/v/t51.29350-15/353798227_808796260384059_4990971618261906937_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=8ae9d6&_nc_ohc=QRdBof0uyBUAX_PZyBO&_nc_ht=scontent-nrt1-1.cdninstagram.com&edm=ANo9K5cEAAAA&oh=00_AfB2w_1OUMBkwPid2SV6y4QrLl_j7XYS7LoKwQ4MBZSzoA&oe=648EBEBC">
							<div class="stbox">
								<p class="snstext">
									🔍 윌리를 찾아라! 이벤트 안내

A매치 브레이크로 K리그 경기가 없는 이번주. FC서울에 푹 빠진 윌리안은 팬들이 너무 보고싶은 나머지 서울시내로 팬들을 찾아나서는데... 윌리는 어디있을까요?

서울시 어딘가에 숨어있는 FC서울 선수 찾기.
본격 팬 참여형 미션 콘텐츠! 윌리를 찾아라!



- 금요일 (16일) 오후 2시 30분 인스타그램/페이스북을 통해 공개되는 장소 힌트를 잘 보고 해석하기
- 윌리는 당일 오후 3시부터 4시 30분까지만 해당 장소에 있으므로 최대한 빠르게 출발하기 (4시 30분 단체사진 촬영 후 해산 예정)
- 윌리를 만나 사인, 사진, 대화 등 즉석 팬미팅을 즐기기

* 제일 먼저 윌리를 찾아와 "찾았다 윌리!"를 외치는 분께는 윌리안의 친필 사인 유니폼을 현장에서 선물로 드립니다.

* 윌리를 찾아온 분들은 FC서울 공식 채널에 업로드될 사진/영상에 노출될 수 있으며 이에 동의한 것으로 간주됩니다. 간단한 인터뷰 요청이 있을 수 있습니다.

* 선수단 훈련 등 스케줄을 고려해 정해진 일정으로 평일 오후에 진행하는 점 양해 바랍니다.

* FC서울은 팬 여러분들의 연차, 반차, 땡땡이를 책임지지 않습니다. 서울시내 지리에 익숙하며 퀴즈를 풀고 윌리를 찾을 자신이 있는 분들만 적극적으로 참여 부탁드립니다.

#FC서울 #FCSEOUL #윌리안 #윌리를찾아라
								</p>
							</div>
							<p class="instaimg"></p>
						</a>
					</div>
					<div class="insta">
						<a href="">
							<img alt="" src="https://scontent-nrt1-1.cdninstagram.com/v/t51.29350-15/353798227_808796260384059_4990971618261906937_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=8ae9d6&_nc_ohc=QRdBof0uyBUAX_PZyBO&_nc_ht=scontent-nrt1-1.cdninstagram.com&edm=ANo9K5cEAAAA&oh=00_AfB2w_1OUMBkwPid2SV6y4QrLl_j7XYS7LoKwQ4MBZSzoA&oe=648EBEBC">
							<div class="stbox">
								<p class="snstext">
									🔍 윌리를 찾아라! 이벤트 안내

A매치 브레이크로 K리그 경기가 없는 이번주. FC서울에 푹 빠진 윌리안은 팬들이 너무 보고싶은 나머지 서울시내로 팬들을 찾아나서는데... 윌리는 어디있을까요?

서울시 어딘가에 숨어있는 FC서울 선수 찾기.
본격 팬 참여형 미션 콘텐츠! 윌리를 찾아라!



- 금요일 (16일) 오후 2시 30분 인스타그램/페이스북을 통해 공개되는 장소 힌트를 잘 보고 해석하기
- 윌리는 당일 오후 3시부터 4시 30분까지만 해당 장소에 있으므로 최대한 빠르게 출발하기 (4시 30분 단체사진 촬영 후 해산 예정)
- 윌리를 만나 사인, 사진, 대화 등 즉석 팬미팅을 즐기기

* 제일 먼저 윌리를 찾아와 "찾았다 윌리!"를 외치는 분께는 윌리안의 친필 사인 유니폼을 현장에서 선물로 드립니다.

* 윌리를 찾아온 분들은 FC서울 공식 채널에 업로드될 사진/영상에 노출될 수 있으며 이에 동의한 것으로 간주됩니다. 간단한 인터뷰 요청이 있을 수 있습니다.

* 선수단 훈련 등 스케줄을 고려해 정해진 일정으로 평일 오후에 진행하는 점 양해 바랍니다.

* FC서울은 팬 여러분들의 연차, 반차, 땡땡이를 책임지지 않습니다. 서울시내 지리에 익숙하며 퀴즈를 풀고 윌리를 찾을 자신이 있는 분들만 적극적으로 참여 부탁드립니다.

#FC서울 #FCSEOUL #윌리안 #윌리를찾아라
								</p>
							</div>
							<p class="instaimg"></p>
						</a>
					</div>
					<div class="insta">
						<a href="">
							<img alt="" src="https://scontent-nrt1-1.cdninstagram.com/v/t51.29350-15/353798227_808796260384059_4990971618261906937_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=8ae9d6&_nc_ohc=QRdBof0uyBUAX_PZyBO&_nc_ht=scontent-nrt1-1.cdninstagram.com&edm=ANo9K5cEAAAA&oh=00_AfB2w_1OUMBkwPid2SV6y4QrLl_j7XYS7LoKwQ4MBZSzoA&oe=648EBEBC">
							<div class="stbox">
								<p class="snstext">
									🔍 윌리를 찾아라! 이벤트 안내

A매치 브레이크로 K리그 경기가 없는 이번주. FC서울에 푹 빠진 윌리안은 팬들이 너무 보고싶은 나머지 서울시내로 팬들을 찾아나서는데... 윌리는 어디있을까요?

서울시 어딘가에 숨어있는 FC서울 선수 찾기.
본격 팬 참여형 미션 콘텐츠! 윌리를 찾아라!



- 금요일 (16일) 오후 2시 30분 인스타그램/페이스북을 통해 공개되는 장소 힌트를 잘 보고 해석하기
- 윌리는 당일 오후 3시부터 4시 30분까지만 해당 장소에 있으므로 최대한 빠르게 출발하기 (4시 30분 단체사진 촬영 후 해산 예정)
- 윌리를 만나 사인, 사진, 대화 등 즉석 팬미팅을 즐기기

* 제일 먼저 윌리를 찾아와 "찾았다 윌리!"를 외치는 분께는 윌리안의 친필 사인 유니폼을 현장에서 선물로 드립니다.

* 윌리를 찾아온 분들은 FC서울 공식 채널에 업로드될 사진/영상에 노출될 수 있으며 이에 동의한 것으로 간주됩니다. 간단한 인터뷰 요청이 있을 수 있습니다.

* 선수단 훈련 등 스케줄을 고려해 정해진 일정으로 평일 오후에 진행하는 점 양해 바랍니다.

* FC서울은 팬 여러분들의 연차, 반차, 땡땡이를 책임지지 않습니다. 서울시내 지리에 익숙하며 퀴즈를 풀고 윌리를 찾을 자신이 있는 분들만 적극적으로 참여 부탁드립니다.

#FC서울 #FCSEOUL #윌리안 #윌리를찾아라
								</p>
							</div>
							<p class="instaimg"></p>
						</a>
					</div>
					
					<div class="youtube">
						<a href="">
							<img alt="" src="https://i.ytimg.com/vi/nLyeTzhmRC4/sddefault.jpg">
							<div class="stbox">
								<p class="snstext">
									줌 인 서울 | 황의조 연속골, A매치 브레이크 돌입 | 서울 1-1 포항 | K리그1 2023 R18
								</p>
							</div>
							<p class="youtubeimg"></p>
						</a>
					</div>
					
					<div class="youtube">
						<a href="">
							<img alt="" src="https://i.ytimg.com/vi/nLyeTzhmRC4/sddefault.jpg">
							<div class="stbox">
								<p class="snstext">
									줌 인 서울 | 황의조 연속골, A매치 브레이크 돌입 | 서울 1-1 포항 | K리그1 2023 R18
								</p>
							</div>
							<p class="youtubeimg"></p>
						</a>
					</div>
					<div class="youtube">
						<a href="">
							<img alt="" src="https://i.ytimg.com/vi/nLyeTzhmRC4/sddefault.jpg">
							<div class="stbox">
								<p class="snstext">
									줌 인 서울 | 황의조 연속골, A매치 브레이크 돌입 | 서울 1-1 포항 | K리그1 2023 R18
								</p>
							</div>
							<p class="youtubeimg"></p>
						</a>
					</div>
					
					<div class="insta">
						<a href="">
							<img alt="" src="https://scontent-nrt1-1.cdninstagram.com/v/t51.29350-15/353798227_808796260384059_4990971618261906937_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=8ae9d6&_nc_ohc=QRdBof0uyBUAX_PZyBO&_nc_ht=scontent-nrt1-1.cdninstagram.com&edm=ANo9K5cEAAAA&oh=00_AfB2w_1OUMBkwPid2SV6y4QrLl_j7XYS7LoKwQ4MBZSzoA&oe=648EBEBC">
							<div class="stbox">
								<p class="snstext">
									🔍 윌리를 찾아라! 이벤트 안내

A매치 브레이크로 K리그 경기가 없는 이번주. FC서울에 푹 빠진 윌리안은 팬들이 너무 보고싶은 나머지 서울시내로 팬들을 찾아나서는데... 윌리는 어디있을까요?

서울시 어딘가에 숨어있는 FC서울 선수 찾기.
본격 팬 참여형 미션 콘텐츠! 윌리를 찾아라!



- 금요일 (16일) 오후 2시 30분 인스타그램/페이스북을 통해 공개되는 장소 힌트를 잘 보고 해석하기
- 윌리는 당일 오후 3시부터 4시 30분까지만 해당 장소에 있으므로 최대한 빠르게 출발하기 (4시 30분 단체사진 촬영 후 해산 예정)
- 윌리를 만나 사인, 사진, 대화 등 즉석 팬미팅을 즐기기

* 제일 먼저 윌리를 찾아와 "찾았다 윌리!"를 외치는 분께는 윌리안의 친필 사인 유니폼을 현장에서 선물로 드립니다.

* 윌리를 찾아온 분들은 FC서울 공식 채널에 업로드될 사진/영상에 노출될 수 있으며 이에 동의한 것으로 간주됩니다. 간단한 인터뷰 요청이 있을 수 있습니다.

* 선수단 훈련 등 스케줄을 고려해 정해진 일정으로 평일 오후에 진행하는 점 양해 바랍니다.

* FC서울은 팬 여러분들의 연차, 반차, 땡땡이를 책임지지 않습니다. 서울시내 지리에 익숙하며 퀴즈를 풀고 윌리를 찾을 자신이 있는 분들만 적극적으로 참여 부탁드립니다.

#FC서울 #FCSEOUL #윌리안 #윌리를찾아라
								</p>
							</div>
							<p class="instaimg"></p>
						</a>
					</div>
					<div class="insta">
						<a href="">
							<img alt="" src="https://scontent-nrt1-1.cdninstagram.com/v/t51.29350-15/353798227_808796260384059_4990971618261906937_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=8ae9d6&_nc_ohc=QRdBof0uyBUAX_PZyBO&_nc_ht=scontent-nrt1-1.cdninstagram.com&edm=ANo9K5cEAAAA&oh=00_AfB2w_1OUMBkwPid2SV6y4QrLl_j7XYS7LoKwQ4MBZSzoA&oe=648EBEBC">
							<div class="stbox">
								<p class="snstext">
									🔍 윌리를 찾아라! 이벤트 안내

A매치 브레이크로 K리그 경기가 없는 이번주. FC서울에 푹 빠진 윌리안은 팬들이 너무 보고싶은 나머지 서울시내로 팬들을 찾아나서는데... 윌리는 어디있을까요?

서울시 어딘가에 숨어있는 FC서울 선수 찾기.
본격 팬 참여형 미션 콘텐츠! 윌리를 찾아라!



- 금요일 (16일) 오후 2시 30분 인스타그램/페이스북을 통해 공개되는 장소 힌트를 잘 보고 해석하기
- 윌리는 당일 오후 3시부터 4시 30분까지만 해당 장소에 있으므로 최대한 빠르게 출발하기 (4시 30분 단체사진 촬영 후 해산 예정)
- 윌리를 만나 사인, 사진, 대화 등 즉석 팬미팅을 즐기기

* 제일 먼저 윌리를 찾아와 "찾았다 윌리!"를 외치는 분께는 윌리안의 친필 사인 유니폼을 현장에서 선물로 드립니다.

* 윌리를 찾아온 분들은 FC서울 공식 채널에 업로드될 사진/영상에 노출될 수 있으며 이에 동의한 것으로 간주됩니다. 간단한 인터뷰 요청이 있을 수 있습니다.

* 선수단 훈련 등 스케줄을 고려해 정해진 일정으로 평일 오후에 진행하는 점 양해 바랍니다.

* FC서울은 팬 여러분들의 연차, 반차, 땡땡이를 책임지지 않습니다. 서울시내 지리에 익숙하며 퀴즈를 풀고 윌리를 찾을 자신이 있는 분들만 적극적으로 참여 부탁드립니다.

#FC서울 #FCSEOUL #윌리안 #윌리를찾아라
								</p>
							</div>
							<p class="instaimg"></p>
						</a>
					</div>
					<div class="insta">
						<a href="">
							<img alt="" src="https://scontent-nrt1-1.cdninstagram.com/v/t51.29350-15/353798227_808796260384059_4990971618261906937_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=8ae9d6&_nc_ohc=QRdBof0uyBUAX_PZyBO&_nc_ht=scontent-nrt1-1.cdninstagram.com&edm=ANo9K5cEAAAA&oh=00_AfB2w_1OUMBkwPid2SV6y4QrLl_j7XYS7LoKwQ4MBZSzoA&oe=648EBEBC">
							<div class="stbox">
								<p class="snstext">
									🔍 윌리를 찾아라! 이벤트 안내

A매치 브레이크로 K리그 경기가 없는 이번주. FC서울에 푹 빠진 윌리안은 팬들이 너무 보고싶은 나머지 서울시내로 팬들을 찾아나서는데... 윌리는 어디있을까요?

서울시 어딘가에 숨어있는 FC서울 선수 찾기.
본격 팬 참여형 미션 콘텐츠! 윌리를 찾아라!



- 금요일 (16일) 오후 2시 30분 인스타그램/페이스북을 통해 공개되는 장소 힌트를 잘 보고 해석하기
- 윌리는 당일 오후 3시부터 4시 30분까지만 해당 장소에 있으므로 최대한 빠르게 출발하기 (4시 30분 단체사진 촬영 후 해산 예정)
- 윌리를 만나 사인, 사진, 대화 등 즉석 팬미팅을 즐기기

* 제일 먼저 윌리를 찾아와 "찾았다 윌리!"를 외치는 분께는 윌리안의 친필 사인 유니폼을 현장에서 선물로 드립니다.

* 윌리를 찾아온 분들은 FC서울 공식 채널에 업로드될 사진/영상에 노출될 수 있으며 이에 동의한 것으로 간주됩니다. 간단한 인터뷰 요청이 있을 수 있습니다.

* 선수단 훈련 등 스케줄을 고려해 정해진 일정으로 평일 오후에 진행하는 점 양해 바랍니다.

* FC서울은 팬 여러분들의 연차, 반차, 땡땡이를 책임지지 않습니다. 서울시내 지리에 익숙하며 퀴즈를 풀고 윌리를 찾을 자신이 있는 분들만 적극적으로 참여 부탁드립니다.

#FC서울 #FCSEOUL #윌리안 #윌리를찾아라
								</p>
							</div>
							<p class="instaimg"></p>
						</a>
					</div>
					<div class="insta">
						<a href="">
							<img alt="" src="https://scontent-nrt1-1.cdninstagram.com/v/t51.29350-15/353798227_808796260384059_4990971618261906937_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=8ae9d6&_nc_ohc=QRdBof0uyBUAX_PZyBO&_nc_ht=scontent-nrt1-1.cdninstagram.com&edm=ANo9K5cEAAAA&oh=00_AfB2w_1OUMBkwPid2SV6y4QrLl_j7XYS7LoKwQ4MBZSzoA&oe=648EBEBC">
							<div class="stbox">
								<p class="snstext">
									🔍 윌리를 찾아라! 이벤트 안내

A매치 브레이크로 K리그 경기가 없는 이번주. FC서울에 푹 빠진 윌리안은 팬들이 너무 보고싶은 나머지 서울시내로 팬들을 찾아나서는데... 윌리는 어디있을까요?

서울시 어딘가에 숨어있는 FC서울 선수 찾기.
본격 팬 참여형 미션 콘텐츠! 윌리를 찾아라!



- 금요일 (16일) 오후 2시 30분 인스타그램/페이스북을 통해 공개되는 장소 힌트를 잘 보고 해석하기
- 윌리는 당일 오후 3시부터 4시 30분까지만 해당 장소에 있으므로 최대한 빠르게 출발하기 (4시 30분 단체사진 촬영 후 해산 예정)
- 윌리를 만나 사인, 사진, 대화 등 즉석 팬미팅을 즐기기

* 제일 먼저 윌리를 찾아와 "찾았다 윌리!"를 외치는 분께는 윌리안의 친필 사인 유니폼을 현장에서 선물로 드립니다.

* 윌리를 찾아온 분들은 FC서울 공식 채널에 업로드될 사진/영상에 노출될 수 있으며 이에 동의한 것으로 간주됩니다. 간단한 인터뷰 요청이 있을 수 있습니다.

* 선수단 훈련 등 스케줄을 고려해 정해진 일정으로 평일 오후에 진행하는 점 양해 바랍니다.

* FC서울은 팬 여러분들의 연차, 반차, 땡땡이를 책임지지 않습니다. 서울시내 지리에 익숙하며 퀴즈를 풀고 윌리를 찾을 자신이 있는 분들만 적극적으로 참여 부탁드립니다.

#FC서울 #FCSEOUL #윌리안 #윌리를찾아라
								</p>
							</div>
							<p class="instaimg"></p>
						</a>
					</div>
										
					<div class="youtube">
						<a href="">
							<img alt="" src="https://i.ytimg.com/vi/nLyeTzhmRC4/sddefault.jpg">
							<div class="stbox">
								<p class="snstext">
									줌 인 서울 | 황의조 연속골, A매치 브레이크 돌입 | 서울 1-1 포항 | K리그1 2023 R18
								</p>
							</div>
							<p class="youtubeimg"></p>
						</a>
					</div>
					
					<div class="youtube">
						<a href="">
							<img alt="" src="https://i.ytimg.com/vi/nLyeTzhmRC4/sddefault.jpg">
							<div class="stbox">
								<p class="snstext">
									줌 인 서울 | 황의조 연속골, A매치 브레이크 돌입 | 서울 1-1 포항 | K리그1 2023 R18
								</p>
							</div>
							<p class="youtubeimg"></p>
						</a>
					</div>
					<div class="youtube">
						<a href="">
							<img alt="" src="https://i.ytimg.com/vi/nLyeTzhmRC4/sddefault.jpg">
							<div class="stbox">
								<p class="snstext">
									줌 인 서울 | 황의조 연속골, A매치 브레이크 돌입 | 서울 1-1 포항 | K리그1 2023 R18
								</p>
							</div>
							<p class="youtubeimg"></p>
						</a>
					</div>
					
					<div class="morebtn">
						<a href=""></a>
					</div>
					
					
					
				</div>
			</div>
		</div>
			
			
		</div>
			
			</div>
	<!-- 메인 -->
</body>
</html>