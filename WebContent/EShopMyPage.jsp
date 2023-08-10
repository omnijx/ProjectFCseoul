<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dao.EShopMyPageDao"%> 
<%@page import="dto.EShopMyPageDto"%>
<%@page import="java.util.ArrayList"%>

<%

	ArrayList<EShopMyPageDto> myPageOHList = (ArrayList<EShopMyPageDto>)request.getAttribute("myPageOHList");
	ArrayList<EShopMyPageDto> myPageWLList = (ArrayList<EShopMyPageDto>)request.getAttribute("myPageWLList");
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>FC서울 공식 쇼핑몰</title>
	<link rel="shortcut icon" type="image/x-icon" href="https://fcseoulpub.s3.ap-northeast-2.amazonaws.com/multi01/Club/Club/1675316444376.png">
	<link rel="stylesheet" href="css/EShopMyPage.css">
	<script src="js/jquery-3.7.0.min.js"></script>
	<script>
		function openBtn() {
			let btn1 = document.getElementById("btn1");
			let btn2 = document.getElementById("btn2");
			let dark = document.getElementById("bg_dark");
			if(btn1.style.display == "none") {
				btn1.style.display = "block";
				btn2.className = "category fl view_all on";
				dark.style.display = "block";
			}
		}
		function closeBtn() {
			let btn1 = document.getElementById("btn1");
			let btn2 = document.getElementById("btn2");
			let dark = document.getElementById("bg_dark");
			if(btn1.style.display == "block") {
				btn1.style.display = "none";
				btn2.className = "category fl view_all";
				dark.style.display = "none";
			}
		}
		$(function(){
			$(".cuponAlert").click(function(){
				alert("준비중입니다.")
			});
		});
	</script>
