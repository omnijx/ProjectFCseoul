<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dto.GoodsDto"%>
<%@page import="dto.MatchDBDto"%>
<%@page import="dto.RankDto"%>
<%@page import="dto.MainNoticeDto"%>
<%@page import="dto.MainNewsDto"%>
<%@page import="dto.MainPhotoDto"%>
<%@page import="java.util.ArrayList"%>
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
	<link rel="stylesheet" href="css/join.css">
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
	<script>
 		$(function(){
 			$(".on").click(function(){
 				if($(this).parent().hasClass("check")) {
 					$(this).parent().removeClass("check").addClass("unCheck");
 				} else {
 					$(this).parent().removeClass("unCheck").addClass("check");
 				}
 			});
 		});
			
 		
 		
 		$(function(){
 			$(".all").click(function(){
 				if($(this).parent().hasClass("unCheck")){
 					$(this).parent().removeClass("unCheck").addClass("check");
		 			$(".on").each(function(index, item){
						$(this).parent().removeClass("unCheck").addClass("check");
						$("input[name=chk]").prop("checked",true);
		 			});
 				} else {
 					$(this).parent().removeClass("check").addClass("unCheck");
					$(".on").each(function(index, item){
						$(this).parent().removeClass("check").addClass("unCheck");
						$("input[name=chk]").prop("checked",false);
					});
 				}
 			});
 		});
 		
 		$(function(){
 			$("#agree").click(function(){
 				if($("#check1").is(':checked') && $("#check2").is(':checked') && $("#check3").is(':checked')){
 					location.href="Join2.jsp";
 				} else {
 					alert("FC서울 이용약관에 동의하지 않으시면 가입할 수 없습니다.");
 				}
 			});
 		});
	</script>
</head>
<body>
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
<!-- 	<section class="bannertop"> -->
<!-- 				<div class="container"> -->
<!-- 					<h2>TICKETS</h2> -->
<!-- 				</div> -->
<!-- 				<div class="contentButton"> -->
<!-- 					<div class="content"> -->
<!-- 						<ul> -->
<!-- 							<li class="home"><a href="https://www.fcseoul.com/"></a></li> -->

<!-- 							<li> -->
<!-- 								<button class="button"> -->
<!-- 									TICKETS</button> -->
<!-- 								<ul id="buttonUI" class = button123 style="display: none;"> -->
<!-- 									<li><a href="FcController?command=news2">MEDIA</a> -->
<!-- 									</li> -->
<!-- 									<li><a -->
<!-- 										href="FcController?command=matchInfo">MATCHES</a> -->
<!-- 									</li> -->
<!-- 									<li><a -->
<!-- 										href="FcController?command=ticketing">TICKETS</a> -->
<!-- 									</li> -->
<!-- 									<li><a -->
<!-- 										href="https://www.fcseoul.com/club/clubPlayerIntroductionList/FW">CLUB</a> -->
<!-- 									</li> -->
<!-- 									<li><a href="https://www.fcseoul.com/fanzone/sns">FAN -->
<!-- 											ZONE</a></li> -->
<!-- 								</ul> -->
<!-- 							</li> -->

