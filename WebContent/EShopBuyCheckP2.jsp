<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.EShopBuyDto"%>
<%@ page import="dao.EShopBuyDao"%>
    
<%
	EShopBuyDao EShopBuyDao = new EShopBuyDao();

	String[] goodsId = (String[])request.getAttribute("goodsId");
	String[] goodsSize = (String[])request.getAttribute("goodsSize");
	String[] oQty = (String[])request.getAttribute("oQty");
	EShopBuyDto buyInfoDto = (EShopBuyDto)request.getAttribute("buyInfoDto");
	EShopBuyDto buyCheckDto = (EShopBuyDto)request.getAttribute("buyCheckDto");
	EShopBuyDto pgTest = (EShopBuyDto)request.getAttribute("pgTest");
	int total = (int)request.getAttribute("total");
	String id = (String)request.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>FC서울 공식 쇼핑몰</title>
	<link rel="shortcut icon" type="image/x-icon" href="https://fcseoulpub.s3.ap-northeast-2.amazonaws.com/multi01/Club/Club/1675316444376.png">
	<link rel="stylesheet" href="css/EShopBuy.css">
<!-- 	<script src="js/jquery-3.7.0.min.js"></script> -->
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<!--     <script src="https://cdn.iamport.kr/v1/iamport.js"></script> -->
    
	<script>
		var IMP = window.IMP;
	    IMP.init("imp42223837");
		function requestPay() {
		      // IMP.request_pay(param, callback) 결제창 호출
		      if(<%=goodsId.length%> > 1) {
			      IMP.request_pay({ // param
			          pg: "INIpayTest",
			          pay_method: "card",
			          merchant_uid: "<%=goodsId[0]%>",
			          name: "<%=pgTest.getGoodsName()%>외 <%=goodsId.length-1%>종",
			          amount: 100,
			          buyer_email: "<%=buyCheckDto.getEmail()%>",
			          buyer_name: "<%=buyCheckDto.getName()%>",
			          buyer_tel: "<%=buyCheckDto.getPhone()%>",
			          buyer_addr: "<%=buyCheckDto.getAddress()%>",
			          buyer_postcode: "<%=buyCheckDto.getPostalNum()%>"
			      }, function (rsp) { // callback
			          if (rsp.success) {
			              // 결제 성공 시 로직,
			              alert("결제가 완료되었습니다.");
			              $("#firm").attr("action", "FcController?command=buySuccess").submit();
			          } else {
			              // 결제 실패 시 로직,
			              alert("결제가 취소되었습니다.");
			          }
			      });
		      } else {
		    	  IMP.request_pay({ // param
			          pg: "INIpayTest",
			          pay_method: "card",
			          merchant_uid: "<%=goodsId[0]%>",
			          name: "<%=pgTest.getGoodsName()%>",
			          amount: 100,
			          buyer_email: "<%=buyCheckDto.getEmail()%>",
			          buyer_name: "<%=buyCheckDto.getName()%>",
			          buyer_tel: "<%=buyCheckDto.getPhone()%>",
			          buyer_addr: "<%=buyCheckDto.getAddress()%>",
			          buyer_postcode: "<%=buyCheckDto.getPostalNum()%>"
			      }, function (rsp) { // callback
			          if (rsp.success) {
			              // 결제 성공 시 로직,
			              alert("결제가 완료되었습니다.");
			              $("#firm").attr("action", "FcController?command=buySuccess").submit();
			          } else {
			              // 결제 실패 시 로직,
			              alert("결제가 취소되었습니다.");
			          }
			      });
		      }
		    }
	</script>
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
				<div class="cart_content">
					<table width="100%">
						<tbody>
							<tr>
								<td class="sub_t1">
									Home > 마이페이지 >  
									<span class="sub_t2">장바구니</span>
								</td>
							</tr>
							<tr>
								<td class="cartpage_title">
									<img src="https://www.fcseoul.com/resources/shop/_img/mypage/title_cart.gif"/>
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
									<table width="100%" class="cart_tab">
										<colgroup>
											<col width="33%"/>
											<col width="33%"/>
											<col width="*"/>
										</colgroup>
										<tbody>
											<tr>
												<td><img src="https://www.fcseoul.com/resources/shop/_img/cart/tab_order01_off.gif"/></td>
												<td><img src="https://www.fcseoul.com/resources/shop/_img/cart/tab_order02_on.gif"/></td>
												<td><img src="https://www.fcseoul.com/resources/shop/_img/cart/tab_order03_off.gif"/></td>
											</tr>
										</tbody>
									</table>
									<div class="br20"></div>
									<div class="cart_text">
										ㆍ고객님께서 
										<font class="f_red">주문하신 상품내역을 변경하시거나 삭제</font>하실 수가 없습니다.
										<br/>
										ㆍ장바구니에 담긴 상품은 로그아웃시 삭제됩니다. <br/>
										ㆍ판매가 종료된 상품은 장바구니에서 삭제될 수도 있으며, 구매하실 수 없습니다. <br/>
										ㆍ계속주문을 원하시면 '쇼핑하기'를 클릭하세요.<br/>
										ㆍ바로구매를 원하시면 '주문하기'를 클릭하세요.
									</div>
									<div class="br10"></div>
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
											<%
											for(int i=0; i<=goodsId.length-1; i++) {
												EShopBuyDto buyDto = EShopBuyDao.buyPrd(id, goodsId[i], goodsSize[i]);
											%>
												<tr class="mOver">
													<td><img src="<%=buyDto.getGoodsImg()%>"/></td>
													<td class="prd_name"><%=buyDto.getGoodsName()%></td>
													<td><%=goodsSize[i]%></td>
													<td><%=oQty[i]%></td>
													<td class="f_red"><b><%=buyDto.getPrice() * Integer.parseInt(oQty[i])%> 원</b></td>
													<td>//</td>
												</tr>
											<%
											}
											%>
										</tbody>
									</table>
									<div class="br30"></div>	
									<table class="content_title_box2">
										<colgroup>
											<col width="20%"/>
											<col width="*"/>
										</colgroup>
										<tr>
											<td colspan="6" class="total">
												상품합계 금액 : 
												<b>
												<%
												
													for(int i=0; i<=goodsId.length-1; i++) {
														EShopBuyDto buyDto = EShopBuyDao.buyPrd(id, goodsId[i], goodsSize[i]);
// 														total += buyDto.getPrice();
													}
												%>
												원</b>
												+ 배송료 : 
												<b>3500원 총 결제금액</b> 
												: 
												<b class="f_red" id="total_price"><%=total + 3500%></b>
												원
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
												<%=buyInfoDto.getName() %>
											</td>
										</tr>
										<tr>
											<th>이메일</th>
											<td>
												<%=buyInfoDto.getEmail() %>
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
											<td id="oPTel"><%=buyInfoDto.getPhone().substring(0,3) %> - <%=buyInfoDto.getPhone().substring(3, 7) %> - <%=buyInfoDto.getPhone().substring(7) %></td>
										</tr>
										<tr>
											<th>주소</th>
											<td>
												(<%=buyInfoDto.getPostalNum() %>) <br/>
												<%=buyInfoDto.getAddress() %>
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
											<th>배송방법선택</th>
											<td>
												<%=buyCheckDto.getoCheck() %>
											</td>
										</tr>
										<tr>
											<th>주문자</th>
											<td>
												<%=buyCheckDto.getName() %>
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
											<td id="oPTel"><%=buyCheckDto.getPhone().substring(0,3) %> - <%=buyCheckDto.getPhone().substring(3, 7) %> - <%=buyCheckDto.getPhone().substring(7) %></td>
										</tr>
										<tr>
											<th>주소</th>
											<td>
												(<%=buyCheckDto.getPostalNum() %>) <br/>
												<%=buyCheckDto.getAddress() %>
											</td>
										</tr>
										<tr>
											<th>배송시 요청사항</th>
											<td class="req">
												<%=buyCheckDto.getoState() %>
											</td>
										</tr>
										<tr>
											<th>결제방법</th>
											<td>
												<%=buyCheckDto.getPayWay() %>
											</td>
										</tr>
									</table>
									<div class="br30"></div>
									<div class="pay_btn_wrap">
										<form action="FcController" id="firm">
										<div class="pay_btn_box">
											<%
											for(int i=0; i<=goodsId.length-1; i++) {
											%>
											<input type="hidden" name="oQty" value="<%=oQty[i] %>"/>
											<input type="hidden" name="goodsId" value="<%=goodsId[i] %>"/>
											<input type="hidden" name="goodsSize" value="<%=goodsSize[i]%>"/>
											<input type="hidden" name="command" value="buySuccess"/>
											<%
											}
											%>
											<input type="hidden" name="id" value="<%=id %>"/>
											<input type="hidden" name="oNum" value=""/>
											<input type="hidden" name="buyBtn" value=""/>
											<button type="button" name="BCBtn" value="buy" onclick="requestPay()"><img src="https://www.fcseoul.com/resources/shop/_img/btn/btn_pay.gif"/></button>
											<button type="button" onclick="location.href='EShopMain.jsp'" name="BCBtn" value="cancel"><img src="https://www.fcseoul.com/resources/shop/_img/btn/btn_cancel3.gif"/></button>
 										</div>
 										</form>
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