</head>
<body>
	<div id="uppermain">
		<div class="mainlogo fl" onclick="location.href='FcController?command=main'">
			<img src="https://www.fcseoul.com/resources/shop/_img/renew/logo.png"/>
		</div>
		<div class="searchbox fl">
			<form action="FcController">
				<input type="hidden" name="type" value="search"/>
				<input type="hidden" name="page" value=1/>
				<input type="hidden" name="command" value="catePage"/>
				<input type="text" name="maintxt" id="maintxt"/>
				<button type="submit"></button>
			</form>
		</div>
		<div class="topmenu fl">
			<%
			if(session.getAttribute("id") == null) {
			%>
				<span onclick="location.href='FcController?command=login'">로그인</span>
			<%	
			} else {
			%>
				<span onclick="location.href='FcController?command=logout'">로그아웃</span>	
			<%	
			}
			%>
			<span onclick="location.href='FcController?command=myPage'">마이페이지</span>
			<span onclick="location.href='FcController?command=cart'">장바구니</span>
		</div>
		<div style="clear:both;"></div>
	</div>
	<div id="categorybackground">
		<div class="maincategory">
			<div class="category fl" onclick="location.href='FcController?type=new&command=catePage'">
				<span>NEW</span>
			</div>
			<div class="category fl" onclick="location.href='FcController?type=유니폼&command=catePage'">
				<span>유니폼</span>
			</div>
			<div class="category fl" onclick="location.href='FcController?type=트레이닝웨어&command=catePage'">
				<span>트레이닝웨어</span>
			</div>
			<div class="category fl" onclick="location.href='FcController?type=패션&command=catePage'">
				<span>패션</span>
			</div>
			<div class="category fl" onclick="location.href='FcController?type=응원용품&command=catePage'">
				<span>응원용품</span>
			</div>
			<div class="category fl" onclick="location.href='FcController?type=기념품&command=catePage'">
				<span>기념품</span>
			</div>
			<div class="category fl" onclick="location.href='FcController?type=어린이&command=catePage'">
				<span>어린이</span>
			</div>
			<div class="category fl" onclick="location.href='FcController?type=sale&command=catePage'">
				<span>SALE</span>
			</div>
			<div id="btn2" class="category fl view_all">
				<button type="button" onclick="openBtn()">전체메뉴</button>
			</div>
		</div>
		<div style="clear:both;"></div>
	</div>
	<div class="all_menu">
		<div id="btn1" class="all_menu_box" style="display: none;">
			<div class="all_content_box">
				<div class="all_category_box fl">
					<div class="cate_box_title">
						<span>카테고리</span>
					</div>
					<div>
						<a href="FcController?type=new&command=catePage">
							NEW
						</a>
					</div>
					<div>
						<a href="FcController?type=유니폼&command=catePage">
							유니폼
						</a>
					</div>
					<div>
						<a href="FcController?type=트레이닝웨어&command=catePage">
							트레이닝 웨어
						</a>
					</div>
					<div>
						<a href="FcController?type=패션&command=catePage">
							패션
						</a>
					</div>
					<div>
						<a href="FcController?type=응원용품&command=catePage">
							응원용품
						</a>
					</div>
					<div>
						<a href="FcController?type=기념품&command=catePage">
							기념품
						</a>
					</div>
					<div>
						<a href="FcController?type=어린이&command=catePage">
							어린이
						</a>
					</div>
					<div>
						<a href="FcController?type=sale&command=catePage">
							SALE
						</a>
					</div>
					<div>
						<a href="FcController?type=전체상품&command=catePage">
							전체상품보기
						</a>
					</div>
				</div>
				<div class="all_mypage_box fl">
					<div class="mypage_box_title">
						<span>마이페이지</span>
					</div>
					<div>
						<a href="FcController?command=orderHistory">
							나의주문이력
						</a>
					</div>
					<div>
						<a href="FcController?command=cart">
							장바구니
						</a>
					</div>
					<div>
						<a href="FcController?command=wishList">
							찜한상품
						</a>
					</div>
				</div>
				<div class="all_service_box fl">
					<div class="service_box_title">
						<span>고객센터</span>
					</div>
					<div>
						<a href="FcController?command=FAQ">
							FAQ
						</a>
					</div>
					<div>
						<a href="FcController?command=EQA">
							Q&A
						</a>
					</div>
					<div>
						<a href="FcController?command=enotice">
							공지사항
						</a>
					</div>
					<div>
						<a href="FcController?command=terms">
							이용약관
						</a>
					</div>
					<div>
						<a href="FcController?command=privacy">
							개인정보
						</a>
					</div>
					<div style="clear:both;"></div>
				</div>
				<div class="close_button">
					<input type="button" onclick="closeBtn()"/>
					
				</div>
				<div style="clear:both;"></div>
			</div>
		</div>
	</div>
	<div class="menubar">
		<div class="qmenu">
			<span>QUICK MENU</span>
			<div class="m1">
				<a href="FcController?command=myPage">
					<span>마이페이지</span>
				</a>
			</div>
			<div class="m2">
				<a href="FcController?command=cart">
					<span>장바구니</span>
				</a>
			</div>
			<div class="m3">
				<a href="FcController?command=wishList">
					<span>찜한상품</span>
				</a>
			</div>
		</div>
		<div class="recentmenu">
			<span>최근 본 상품</span>
		</div>
		<div style="clear:both;"></div>
	</div>
	<div class="mypage_container">
		<div class="mypage_content_wrap">
			<div class="mypage_content_box">
				<div class="left_banner">
					<div class="left_banner_title">
						<a href="">
							<img src="https://www.fcseoul.com/resources/shop/_img/mypage/lnb_title.gif"/>
						</a>
					</div>
					<div class="left_banner_list">
						<div class="tab">
							<a href="FcController?command=orderHistory">
								<img src="https://www.fcseoul.com/resources/shop/_img/mypage/lnb_m0.gif"/>
							</a>
						</div>
						<div class="tab">
							<a href="FcController?command=cart">
								<img src="https://www.fcseoul.com/resources/shop/_img/mypage/lnb_m1.gif"/>
							</a>
						</div>
						<div class="tab">
							<a href="FcController?command=wishList">
								<img src="https://www.fcseoul.com/resources/shop/_img/mypage/lnb_m2.gif"/>
							</a>
						</div>
						<div class="tab cuponAlert">
							<a href="">
								<span>- 쿠폰함</span>
							</a>
						</div>
					</div>
				</div>
				<div class="mypage_content">
					<table width="100%">
						<tbody>
							<tr>
								<td class="sub_t1">
									HOME > 
									<span class="sub_t2">마이페이지</span>
								</td>
							</tr>
							<tr>
								<td class="mypage_title">
									<img src="https://www.fcseoul.com/resources/shop/_img/mypage/title_mypage.gif"/>
									<img src="https://www.fcseoul.com/resources/shop/_img/product/title_fcseoul.gif"/>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="br15"></div>
					<table width="100%">
						<tbody>
							<tr>
								<td>
									<div class="mypage_content_title">
										<div class="mypage_content_t1 fl">
											<img src="https://www.fcseoul.com/resources/shop/_img/mypage/mypage_txt01.gif"/>
										</div>
										<div class="mypage_content_t2 fr">
											<a href="FcController?command=orderHistory">
												<img src="https://www.fcseoul.com/resources/shop/_img/btn/btn_more.gif"/>
											</a>
										</div>
										<div style="clear:both;"></div>
									</div>
									<table width="100%" class="content_title_box1">
										<colgroup>
											<col width="20%"/>
											<col width="12%"/>
											<col width="12%"/>
											<col width="*"/>
										</colgroup>
										<tbody>
											<tr>
												<th>주문번호</th>
												<th>결제방법</th>
												<th>주문일</th>
												<th>주문/배송방법</th>
											</tr>
											<%
											for(EShopMyPageDto ohDto : myPageOHList) {
											%>	
												<tr>
													<td class="order_num"><a href="FcController?oNum=<%=ohDto.getoNum()%>&command=orderTracking"><b><%=ohDto.getoNum() %></b></a></td>
													<td><%=ohDto.getPayWay() %></td>
													<td class="date"><%=ohDto.getPayDate() %></td>
													<td class="pay_step"><b><%=ohDto.getdState() %></b></td>
												</tr>
											<%	
											}
											%>
										</tbody>
									</table>
									<div class='br30'></div>
									<div class="mypage_content_title">
										<div class="mypage_content_t1 fl">
											<img src="https://www.fcseoul.com/resources/shop/_img/mypage/mypage_txt02.gif"/>
										</div>
										<div class="mypage_content_t2 fr">
											<a href="FcController?command=wishList">
												<img src="https://www.fcseoul.com/resources/shop/_img/btn/btn_more.gif"/>
											</a>
										</div>
										<div style="clear:both;"></div>
									</div>
									<table width="100%" class="content_title_box2">
										<colgroup>
											<col width="15%"/>
											<col width="*"/>
											<col width="13%"/>
											<col width="13%"/>
										</colgroup>
										<tbody>
											<tr>
												<th colspan="2">상품명</th>
												<th>가격</th>
												<th>등록일</th>
											</tr>
											<%
											for(EShopMyPageDto wlDto : myPageWLList) {
											%>	
												<tr class="mOver">
													<td>
														<a href="FcController?goodsId=<%=wlDto.getGoodsId()%>&command=detailPage">
															<img src="<%=wlDto.getGoodsImg()%>"/>
														</a>
													</td>
													<td class="prd_name"><a href="FcController?goodsId=<%=wlDto.getGoodsId()%>&command=detailPage"><%=wlDto.getGoodsName() %></a></td>
													<td class="f_red"><b><%=wlDto.getPrice() %> 원</b></td>
													<td class="date"><%=wlDto.getwDate() %></td>
												</tr>
											<%	
											}
											%>
										</tbody>
									</table>
									<div class="br30"></div>
									<div class="mypage_content_title">
										<div class="mypage_content_t1 fl">
											<img src="https://www.fcseoul.com/resources/shop/_img/mypage/mypage_txt03.gif"/>
										</div>
										<div style="clear:both;"></div>
									</div>
									<table width="100%" class="content_title_box2">
										<colgroup>
											<col width="10%"/>
											<col width="*"/>
											<col width="10%"/>
											<col width="10%"/>
											<col width="10%"/>
										</colgroup>
										<tbody>
											<tr>
												<th>번호</th>
												<th>제목</th>
												<th>작성자</th>
												<th>등록일</th>
												<th>상태</th>
											</tr>
											<tr>
												<td colspan="5">등록된 글이 없습니다.</td>
											</tr>
										</tbody>
									</table>
									<div class="page_box_wrap">
										<div class="page_box">
											<a href="">
												<img src="https://www.fcseoul.com/resources/shop/_img/board/pg_prev2.gif"/>
											</a>
											<a href="">
												<img src="https://www.fcseoul.com/resources/shop/_img/board/pg_prev.gif"/>
											</a>
											&nbsp;&nbsp;
											<a href="" class="pg">
												<b style="color:#d2232a">1</b>
											</a>
											&nbsp;&nbsp;
											<a href="">
												<img src="https://www.fcseoul.com/resources/shop/_img/board/pg_next.gif"/>
											</a>
											<a href="">
												<img src="https://www.fcseoul.com/resources/shop/_img/board/pg_next2.gif"/>
											</a>
										</div>
									</div>
								<div class="br10"></div>
								<table width="100%" class="content_title_box2">
									<colgroup>
										<col width="*"/>
										<col width="10%"/>
										<col width="30%"/>
										<col width="30%"/>
										<col width="10%"/>
									</colgroup>
									<tbody>
										<tr>
											<th>쿠폰명</th>
											<th>할인액(율)</th>
											<th>사용조건</th>
											<th>유효기간</th>
											<th>사용상태</th>
										</tr>
										<tr>
											<td colspan="5">받은 쿠폰이 없습니다.</td>
										</tr>
									</tbody>
								</table>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div style="clear:both;"></div>
		</div>
	</div>
	<div class="footer_wrap">
		<div class="mainfooter">
		<div class="botmenu">
			<div class="bmcontentbox">
				<div class="fl">
					<a href="https://www.fcseoul.com/" target="_blank">FC서울 홈페이지</a>
				</div>
				<div class="fl">
					<a href="FcController?command=privacy" target="_blank">개인정보처리방침</a>
				</div>
				<div class="fl">
					<a href="FcController?command=terms" target="_blank">이용약관</a>
				</div>
				<div class="fl">
					<a href="FcController?command=FAQ" target="_blank">고객센터</a>
				</div>
				
			</div>
		</div>
		<div class="footer">
			<div class="fcontentbox">
				<div>
			 		법인명(상호): 케이프온 주식회사
				</div>
				<div>
					대표자 : 민세중
				</div>
				<div>
					사업자등록번호: 644-81-00100
				</div>
			</div>
			<div class="fcontentbox">
				<div>
			 		FAX: 031-722-2056
				</div>
				<div>
					통신판매신고번호 : 제2020-성남중원-1061호
				</div>
			</div>
			<div class="fcontentbox">
				<div>
			 		<address>
							경기도 성남시 중원구 양현로 405번길 4-11
						</address>
				</div>
			</div>
			<div class="fcontentbox">
				<div>
			 		개인정보보호책임자 : 이재근
				</div>
				<div>
					이메일 : fcseoul@gssports.co.kr
				</div>
			</div>
			<p>
				Copyright ⓒ 2020 GS Sports Football Club Seoul
			</p>
		</div>
	</div>
	</div>
	<div id="bg_dark" class="bg_dark" style="display: none;"></div>
</body>
</html>