<!-- 							<li> -->
<!-- 								<button class="button"> -->
<!-- 									티켓 예매</button> -->
<!-- 								<ul id="buttonUI2" class = button123 style="display: none;"> -->
<!-- 									<li><a href="http://localhost:9080/FCseoul/MatchInfo.html">티켓 예매</a> -->
<!-- 									</li> -->
<!-- 									<li><a href="http://localhost:9080/FCseoul/rankingList.html">시즌티켓</a> -->
<!-- 									</li> -->
<!-- 									<li><a href="http://localhost:9080/FCseoul/rankingList.html">단체 입장권</a> -->
<!-- 									</li> -->
<!-- 									<li><a href="http://localhost:9080/FCseoul/rankingList.html">1865 스카이박스</a> -->
<!-- 									</li> -->
<!-- 								</ul> -->
<!-- 							</li> -->
<!-- 						</ul> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 		</section>	 -->
	<div class="subMain">
		<section class="top">
			<div class="fl route">
				<span>share</span> <img
					src="https://www.fcseoul.com/resources/front/images/sub/common/ico_gt.png" />
				<a href=""> <img
					src="https://www.fcseoul.com/resources/front/images/sub/common/ico_sns1.png" />
				</a>
			</div>
			<h3 class="fl">회원가입</h3>
			<div class="fr">
				<button type="button" class="urlCopy">URL 복사</button>
				<script>
						document.querySelector(".urlCopy").addEventListener("click", function() {
						  const currentURL = window.location.href;
						
						  const tempTextarea = document.createElement("textarea");
						  tempTextarea.value = currentURL;
						  document.body.appendChild(tempTextarea);
						  tempTextarea.select();
						  document.execCommand("copy");
						  document.body.removeChild(tempTextarea);
						
						  alert("URL이 복사되었습니다.");
						});
				</script>
			</div>
			<div style="clear: both;"></div>
		</section>
					<div class="joinStepWrap">
				<ul>
					<li class="active">
						<div class="jsTxt">
							<p>STEP.1</p>
							<p>약관동의</p>
						</div>
						<div class="jsLast">
							<div class="jsBefore"></div>
							<div class="jsAfter"></div>
						</div>
					</li>
					<li>
						<div class="jsTxt">
							<p>STEP.2</p>
							<p>본인인증</p>
						</div>
						<div class="jsLast">
							<div class="jsBefore"></div>
							<div class="jsAfter"></div>
						</div>
					</li>
					<li>
						<div class="jsTxt">
							<p>STEP.3</p>
							<p>기본정보입력</p>
						</div>
						<div class="jsLast">
							<div class="jsBefore">
							</div>
							<div class="jsAfter"></div>
						</div>
					</li>
					<li>
						<div class="jsTxt">
							<p>STEP.4</p>
							<p>가입완료</p>
						</div>
					</li>
				</ul>
			</div>
		<section>
			<form action="">
				<input type="hidden"/>
				<input type="hidden"/>
				<input type="hidden"/>
				<input type="hidden"/>
				<input type="hidden"/>
				<div class="sub1">
					<h4>
						약관동의
						<span>회원가입을 위해서 아래 이용약관·개인정보 수집 및 이용에 대한 안내를 읽고 동의해 주세요.</span>
					</h4>
					<div class="checkWrap">
						<div class="line1">
							<div id="checkColor" class="title unCheck">
								<input type="checkbox" id="checkAll"/>
								<label class="all" for="checkAll">전체 약관 동의</label>
							</div>
						</div>
						<div class="line2">
							<div id="checkColor1" class="title unCheck">
								<input type="checkbox" id="check1" name="chk"/>
								<label class="on" for="check1">
									FC서울 이용약관
									<span class="essential">(필수)</span>
								</label>
							</div>
							<div class="box">
								<div class="preWrap">
									<pre>
									
제 1장 총칙

제 1조 목적
이 약관은 FC서울에서 운영하는 인터넷 서비스 ''FC Seoul"(이하 '서비스'라 한다)의 이용 및 서비스 제공에 관한 사항을 규정함을 목적으로 합니다.

제 2조 정의
1항 서비스란 FC Seoul이 인터넷 서비스를 이용자에게 제공하기 위하여 컴퓨터 등 정보통신 설비를 이용하여 서비스를 제공하는 가상의 영업장을 말합니다.
2항 '이용자'란 서비스에 접속하여 본 약관에 따라 FC Seoul에서 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
3항 '회원'이라 함은 FC Seoul에 비밀번호 등의 개인정보를 제공하여 회원등록을 한 자로서, FC Seoul의 정보를 지속적으로 제공받으며, 'FC Seoul' 에서 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.
4항 '비회원'이라 함은 회원등록을 하지 않고 'FC Seoul'을 이용하는 자를 말합니다.
5항 '비밀번호'라 함은 회원의 비밀 보호를 위해 회원 자신이 설정한 문자와 숫자의 조합을 말합니다.

제 3조 약관의 효력발생 및 개정
1항 본 약관은 'FC Seoul'의 서비스 화면에 게시함으로써 효력을 발생합니다.
2항 본 약관의 변경사항이 있을 경우'FC Seoul'의 온라인 게시판을 통해 공지합니다.
3항 'FC Seoul'은 필요하다고 인정되는 경우 이 약관을 개정할 수 있으며 변경된 약관은 제 1항과 같은 방법으로 효력을 발생합니다.
4항 이 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신사업법 및 기타 관련법령의 규정에 의합니다.

제 2장 서비스 이용 계약

제 1조 이용계약의 성립
회원 등록 시 'FC Seoul'의 이용약관에 동의한다는 단추를 누르면 이 약관에 동의하는 것으로 간주됩니다.

제 2조 회원 등록
회원 등록은 온라인으로 다음 사항을 가입신청 양식에 기록하여 신청합니다.
- 이름
- E-Mail 주소
- 비밀번호
- 주소
- 전화번호 등

