<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.EShopOrderTrackingDto"%>
<%@ page import="dao.EShopOrderTrackingDao"%>
<%
	EShopOrderTrackingDto OTDto = (EShopOrderTrackingDto)request.getAttribute("OTDto");
	EShopOrderTrackingDto OIDto = (EShopOrderTrackingDto)request.getAttribute("OIDto");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>FC서울 공식 쇼핑몰</title>
	<link rel="shortcut icon" type="image/x-icon" href="https://fcseoulpub.s3.ap-northeast-2.amazonaws.com/multi01/Club/Club/1675316444376.png">
	<link rel="stylesheet" href="css/EShopOrderTracking.css">
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
			$("#infoBtn1").click(function(){
				$(".info_text1").css("display", "block").animate({"opacity": "1"}, 1000);
				$(".info_text2").css("display", "none");
				$(".info_text2").css("opacity", "0");
				$(".info_btn1").attr("src", "https://www.fcseoul.com/resources/shop/_img/cart/tab_ord01_on.gif");
				$(".info_btn2").attr("src", "https://www.fcseoul.com/resources/shop/_img/cart/tab_ord02_off.gif");
			})
			$("#infoBtn2").click(function(){
				$(".info_text2").css("display", "block").animate({"opacity": "1"}, 1000);
				$(".info_text1").css("display", "none");
				$(".info_text1").css("opacity", "0");
				$(".info_btn1").attr("src", "https://www.fcseoul.com/resources/shop/_img/cart/tab_ord01_off.gif");
				$(".info_btn2").attr("src", "https://www.fcseoul.com/resources/shop/_img/cart/tab_ord02_on.gif");
			});
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
		<div class="recentmenu">
			<span>최근 본 상품</span>
		</div>
	</div>
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
				<div class="cart_content">
					<table width="100%">
						<tbody>
							<tr>
								<td class="sub_t1">
									Home > 마이페이지 >  
									<span class="sub_t2">주문/배송조회</span>
								</td>
							</tr>
							<tr>
								<td class="cartpage_title">
									<img src="https://www.fcseoul.com/resources/shop/_img/mypage/title_order1.gif"/>
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
									<div class="br10"></div>
									<div style="width: 100%;">
										<div class="order_up_left fl">
											<b>주문번호</b>
											 : 
											 <b class="f_red">${oNum}</b>
										</div>
										<div class="order_up_right fr">
											<b>ㆍ주문/배송상태</b>
											 : 
											<b class="f_red"><%=OTDto.getoState() %></b>
										</div>
										<div style="clear: both;"></div>
									</div>
									<table width="100%" class="content_title_box2">
										<colgroup>
											<col width="15%"/>
											<col width="*"/>
											<col width="10%"/>
											<col width="10%"/>
											<col width="10%"/>
											<col width="30%"/>
										</colgroup>
										<tbody>
											<tr>
												<th colspan="2">상품명</th>
												<th>옵션</th>
												<th>수량</th>
												<th>가격</th>
												<th>비고</th>
											</tr>
											<tr class="mOver">
												<td><a href="FcController?goodsId=<%=OTDto.getGoodsId()%>&command=detailPage"><img src="<%=OTDto.getGoodsImg()%>"/></a></td>
												<td class="prd_name"><a href="EShopDetail.jsp?goodsId=<%=OTDto.getGoodsId()%>"><%=OTDto.getGoodsName() %></a></td>
												<td><%=OTDto.getGoodsSize() %></td>
												<td><%=OTDto.getoQty() %></td>
												<td class="f_red"><b><%=OTDto.getPrice() %> 원</b></td>
												<td>//</td>
											</tr>
											<tr>
											<td colspan="6" class="total">
												상품합계 금액 : 
												<b><%=OTDto.getPrice() %>원</b>
												+ 배송료 : 
												<b>3500원 총 결제금액</b> 
												: 
												<b class="f_red" id="total_price"><%=OTDto.getPrice() + 3500%></b>
												원
											</td>
										</tr>
										</tbody>
									</table>
									<div class="br30"></div>
									<div class="mypage_content_title">
										<div class="mypage_content_t1 fl">
											<img src="https://www.fcseoul.com/resources/shop/_img/mypage/mypage_txt05.gif"/>
										</div>
									</div>
									<div class="br10"></div>
									<table width="100%" class="order_info">
										<colgroup>
											<col width="20%"/>
											<col width="*"/>
										</colgroup>
										<tr>
											<th>결제정보</th>
											<td>
												<b><%=OTDto.getPayWay() %></b>
											</td>
										</tr>
										<tr>
											<th>GS&POINT</th>
											<td>
												0
											</td>
										</tr>
										<tr>
											<th>결제금액</th>
											<td>
												<b class="f_red"><%=OTDto.getPrice() %>원</b>
											</td>
										</tr>
									</table>
									<div class="br30"></div>
									<div class="mypage_content_title">
										<div class="mypage_content_t1 fl">
											<img src="https://www.fcseoul.com/resources/shop/_img/mypage/mypage_txt06.gif"/>
										</div>
									</div>
									<div class="br10"></div>
									<table width="100%" class="order_info">
										<colgroup>
											<col width="20%"/>
											<col width="*"/>
										</colgroup>
										<tr>
											<th>주문자</th>
											<td>
												<%=OIDto.getName() %>
											</td>
										</tr>
										<tr>
											<th>이메일</th>
											<td>
												<%=OIDto.getEmail() %>
											</td>
										</tr>
										<tr>
											<th>전화번호</th>
											<td>
												--
											</td>
										</tr>
										<tr>
											<th>핸드폰번호</th>
											<td>
												<%=OIDto.getPhone() %>
											</td>
										</tr>
										<tr>
											<th>주소</th>
											<td>
												(<%=OIDto.getPostalNum() %>) <br/>
												<%=OIDto.getAddress() %>
											</td>
										</tr>
									</table>
									<div class="br30"></div>
									<div class="mypage_content_title">
										<div class="mypage_content_t1 fl">
											<img src="https://www.fcseoul.com/resources/shop/_img/mypage/mypage_txt07.gif"/>
										</div>
									</div>
									<div class="br10"></div>
									<table width="100%" class="order_info">
										<colgroup>
											<col width="20%"/>
											<col width="*"/>
										</colgroup>
										<tr>
											<th>배송방법</th>
											<td>
												<b><%=OTDto.getoCheck() %></b>
											</td>
										</tr>
										<tr>
											<th>주문자</th>
											<td>
												<%=OIDto.getName() %>
											</td>
										</tr>
										<tr>
											<th>전화번호</th>
											<td>
												--
											</td>
										</tr>
										<tr>
											<th>핸드폰번호</th>
											<td>
												<%=OIDto.getPhone() %>
											</td>
										</tr>
										<tr>
											<th>주소</th>
											<td>
												(<%=OIDto.getPostalNum() %>) <br/>
												<%=OIDto.getAddress() %>
											</td>
										</tr>
										<tr>
											<th>배송시 요청사항</th>
											<td>
											</td>
										</tr>
									</table>
									<div class="br30"></div>
									<div class="pay_btn_wrap">
										<div class="pay_btn_box">
											<button type="submit" style="display: none;"><img src="https://www.fcseoul.com/resources/shop/_img/btn/btn_order_cancel.png"/></button>
											<button type="button"><a href="FcController?command=orderHistory"><img src="https://www.fcseoul.com/resources/shop/_img/btn/btn_prepage.gif"/></a></button>
 										</div>
									</div>
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