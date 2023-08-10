<%@page import="dto.GoodsDto"%>
<%@page import="dao.MatchInfoDao"%>
<%@page import="dto.MatchInfoDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<%@page import="dto.MainPhotoDto" %>
<%@page import="dao.MainPhotoDao" %>
<%@page import="dto.MainNewsDto" %>
<%@page import="dao.MainNewsDao" %>
<%@page import="dto.MainNoticeDto" %>
<%@page import="dao.MainNoticeDao" %>
<%@page import = "user.UserDTO" %>
<%@page import = "user.UserDAO" %>
<%@page import = "dto.RankDto" %>
<%@page import = "dao.RankDao" %>
<%@page import = "dao.MatchInfoDao" %>
<%@page import = "dto.MatchDBDto" %>

<%
	
	String id = (String)session.getAttribute("id");
	String pw = (String)session.getAttribute("pw");
	
	ArrayList<MainPhotoDto> pdto = (ArrayList<MainPhotoDto>)request.getAttribute("pdto");
	ArrayList<MainPhotoDto> phdto = (ArrayList<MainPhotoDto>)request.getAttribute("phdto");
	ArrayList<MainNewsDto> ndto = (ArrayList<MainNewsDto>)request.getAttribute("ndto");
	ArrayList<MainNoticeDto> ntdto = (ArrayList<MainNoticeDto>)request.getAttribute("ntdto");
	ArrayList<RankDto> radto = (ArrayList<RankDto>)request.getAttribute("radto");
	ArrayList<RankDto> aradto = (ArrayList<RankDto>)request.getAttribute("aradto");
	ArrayList<MatchDBDto> prevdto = (ArrayList<MatchDBDto>)request.getAttribute("prevdto");
	ArrayList<MatchDBDto> nextdto = (ArrayList<MatchDBDto>)request.getAttribute("nextdto");
	ArrayList<MatchDBDto> nextnextdto = (ArrayList<MatchDBDto>)request.getAttribute("nextnextdto");
	ArrayList<GoodsDto> goodsdto = (ArrayList<GoodsDto>)request.getAttribute("gdto");
	ArrayList<GoodsDto> goodsbandto = (ArrayList<GoodsDto>)request.getAttribute("goodsdto");
	ArrayList<GoodsDto> goodsbandto2 = (ArrayList<GoodsDto>)request.getAttribute("goodsdto2");
	ArrayList<GoodsDto> goodsbandto3 = (ArrayList<GoodsDto>)request.getAttribute("goodsdto3");
	ArrayList<GoodsDto> goodsrcdto = (ArrayList<GoodsDto>)request.getAttribute("goodsrcdto");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>FC SEOUL</title>
	<link rel="shortcut icon" type="image/x-icon" href="https://fcseoulpub.s3.ap-northeast-2.amazonaws.com/multi01/Club/Club/1675316444376.png">
	<link rel="stylesheet" href="css/FcMain.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	
	<!-- bxslider -->
	
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
	<script>
	$(function () {
       $(document).ready(function(){
	        $(".slider").bxSlider({
	        	controls : false,
	        	auto : true,
	        	touchEnabled:false
	        });
       
           $(".mslide").bxSlider({
        	   nextSelector: ".mbtnr",  
        	    prevSelector: ".mbtnl" ,
        	    pager: false,
        	    touchEnabled:false
           });
          
           $(".slide3").bxSlider({
        	   controls : false,
	        	auto : true,
	        	touchEnabled:false
           });
//            $(".inner1").bxSlider({
              	
//            });    
         });   
     	$(document).ready(function() {
			$(".bx-next").empty();
			$(".bx-prev").empty();
			
		})
		
	});
	</script>
	<script>
		let v1 = false;
		let v2 = false;
		let page_requested = 1;
		function request_one_page() {
			page_requested += 1;
			$.ajax({
				type:'get',
				url:'PhotoServlet',
				data:{'pageNum':page_requested},
				datatype:'json',
				success:function(data){
					console.log(data);
 					for(var i =0;i<data.length;i++){
 						let str = "<div class= \"youtube\">"
 								+ "<a>"
 								+ "<img src ='"+data[i].image+"'>"
 								+ "<div class= 'stbox'>"
 								+ "<p class = 'snstext'>"
 								+ data[i].title
 								+ "</p>"
 								+ "</div>"
 								+ "<a>"
 								+ "</div>"
 						$(".snsbox").append(str);
								
 					} 
					/* alert("!!!");
					console.log(data); */
				},error: function (request, status, error) {
			        console.log("code: " + request.status)
			        console.log("message: " + request.responseText)
			        console.log("error: " + error);
			        alert("에러");
			    }
			});
		}
		
		
		
		$(function(){
			
			$(".allfaq").click(function() {
				if(<%=id%> == null){
					location.href="FcController?command=login";
				}else{
					/* faq로 */
					location.href ="FcController?command=main";
				}
			});
			$(".allqna").click(function() {
				if(<%=id%>== null){
					location.href = "FcController?command=login";
				}else{
					location.href = "FcController?command=QA";
				}
			})
			
			
			
			let smSlider = $(".inner1").bxSlider({
					nextSelector: ".rbtn",  
	        	    prevSelector: ".lbtn" ,
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
			
			
			$("#mobtn").click(function() {
				request_one_page();
			})
			
			
			
		});
    	function hideFunc() {
    		$(".menulist li").removeClass("over");
    		$(".detailmenu li.dm").hide();
    		$(".bannerlayer2").hide();
    	} 	
    	function ready() {
			alert("준비중입니다.");
		}
    	
    	// 랭크 
	 	const settings = {
	 			async: true,
	 			crossDomain: true,
	 			url: 'https://api-football-v1.p.rapidapi.com/v3/standings?season=2023&league=292',
	 			method: 'GET',
	 			headers: {
	 				'X-RapidAPI-Key': 'e74b5b3e8bmshfa41825a94840f5p12a120jsn586a8ea22fda',
	 				'X-RapidAPI-Host': 'api-football-v1.p.rapidapi.com'
	 			}
	 		};

	 	    $.ajax(settings).done(function (response) {
	 	        console.log(response.response[0].league.standings[0]);
	 	         $.ajax({
	 	             method: 'post',
	 	             url: 'FcServlet',
	 	             traditional: true,
	 	             data: {
	 	               data: JSON.stringify(response.response[0].league.standings[0])
	 	             },
	 	             dataType: 'json',
	 	             success: function (response) {
	 	                console.log("성공");
	 	             }
	 	           });
	 	    });
	 	    
	 	    // 매치 정보
	 	    const settings1 = {
	 				async: true,
	 				crossDomain: true,
	 				url: 'https://api-football-v1.p.rapidapi.com/v3/fixtures?season=2023&team=2766',
	 				method: 'GET',
	 				headers: {
	 					'X-RapidAPI-Key': 'e74b5b3e8bmshfa41825a94840f5p12a120jsn586a8ea22fda',
	 					'X-RapidAPI-Host': 'api-football-v1.p.rapidapi.com'
	 				}
	 			};

	 			$.ajax(settings1).done(function (response) {
	 				console.log(response.response);
	 				$.ajax({
	 					method:'post',
	 					url:'MatchInfoServlet',
	 					tranditional:true,
	 					data:{
	 						data:JSON.stringify(response.response)
	 					},
	 					dataType:'json',
	 					succes:function(response){
	 						console.log("성공");
	 					}
	 				})
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
	<div class="ticketbox">
		<span> <img alt="k리그 로고" src="https://files.fcseoul.com/multi01/Match/League/1673574666175.png"> </span>
		<%
			for(MatchDBDto matdbdto : nextdto) {
		%>
		<strong><%=matdbdto.getM_date()%></strong>
		<span><%=matdbdto.getStadium()%></span>
		<div class="matchinfo">
			<div class="mi1">
				<div class="home">
 					<img alt="homelogo" src="<%=matdbdto.getHome_logo()%>">
					<p style="font-size: 14px"><%=matdbdto.getHome_name()%></p>
				</div>
				<div class="vs"> 
					<p>VS</p>
				</div>
				<div class="away">
					<img alt="awaylogo" src="<%=matdbdto.getAway_logo()%>">
					<p style="font-size: 14px;"><%=matdbdto.getAway_name()%></p>
				</div>
				</div>
		</div>
		<div class="ticketbtn" style="display: <%=matdbdto.getIs_home().equals("True")? "block":"none"%>">
			<a href="FcController?command=ticketing">티켓예매</a>
		</div>
		<%
			}
		%>
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
	<div class="main">
		<div class="main1">
			<div class="slider">
				<div class="slide">
					<img alt="" src="https://files.fcseoul.com/multi01/Imgs/mainIndex/1678769793177.jpg">
				</div>
				<div class="slide">
					<img alt="" src="https://files.fcseoul.com/multi01/Imgs/mainIndex/1678769817610.jpg">
				</div>
				<div class="slide">
					<img alt="" src="https://files.fcseoul.com/multi01/Imgs/mainIndex/1678769831168.jpg">
				</div>
			</div>
		</div>
		<div class="main2">
			<div class="submain2">
				<div class="rank">
					<div class="nowrank">
						<span>현재 순위</span>
						<strong>3위</strong>
						<a href="FcController?command=rankingScore">
							<img alt="더보기" src="https://www.fcseoul.com/resources/front/images/main/btn_more_32.png">
						</a>
					</div>
					<table class="ranktable">
						<tr>
							<th>순위</th>
							<th>팀명</th>
							<th>경기수</th>
							<th>승점</th>
							<th>승</th>
							<th>무</th>
							<th>패</th>
						</tr>
						<%for(RankDto rdto:aradto) {%>
						<tr>
							<td><%=rdto.getRank() %></td>
							<td>
								<img alt="" src="<%=rdto.getTeam_logo()%>">
								<%=rdto.getTeam() %>
							</td>
							<td><%=rdto.getGames() %></td>
							<td><%=rdto.getPoint() %></td>
							<td><%=rdto.getWin() %></td>
							<td><%=rdto.getDraw() %></td>
							<td><%=rdto.getLose() %></td>
						</tr>
						<%} %>
						
					</table>
				</div>
				<div class="match">
					<div class="mtop">
						<button class="mbtnl"></button>
						<div class="middle">
							<h3>FC SEOUL MATCHES</h3>
						</div>
						<button class="mbtnr"></button>
					</div>
					<div class="seoulmatch">
						<div class="seoulslider mslide">
							<div class="pregame ">
							<%for(MatchDBDto madto : prevdto){ %>
								<div class="gameinfo">
									<div class="gi1">
										<div class="ml">
											<img class="logo" alt="homelogo" src="<%=madto.getHome_logo()%>">
											<p><%=madto.getHome_name() %></p>
										</div>
										<div class="mc">
											<p>
												<img alt="" src="https://files.fcseoul.com/multi01/Match/League/1673574666175.png">
												K리그1
											</p>
											<p class="">
												<b><%=madto.getHome_fulltime() %></b>
												<span>:</span>
												<b><%=madto.getAway_fulltime()%></b>
											</p>
											<p>
												<span><%=madto.getM_date() %></span>
											</p>
											<p>
												<%=madto.getStadium() %>
												<span class=<%=madto.getIs_home().equals("True")?"mhome":"away"%>><%=madto.getIs_home().equals("True")? "H":"A" %></span>
											</p>
											
										</div>
										<div class="mr">
											<img class="logo" alt="awaylogo" src="<%=madto.getAway_logo()%>">
											<p><%=madto.getAway_name() %></p>
										</div>
									</div>
								</div>
								<%} %>
								<div class="matchbtn">
									<a href="FcController?command=matchInfoPrev">경기결과</a>
								</div>
							</div>
							<div class="nowgame ">
							<%for(MatchDBDto matdto: nextdto){ %>
								<div class="gameinfo">
									<div class="gi1">
										<div class="ml">
											<img class="logo" alt="homelogo" src="<%=matdto.getHome_logo()%>">
											<p><%=matdto.getHome_name() %></p>
										</div>
										<div class="mc">
											<p>
												<img alt="" src="	https://files.fcseoul.com/multi01/Match/League/1673574666175.png">
												K리그1
											</p>
											<p class="">VS</p>
											<p>
												<span><%=matdto.getM_date() %></span>
											</p>
											<p>
												<%=matdto.getStadium() %>
												<span class=<%=matdto.getIs_home().equals("True")?"mhome":"away"%>><%=matdto.getIs_home().equals("True")? "H":"A" %></span>
											</p>
											
										</div>
										<div class="mr">
											<img class="logo" alt="awaylogo" src="<%=matdto.getAway_logo()%>">
											<p><%=matdto.getAway_name() %></p>
										</div>
									</div>
								</div>
									<a href="" class="awaybtn" style="display: <%=matdto.getIs_home().equals("False")?"flex":"none"%>">FC서울 원정 경기</a>
									<a href="FcController?command=ticketing" class="hbtn" style="display: <%=matdto.getIs_home().equals("True") ? "flex":"none" %>">티켓예매</a>
								<%} %>
							</div>
							<div class="nextgame ">
							<%for(MatchDBDto madbdto: nextnextdto) {%>
								<div class="gameinfo">
									<div class="gi1">
										<div class="ml">
											<img class="logo" alt="homelogo" src="<%=madbdto.getHome_logo()%>">
											<p><%=madbdto.getHome_name() %></p>
										</div>
										<div class="mc">
											<p>
												<img alt="" src="https://files.fcseoul.com/multi01/Match/League/1673574666175.png">
												K리그1
											</p>
											<p class="">VS</p>
											<p>
												<span><%=madbdto.getM_date() %></span>
											</p>
											<p>
												<%=madbdto.getStadium() %>
												<span class=<%=madbdto.getIs_home().equals("True")?"mhome":"away"%>><%=madbdto.getIs_home().equals("True")? "H":"A" %></span>
											</p>
											
										</div>
										<div class="mr">
											<img class="logo" alt="awaylogo" src="<%=madbdto.getAway_logo()%>">
											<p><%=madbdto.getAway_name() %></p>
										</div>
									</div>
								</div>
								<a href="" class="awaybtn" style="display: <%=madbdto.getIs_home().equals("False")?"flex":"none"%>">FC서울 원정 경기</a>
									<a href="FcController?command=ticketing" class="hbtn" style="display: <%=madbdto.getIs_home().equals("True") ? "flex":"none" %>">티켓예매</a>
								<%} %>
							</div>
						</div>
					</div>
				</div>
				<div>
					<img alt="티켓안내" src="https://www.fcseoul.com/resources/front/images/main/homeTicket.jpg">
				</div>
			</div>
		</div>
		<div class="main3">
			<div class="submain3">
				<div class="m3left">
					<h3>FC SEOUL OFFICIAL ONLINE SHOP</h3>
					<div class="goshop">
						<a href="FcController?command=main" target="_blank">쇼핑몰 바로가기</a>
					</div>
					<h4>Best Product</h4>
					<ul>
					<%for(GoodsDto gdto:goodsdto) {%>
						<li>
							<a href="FcController?goodsId=<%=gdto.getGoods_id()%>&command=detailPage" target="_blank">
								<div class="m3img">
									<img alt="" src="<%=gdto.getGoods_img()%>">
								</div>
								<p><%=gdto.getGoods_name() %></p>
								<p>₩<%=gdto.getPrice() %></p>
							</a>
						</li>
						<%} %>
					</ul>
				</div>
				<div class="m3right">
					<h4>Recommend products</h4>
					<div class="rcitem ">
						<div class="mr3slide">
							<ul class="slide3">
								<li>
									<a class="rp" href="FcController?command=detailPage&goodsId=92" target="_blank">
										<div class="mrimg">
											<img alt="" src="https://files.fcseoul.com/multi01/SHOP/Product/Product/2022814243447_S.jpg">
										</div>
										<p> 22. FC서울 MINI레인보우 (조영욱)</p>
										<p>₩15000</p>
									</a>
								</li>
								<li>
									<a class="rp" href="FcController?command=detailPage&goodsId=90" target="_blank">
										<div class="mrimg">
											<img alt="" src="https://files.fcseoul.com/multi01/SHOP/Product/Product/2022814230911_S.jpg">
										</div>
										<p> 22. FC서울 포토레인보우 (나상호)</p>
										<p>₩10,000</p>
									</a>
								</li>
								<li>
									<a class="rp" href="FcController?command=detailPage&goodsId=91" target="_blank">
										<div class="mrimg">
											<img alt="" src="	https://files.fcseoul.com/multi01/SHOP/Product/Product/2022814231570_S.jpg">
										</div>
										<p> 22. FC서울 포토레인보우 (오스마르)</p>
										<p>₩10,000</p>
									</a>
								</li>
							</ul>
					</div>
				</div>
			</div>
		</div>
		</div>
		<div class="main4">
			<div class="submain4">
				<div class="m4img">
					<img alt="" src="https://www.fcseoul.com/resources/front/images/main/event_default.jpg">
				</div>
				<div class="m4img m4down">
					<div class="m4text">
						<p>Official App</p>
						<p>편리한 FC서울 공식 앱을 다운받아보세요.</p>
					</div>
					<div class="download">
						<a href="">
							<img alt="" src="https://www.fcseoul.com/resources/front/images/main/btn_download_a.jpg">
						</a>
						<a href="">
							<img alt="" src="	https://www.fcseoul.com/resources/front/images/main/btn_download_i.jpg">
						</a>
					</div>
				</div>
				<div class="m4img">
					<a href="" class="m4">
						<img alt="" src="https://www.fcseoul.com/resources/front/images/main/btn_banner2_3.jpg?220520">
					</a>
					<a href="" class="m4">
						<img alt="" src="https://www.fcseoul.com/resources/front/images/main/btn_banner2_5.jpg">
					</a>
				</div>
			</div>
		</div>
		<div class="main5">
			<div class="submain5">
				<h3>FC SEOUL PHOTO</h3>
				<div class="snsbtn">
					<ul class="seoulsns">
						<li >
							<button class="sbtn snsbutton">ALL</button>
						</li>
						<li >
							<button class="sbtn">Instagram</button>
						</li>
						<li >
							<button class="sbtn">Youtube</button>
						</li>
					</ul>
				</div>
				<div class="snsbox">
				

					<%for(MainPhotoDto phodto : phdto) {%>
					<div class="youtube">
						<a href="FcController?command=photoDetail&bno=<%=phodto.getBno()%>">
							<img alt="" src="<%=phodto.getImage() %>">
							<div class="stbox">
								<p class="snstext">
									<%=phodto.getTitle() %>
								</p>
							</div>
							<!-- <p class="youtubeimg"></p> -->
						</a>
					</div>
					<%}%>
			<!-- 		<div class="youtube">
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
					</div> -->
	<!-- 				
					<div class="insta">
						<a href="">
							<img alt="" src="https://scontent-nrt1-1.cdninstagram.com/v/t51.29350-15/353798227_808796260384059_4990971618261906937_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=8ae9d6&_nc_ohc=_Wq1U4vHJbIAX98wTFr&_nc_ht=scontent-nrt1-1.cdninstagram.com&edm=ANo9K5cEAAAA&oh=00_AfAOUwlV6DHcAGVioCsxPSegcHU6w16fQdz4DhWctgaqVg&oe=64B64BBC">
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
							<img alt="" src="https://scontent-nrt1-1.cdninstagram.com/v/t51.29350-15/353798227_808796260384059_4990971618261906937_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=8ae9d6&_nc_ohc=_Wq1U4vHJbIAX98wTFr&_nc_ht=scontent-nrt1-1.cdninstagram.com&edm=ANo9K5cEAAAA&oh=00_AfAOUwlV6DHcAGVioCsxPSegcHU6w16fQdz4DhWctgaqVg&oe=64B64BBC">
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
							<img alt="" src="https://scontent-nrt1-1.cdninstagram.com/v/t51.29350-15/353798227_808796260384059_4990971618261906937_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=8ae9d6&_nc_ohc=_Wq1U4vHJbIAX98wTFr&_nc_ht=scontent-nrt1-1.cdninstagram.com&edm=ANo9K5cEAAAA&oh=00_AfAOUwlV6DHcAGVioCsxPSegcHU6w16fQdz4DhWctgaqVg&oe=64B64BBC">
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
							<img alt="" src="https://scontent-nrt1-1.cdninstagram.com/v/t51.29350-15/353798227_808796260384059_4990971618261906937_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=8ae9d6&_nc_ohc=_Wq1U4vHJbIAX98wTFr&_nc_ht=scontent-nrt1-1.cdninstagram.com&edm=ANo9K5cEAAAA&oh=00_AfAOUwlV6DHcAGVioCsxPSegcHU6w16fQdz4DhWctgaqVg&oe=64B64BBC">
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
										 -->
					<!-- <div class="youtube">
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
					</div> -->
					
					
					
				</div>
				
				<div class="morebtn">
					<button id="mobtn"></button>
				</div>
				
				<div class="bottomsns">
						<div class="bs1">
							<strong>FC SEOUL의 더 많은 소식을 SNS를 통해 만나보세요.</strong>
							<ul>
								<li>
									<a href="">
										<img alt="" src="https://www.fcseoul.com/resources/front/images/main/btn_sns1.png">
									</a>
								</li>
								<li>
									<a href="">
										<img alt="" src="https://www.fcseoul.com/resources/front/images/main/btn_sns2.png">
									</a>
								</li>
								<li>
									<a href="">
										<img alt="" src="https://www.fcseoul.com/resources/front/images/main/btn_sns3.png">
									</a>
								</li>
							</ul>
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