제 3조 회원등록의 승낙 유보 및 취소
1항 회사는 다음 각 호에 해당하는 회원등록에 대해서는 이를 승낙하지 않거나 승낙을 유보할 수 있습니다.
- 설비에 여유가 없는 경우
- 기술상 지장이 있는 경우
- 기타 회사가 필요하다고 인정되는 경우
2항 회사는 다음 각 호에 해당하는 회원등록에 대해서는 이를 승낙하지 않거나 승낙을 취소할 수 있습니다.
- 회원 등록 시 등록된 이름이 실명이 아닌 경우
- 다른 사람의 명의를 사용하여 회원등록을 한 경우
- 회원 등록 시 필요내용을 허위로 기재한 경우
- 원활한 서비스 진행을 저해할 목적으로 회원 등록한 경우
- 기타 회사가 정한 회원 등록 요건이 미비 되었을 경우

제 3장 서비스 이용

제 1조 서비스 이용시간
1항 서비스의 이용시간은 회사의 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴 1일 24시간을 원칙으로 합니다. 다만 정기 점검 등의 필요로 회사가 정한 날이나 시간은 그러하지 않습니다.
2항 회사는 서비스를 일정 범위로 분할하여 각 범위 별로 이용 가능 시간을 별도로 정할 수 있으며 이 경우 그 내용을 사전에 공지합니다.

제 2조 서비스 제공 및 변경
1항 'FC Seoul'은 다음과 같은 서비스를 제공합니다.
- 정보의 제공 및 구매계약의 체결
- 기타 'FC Seoul'이 제공하는 서비스
2항 'FC Seoul'은 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 서비스의 내용을 변경할 수 있습니다.

제 3조 서비스 제공의 중지
회사는 다음 각 호에 해당하는 경우 서비스의 전부 또는 일부의 제공을 제한하거나 중지할 수 있습니다.
- 서비스용 설비의 보수점검, 교체 및 장애 등으로 인한 부득이한 경우
- 전기통신사업법에 규정된 기간통신사업자가 전기통신 서비스를 중지했을 경우
- 국가비상사태, 정전 등의 사유가 발생한 경우
- 서비스 이용의 폭주 등으로 정상적인 서비스 이용에 지장이 있을 경우

제 4조 서비스 계약해지 및 이용제한
1항 회원이 이용계약을 해지하고자 하는 경우에는 회원 본인이 마이페이지에서 회원탈퇴를 해야 하여야 합니다.
2항 회사는 이용자가 다음 각 호에 해당하는 행위를 하였을 경우 사전 통지 없이 이용계약을 해지하거나 또는 기간을 정하여 서비스 이용을 중지할 수 있습니다.
- 타인의 회원정보 및 비밀번호를 도용한 경우
- 서비스 운영을 고의로 방해한 경우
- 회원 등록한 이름이 실명이 아닌 경우
- 같은 사용자가 다른 사람으로 이중등록을 한 경우
- 원활한 서비스 진행에 저해되는 내용을 고의로 유포시킨 경우
- 이용자가 국익 또는 사회적 공익을 저해할 목적으로 서비스 이용을 계획 또는 실행하는 경우
- 타인의 명예를 손상시키거나 불이익을 주는 행위를 한 경우
- 기타 회사가 정한 이용조건에 위반한 경우
- 일방적인 매매 중단 및 거부 등 부정한 상거래를 한 경우
- 부정한 상거래 행위로 서비스 이용을 제한 당한 이용자가 재등록을 신청한 경우

제 5조 회원의 게시물
'FC Seoul'은 회원이 등록한 게시물의 내용이 다음 각 항에 해당된다고 판단하면, 게시자에게 통지 없이 게시물을 삭제할 수 있습니다.
- 다른 회원이나 고객.주주 또는 제 3자를 비방하는 등 명예를 손상시킨 경우
- 공공질서 및 미풍양속에 위반되는 내용인 경우
- 범죄 행위와 결부된다고 인정되는 경우
- 제 3자의 저작권 등 기타 권리를 침해하는 경우
- 기타 관계 법령이나 회사에서 정한 규정에 위배되는 경우
- 회사에서 규정한 게시기간을 초과한 경우

제 6조 게시물의 저작권
서비스에 게재된 자료에 대한 권리는 다음 각 호와 같습니다.
- 게시물에 대한 권리와 책임은 게시자에게 있으며 회사는 게시자의 동의 없이는 이를 영리적 목적으로 사용할 수 없습니다. 단, 비영리적인 경우는 그러하지 아니하며 또한 서비스 내의 게재권을 갖습니다.
- 회원은 서비스를 이용하여 얻은 정보를 가공, 판매하는 행위 등 서비스에 게재된 자료를 상업적으로 사용할 수 없습니다.

제 7조 정보의 제공
회사는 이용자가 서비스 이용 중 필요가 있다고 인정되는 다양한 정보에 대해서 전자우편이나 서신우편 등의 방법으로 회원에게 제공할 수 있습니다. 'FC Seoul'이 제공하는 정보에는 컨텐츠, 공지, 이벤트, 리서치, 광고 등의 메일이 있습니다.

제 4장 개인 정보 및 보안

제 1조 개인 정보의 취득 및 이용
1항 개인의 정보는 상품의 구매 계약 및 경매 서비스 이용시 필요한 정보를 개인으로 부터 입력 받아 이용하며 당사에서는 고객편의를 위하여 최초 작성시 입력한 정보를 재이용할 수 있습니다.
2항 개인 정보의 기본 수집 목적 이외에 다른 용도로 이용하거나 회원의 동의 없이 제 3자에게 회원 정보를 제공할 수 없으며, 회원 정보의 분실, 도난, 유출, 변조가 발생하고 이에 따라 회원이 피해를 입을 경우 이에 대한 모든 책임은 'FC Seoul'이 집니다. 단 아래의 경우엔 예외로 합니다.
- 전기통신기본법 등 법률의 규정에 의해 국가기관의 요구가 있는 경우
- 범죄에 대한 수사상의 목적이 있거나 정보통신윤리위원회의 요청이 있는 경우
- 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우
- 홍보 및 학술연구 등의 목적으로 통계작성을 하는 경우
- 주문처리를 위해 주문/배송 정보를 관련 업체로 통보하는 경우
3항 이용자는 자신의 정보를 입력, 열람, 정정 요청할 수 있으며 당사는 이에 대해 입력, 열람, 정정 처리를 해 드립니다.
4항 '자이 페스티벌 이벤트'에 참여하는 회원의 개인정보는 이벤트 상품의 배송을 위해 'GS 건설'에 제공될 수 있음.

제 5장 의무 및 책임

제 1조 회사의 의무
1항 'FC Seoul'은 이용자에 대하여 계속적, 안정적으로 서비스를 제공할 의무가 있습니다.
2항 'FC Seoul'은 서비스 제공 설비를 운용 가능한 상태로 항상 유지해야 하며 장애가 발생했을 때에는 지체 없이 이를 수리, 복구하여 이용자의 서비스 이용에 불편이 없도록 합니다.
3항 'FC Seoul'은 이용자로부터 제기되는 불만이 정당하다고 인정되는 경우, 이를 지체 없이 처리해야 하며 즉시 처리가 곤란한 경우는 이용자에게 그 사유와 처리 일정을 통보해야 합니다.
4항 단 아래의 경우에는 회사가 책임을 지지 않습니다.
- 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우
- 이용자의 귀책사유로 인한 서비스 이용의 장애
- 이용자가 서비스를 이용하여 기대하는 손익이나 서비스를 통하여 얻은 자료
- 이용자가 서비스에 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 내용

제 2조 이용자의 의무
1항 비밀번호에 대한 관리 책임은 회원 본인에게 있습니다. 회원에게 부여된 비밀번호의 관리 소홀, 부정사용에 의하여 발생하는 모든 결과에 대한 책임은 회원에게 있습니다.
2항 이용자는 본 약관 및 관계법령을 준수하여야 하며, 당사의 업무수행에 지장을 초래하는 행위를 하여서는 안됩니다.
3항 이용자는 개인신상의 변동사항 발생시 개인정보를 즉시 수정하여야 하며 이와 관련된 책임은 본인에게 있습니다.
4항 자신의 회원정보가 부정하게 사용된 경우 회원은 반드시 회사에 그 사실을 통보해야 합니다.
5항 이용자는 이 약관에서 규정하는 사항과 서비스 이용안내 또는 주의사항을 준수하여야 합니다.
6항 이용자는 내용별로 회사가 서비스 공지사항에 게시하거나 별도로 공지한 이용 제한 사항을 준수하여야 합니다.
7항 이용자는 회사의 사전승낙 없이는 서비스를 이용하여 영업활동을 할 수 없으며, 영업활동의 결과와 이용자가 약관에 위반한 영업활동을 이용하여 발생한 결과에 대하여 회사는 책임을 지지 않습니다.
8항 이용자는 서비스를 이용할 때 다음 각 호의 행위를 하지 않아야 합니다.
- 이용자는 자신의 비밀번호를 제 3자에게 이용하게 해서는 안됩니다.
- 다른 회원으로 부정하게 사용하는 행위
- 서비스에서 얻은 정보를 회사의 사전승낙 없이 회원의 이용 이외의 목적으로 복제하거나 이를 출판 및 방송 등에 사용하거나 제 3자에게 제공하는 행위
- 제 3자의 저작권 등 기타 권리를 침해하는 행위
- 원활한 서비스 진행에 위반되는 내용의 정보, 문장, 도형 등을 타인에게 유포하는 행위
- 범죄와 결부된다고 객관적으로 판단되는 행위
- 기타 관계법령에 위배되는 행위

제 6장 기타

제 1조 링크 사이트
'FC Seoul'의 배너광고에 의한 연결사이트에서 제공하는 서비스에 대해서는 'FC Seoul'의 보증 책임이 없습니다.

제 2조 재판권 및 준거법
1항 'FC Seoul'과 이용자간에 발생한 분쟁에 관한 소송은 민사소송법상의 관할법원에 제기 합니다.
2항 'FC Seoul'과 이용자간에 제기된 소송에는 한국법을 적용합니다.

본 약관은 2005년 3월 1일부터 유효합니다.
									</pre>
								</div>
							</div>
						</div>
						<div class="line3">
							<div id="checkColor2" class="title unCheck">
								<input type="checkbox" id="check2" name="chk"/>
								<label class="on" for="check2">
									개인정보 수집 동의
									<span class="essential">(필수)</span>
									<span>자세한 내용은 개인정보처리방침을 확인하세요.</span>
								</label>
							</div>
							<div class="box">
								<div class="preWrap">
									<span>
									FC서울(이하 “회사”)은 FC서울 서비스를 이용하는 귀하의 개인정보를 아래와 같이 수집·이용합니다. 상세한 내용은 FC서울 개인정보처리방침에서 확인하실 수 있습니다.
									</span>
								</div>
								<div class="tblWrap">
									<table class="dw_table">
										<colgroup>
											<col width="15%">
											<col >
											<col width="30%">
											<col width="15%">
											<col width="15%">
										</colgroup>
										<thead style="height: 56px;">
											<tr>
												<th scope="col">서비스유형</th>
												<th scope="col">수집·이용 목적</th>
												<th scope="col">필수항목</th>
												<th scope="col">선택항목</th>
												<th scope="col">보유기간</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>FC서울 홈페이지</td>
												<td>홈페이지 서비스 이용, 이벤트 신청 등 회사가 제공하는 제반 서비스 공급
													<br/>상담·불만 처리 및 서비스 관련 정보제공
												</td>
												<td>이름, 생년월일, 성별, 로그인 ID, 주소, 휴대폰번호, 이메일, 연계정보(CI),
											중복가입확인정보(DI)</td>
												<td>자택전화번호,sms수신여부,이메일수신여부</td>
												<td>회원탈퇴시까지</td>
											</tr>
											<tr>
												<td>입장권 예매/시즌회원</td>
												<td>
													연간회원 이용 및 상품배송 등 회사가 제공하는 제반 서비스 공급<br/>
													상담·불만 처리 및 서비스관련 정보제공
												</td>
												<td>로그인ID,성명, 생년월일, 주소, 휴대폰번호 , 주문내역</td>
												<td></td>
												<td>거래기록 5년</td>
											</tr>
											<tr>
												<td>FC서울 멤버십</td>
												<td>GS&POINT적립 및 포인트 사용<br/>상담·불만 처리 및 서비스 관련 정보제공</td>
												<td>이름, 생년월일, 성별, 주소, 휴대폰번호, 이메일,웹아이디, 웹비밀번호,
											GS&POINT카드번호, 연계정보(CI),가입통신사,주소및우편물 수령지선택</td>
												<td>전화번호(자택/직장), 마케팅 정보수신 여부(EM, SMS, TM, DM)</td>
												<td>회원탈퇴시까지</td>
											</tr>
											<tr>
												<td>FC서울쇼핑몰</td>
												<td>상품배송 및 주문내역확인
													<br/>상담·불만 처리 및 서비스 관련 정보제공
												</td>
												<td>이름,아이디,휴대폰번호,주소, 거래내역</td>
												<td></td>
												<td>거래기록 5년</td>
											</tr>
											<tr>
												<td>경품수령</td>
												<td>경품 수령에 따른 회계처리
													<br/>상담·불만 처리 및 서비스 관련 정보제공
												</td>
												<td>일반상품 수령시 : 성명, 서명, 연락처, 경품종류
													<br/>고가경품 수령시 : 성명, 서명, 생년월일, 전화번호, 주소 경품종류
													<br/>14세 미만 고가 경품 수령시:법정 대리인 성명, 법정 대리인 연락처, 법정 대리인
													서명
												</td>
												<td></td>
												<td>수령리스트 5년</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="tblWrap">
									<table class="dw_table">
										<colgroup>
											<col width="25%">
											<col>
											<col width="30%">
											<col width="25%">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">서비스유형</th>
												<th scope="col">수집·이용 목적</th>
												<th scope="col">수집하는 항목</th>
												<th scope="col">보유 및 이용기간</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>
													홈페이지 회원가입
													<br/>
													14세미만 법정대리인 동의
												</td>
												<td>미성년자 법정대리인 동의</td>
												<td>이름, 생년월일, 이메일</td>
												<td>동의 후 지체 없이 파기</td>
											</tr>
											<tr>
												<td>이벤트신청</td>
												<td>이벤트 응모 및 상품배송 등 회사가 제공하는 제반 서비스 공급</td>
												<td>
													이름, 아이디, 이메일, 연락처
													<br/>
													회원 이벤트 내용에 포함된 개인정보
												</td>
												<td>이벤트 완료 후 지체없이 파기</td>
											</tr>
											<tr>
												<td>단체 입장권신청</td>
												<td>단체권문의응대</td>
												<td>이름, 아이디, 연락처, 주소</td>
												<td>희망경기 종료 후 즉시 파기</td>
											</tr>
											<tr>
												<td>승리버스</td>
												<td>승리버스탑승인원파악/서비스제공</td>
												<td>이름, 아이디, 연락처, 생년월일 , 동반인이름,동반인ID</td>
												<td>거래기록 5년</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="line4">
							<div id="checkColor3" class="title unCheck">
								<input type="checkbox" id="check3" name="chk"/>
								<label class="on" for="check3">
									개인정보 제3자 제공 동의에 대한 안내 
									<span class="essential">(필수)</span>
									<span>자세한 내용은 개인정보처리방침을 확인하세요.</span>
								</label>
							</div>
							<div class="box" style="border-bottom:1px solid #d2d2d2;">
								<p>
									개인정보 제 3자 제공에 동의를 거부하실 수 있으나, 필수항목의 경우 서비스 제공에 필수적으로 필요한
									정보이므로, 동의를 거부하실 경우 회원가입, 서비스 이용 등을 하실 수 없습니다.
								</p>
								<div class="tblWrap">
									<table>
										<thead>
											<tr>
												<th style="width: 150px;">제공받는자</th>
												<th>이용목적</th>
												<th>제공항목</th>
												<th style="width: 310px;">보유·이용기간</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td rowspan="2">GS칼텍스(주)</td>
												<td>
													GS&POINT 서비스 제공을 위한 회원여부 확인 및 식별, 회원서비스 운영, 회원 대상
													안내 사항의 고지, 포인트 관리 및 상품실적/이용내역 통계 분석, 부정이용 방지 및 비인가 사용 방지,
													고객불만사항 처리 등 고객 센터 운영 (필수적으로 이용)
												</td>
												<td>
													-필수항목: 웹 아이디 / 비밀번호(홈페이지 회원의 경우),
													고객번호,본인인증결과값(CI), GS&POINT 카드 비밀번호, 이름, 생년월일, 성별, 휴대전화번호,
													이메일, GS&POINT 포인트 잔액/적립/사용 내역, 상품 구매 내역, 서비스 이용 내역, 쿠키,
													로그분석 프로그램을 통한 생성 정보(웹 사이트 접속 시간, 접속 IP, 접속기록 (브라우저 정보,
													URL정보), 녹취 파일, 상담 이력 
													<br/>
													-선택항목:주소
												</td>
												<td rowspan="2">
													다음 중 어느 하나에 해당하는 기간까지
													<br/>
													 -제3자 제공동의 철회시
													 <br/>
													 -GS&POINT회원탈퇴시
													 <br/>
													 -GS&POINT서비스 이용이 1년간 없을시*
													 <br/>
													 *단, 타법령에 의하여 보존할 필요가 있는 경우 법령에서 규정한 일정 기간동안 이용자의 개인정보를
													   분리하여 보관하며, 보관기간 경과 후 파기 처리 합니다.
												</td>
											</tr>
											<tr>
												<td>
													마케팅을 위한 상품, 서비스 이용 실적 통계/분석(기획/관리, 상품/서비스 개발,
													경품/사은행사, 제휴 상품/서비스 안내 등 마케팅 활동) 및 고객별 맞춤형 상품/서비스 마케팅, 광고성
													정보의 전송, Push메시지전송(선택적으로 이용)
												</td>
												<td>
													-필수항목: 고객번호, 주거래 주유소, 상품/서비스/채널이용내역(이용
													일시/금액/매장정보), 포인트 정보(적립/사용/잔액), 쿠키, 로그분석 프로그램을 통해 생성된 정보(접속
													시간/IP, 브라우저 정보, URL), 웹 사이트 방문 정보(접근 메뉴 정보), 웹 아이디, 이름,
													생년월일, 성별, 휴대전화번호, 본인인증결과값(CI), 광고성 정보 수신(EM, 메세지서비스, TM,
													DM)동의 여부, Push메시지 동의 여부 
													<br/>
													-선택항목:Push토큰, 기기정보, 주소(자택,
													직장) 기념일(결혼기념일, 배우자/자녀 생일)
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="btnWrap">
							<a href="FcController?command=join2"id="agree" class="bp">동의</a>
							<a href="javascript:history.back();" class="bg">취소</a>
						</div>
					</div>
				</div>
			</form>
		</section>
	</div>
	<footer class="footer" id="footer">
		<section class="mainbot">
			<div class="contentwrap">
				<div class="sponsorwrap">
					<strong>
						main sponsors
					</strong>
					<div class="imgl">
						<a href="http://www.gs.co.kr" target="_blank">
							<img src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_01.jpg
							" alt="GS">
						</a>
					</div>
					<div class="imgr">
						<a href="http://www.gsenc.com/" target="_blank">
							<img src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_02.jpg?20230310" alt="GS건설">
						</a>
					</div>
					<div class="imgl">
						<a href="http://www.gscaltex.com" target="_blank">
							<img src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_03.jpg" alt="GS칼텍스]">
						</a>
					</div>
					<div class="imgr">
						<a href="http://www.gs25.gsretail.com" target="_blank">
							<img src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_05.jpg" alt="GS 25">
						</a>
					</div>
					<div class="imgl">
						<a href="http://www.gsshop.com" target="_blank">
							<img src="	https://www.fcseoul.com/resources/front/images/main/sponsor/img_04.jpg" alt="GS SHOP">
						</a>
					</div>
					<div class="imgr">
						<a href="http://www.gseps.com" target="_blank">
							<img src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_06.jpg" alt="GS EPS">
						</a>
					</div>
					<div class="imgl">
						<a href="http://www.gspower.com" target="_blank">
							<img src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_07.jpg" alt="GS 파워">
						</a>
					</div>
					
				</div>
				<div class="sponsorwrap">
					<strong>
						official sponsors
					</strong>
					<div class="imgl">
						<a href="http://www.shinhancard.com" target="_blank">
							<img src="	https://www.fcseoul.com/resources/front/images/main/sponsor/img_08.jpg
							" alt="신한카드">
						</a>
					</div>
					<div class="imgr">
						<a href="http://www.truefriend.com" target="_blank">
							<img src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_09.jpg" alt="한국투자증권">
						</a>
					</div>
					<div class="imgl">
						<a href="http://www.kbinsure.co.kr" target="_blank">
							<img src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_10.jpg" alt="KB손해보험">
						</a>
					</div>
					<div class="imgr">
						<a href="http://www.kbsec.com/go.able" target="_blank">
							<img src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_11.jpg" alt="KB증권">
						</a>
					</div>
					<div class="imgl">
						<a href="http://www.nhqv.com/" target="_blank">
							<img src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_12.jpg" alt="NH투자증권">
						</a>
					</div>
					<div class="imgr">
						<a href="http://www.uplus.co.kr" target="_blank">
							<img src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_13.jpg
							" alt="엘지유플러스">
						</a>
					</div>
					<div class="imgl">
						<a href="http://www.lgensol.com" target="_blank">
							<img src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_14.jpg" alt="엘지 에너지솔루션">
						</a>
					</div>
					<div class="imgr">
						<a href="http://www.lgchem.com" target="_blank">
							<img src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_15.jpg" alt="엘지화학">
						</a>
					</div>
				</div>
				<div class="sponsorwrap2">
					<strong>
						official kit supplier
					</strong>
					<div class="imgl">
						<a href="http://www.prospecs.com" target="_blank">
							<img src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_16.jpg" alt="프로스펙스">
						</a>
					</div>
				</div>
				<div class="sponsorwrap3">
					<strong>
						ofiicial principal partners
					</strong>
					<div class="imgl">
						<a href="http://www.tmon.co.kr" target="_blank">
							<img src="	https://www.fcseoul.com/resources/front/images/main/sponsor/img_18.jpg" alt="티몬">
						</a>
					</div>
					<div class="imgr">
						<a href="http://www.han-don.com" target="_blank">
							<img src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_17.jpg?20230310" alt="한돈">
						</a>
					</div>
					<div class="imgl">
						<a href="http://www.keumyang.com" target="_blank">
							<img src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_20.jpg?20230310" alt="1865">
						</a>
					</div>
					<div class="imgr">
						<a href="http://www.https://www.theclasshyosung.com/ko/desktop/passenger-cars.html" target="_blank">
							<img src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_21.jpg" alt="더클래스 효성">
						</a>
					</div>
					<div class="imgl">
						<a href="http://www.heineken.com/nl" target="_blank">
							<img src="	https://www.fcseoul.com/resources/front/images/main/sponsor/img_19.jpg" alt="하이네켄">
						</a>
					</div>
					<div class="imgr">
						<a href="http://www.hurom.co.kr/" target="_blank">
							<img src="	https://www.fcseoul.com/resources/front/images/main/sponsor/img_22.jpg?20230310" alt="휴롬">
						</a>
					</div>
					<div class="imgl">
						<a href="http://www.https://www.fedex.com/ko-kr/home.html" target="_blank">
							<img src="https://www.fcseoul.com/resources/front/images/main/sponsor/logo-37.jpg" alt="페덱스">
						</a>
					</div>
				</div>
				<div class="sponsorwrap">
					<strong>
						ofiicial partners
					</strong>
					<div class="imgl">
						<a href="http://seoultwotop.com/" target="_blank">
							<img src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_25.jpg" alt="서울투탑정형외과 재활의학과">
						</a>
					</div>
					<div class="imgr">
						<a href="http://www.madisesang.com/" target="_blank">
							<img src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_24.jpg" alt="마디세상병원">
						</a>
					</div>
					<div class="imgl">
						<a href="http://www.xn--9m1b22a80igvdu3q.kr/" target="_blank">
							<img src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_00.jpg" alt="더드림병원">
						</a>
					</div>
					<div class="imgr">
						<a href="https://www.seoul1hospital.com/" target="_blank">
							<img src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_23.jpg?20230310" alt="서울원병원">
						</a>
					</div>
					<div class="imgl">
						<a href="https://www.redcap.co.kr/" target="_blank">
							<img src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_27.jpg?20230310" alt="redcap투어">
						</a>
					</div>
					<div class="imgr">
						<a href="http://www.cocacola.co.kr/" target="_blank">
							<img src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_28.jpg
							" alt="코카콜라">
						</a>
					</div>
					<div class="imgl">
						<a href="https://amigonacho.com/" target="_blank">
							<img src="https://www.fcseoul.com/resources/front/images/main/sponsor/img_31.jpg" alt="아미고">
						</a>
					</div>
				</div>
			</div>
			<div style="clear:both;"></div>
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
							<img src="	https://www.fcseoul.com/resources/front/images/common/btn_vr.png" alt="경기장 vr 보기">
						</a>
					</div>
					<div class="pri2">
						<a href="http://www.youtube.com/user/FCSEOUL" target="_blank">
							<img src="https://www.fcseoul.com/resources/front/images/common/btn_sns3.png" alt="유튜브">
						</a>
					</div>
					<div class="pri2">
						<a href="https://instagram.com/fcseoul/" target="_blank">
							<img src="https://www.fcseoul.com/resources/front/images/common/btn_sns2.png" alt="인스타그램">
						</a>
					</div>
s					<div class="pri2">
						<a href="https://www.facebook.com/fcseoul" target="_blank">
							<img src="https://www.fcseoul.com/resources/front/images/common/btn_sns1.png" alt="페이스북">
						</a>
					</div>
				</div>
				<div style="clear:both;"></div>
			</div>
			<div class="footer2">
				<div class="foot1">
					<img src="https://www.fcseoul.com/resources/front/images/common/img_logo_gray.png" alt="FC SEOUL">
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
					<img src="	https://www.fcseoul.com/resources/front/images/common/img_award.png">
				</div>
			</div>
		</div>
	</footer>
</body>
</html>