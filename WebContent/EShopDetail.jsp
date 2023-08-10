<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.EShopDetailDto"%>
<%@ page import="dao.EShopDetailDao"%>
<%@ page import="java.sql.*"%>

<%
	int count = 0;
	int pageNum = 0;

	EShopDetailDto goodsDetail = (EShopDetailDto)request.getAttribute("goodsDetail");
	ArrayList<EShopDetailDto> sizeInvenList = (ArrayList<EShopDetailDto>)request.getAttribute("sizeInvenList");
	ArrayList<EShopDetailDto> goodsQRList = (ArrayList<EShopDetailDto>)request.getAttribute("goodsQRList");
	count = (int)request.getAttribute("count");
	pageNum = (int)request.getAttribute("pageNum");
	String id = (String)request.getAttribute("id");
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>FC서울 공식 쇼핑몰</title>
	<link rel="shortcut icon" type="image/x-icon" href="https://fcseoulpub.s3.ap-northeast-2.amazonaws.com/multi01/Club/Club/1675316444376.png">
	<link rel="stylesheet" href="css/EShopDetail.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
	<script src="js/jquery-3.7.0.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
	<script>
		$(document).ready(function(){
	        let slider = $(".slider").bxSlider();
	        
	        $(".close_btn").click(function(){
				$(".detail_popup_wrap").css("display", "none");
				$("#bg_dark").css("display", "none");
			});
			$(".detail_btn").click(function(){
				$(".detail_popup_wrap").css("display", "block");
				$("#bg_dark").css("display", "block");
				slider.reloadSlider();
			});
			$(".cart_btn").click(function(){
				let size = $("#size_sel option:selected").val();
				if(size == "") {
					alert("사이즈를 선택해주세요.");
					return false;
				}
			});
			$(".buy_btn").click(function(){
				let size = $("#size_sel option:selected").val();
				let command = "buy";
				$("#command").val(command);
				if(size == "") {
					alert("사이즈를 선택해주세요.");
					return false;
				}
			});
			
			
	  	});
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
			$(".rqa").click(function(){
				let val = $(this).attr("id");
				if($('#view_'+val).hasClass("off")){
					$(".rqa_content_box").addClass("off")
					$('#view_'+val).removeClass("off");	
				} else {
					$('#view_'+val).addClass("off");
				}
			});
			
			$(".plus_btn").click(function(){
				let amt = Number($("#amount").val());
				$("#amount").val(amt+1);
				calc();
			});
			$(".minus_btn").click(function(){
				let amt = Number($("#amount").val());
				if(amt > 1){
					$("#amount").val(amt-1);
					calc();
				}
			});
			$("html, body").click(function(){
				calc();
			});
			calc();
			$("#t1").click(function(){
				let lo = $(this).parent().find(".tab_on").offset();
				$("html, body").animate({scrollTop : lo.top}, 500);
			});
			
			$(".cart_btn").click(function(){
				let qty = $("#size_sel option:selected").text();
				qty = qty.split(" ");
				if(qty[3] <= '0') {
					alert("재고수량이 없습니다.");
					return false;
				} else if(<%=id%> == null) {
					alert("로그인 해주세요.");
					location.href = "FcController?command=login";
					return false;
				}
			});
			$(".buy_btn").click(function(){
				let qty = $("#size_sel option:selected").text();
				qty = qty.split(" ");
				if(qty[3] <= '0') {
					alert("재고수량이 없습니다.");
					return false;
				} else if(<%=id%> == null) {
					alert("로그인 해주세요.");
					location.href = "FcController?command=login";
					return false;
				}
			});
			$(".wish_btn").click(function(){
				if(<%=id%> == null) {
					alert("로그인 해주세요.");
					location.href = "FcController?command=login";
					return false;
				}
			});
			
		});
		
		function calc() {
			let price = $("#unit_price").text().replace(",", "")
			price = price.replace("원", "");
			let amt = Number($("#amount").val());
			let finPrice = price * amt;
			let stprice = ""+finPrice;
			let result1 = "," + stprice.slice(-3);
			let result2 = stprice.slice(0,-3)+result1;
			$("#price").html(result2 + "원");
		}
		
		
		
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
				<input type="hidden" name="id" id="<%=id%>"/>
				<input type="hidden" name="command" id="catePage"/>
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
	<div class="main_container">
		<div class="content_wrap">
			<div class="main_content">
				<div class="content_title">
					<div class="mini_title">
						Home > <span>유니폼</span>
					</div>
					<div class="title">
						<span>유니폼</span>
						<img src="https://www.fcseoul.com/resources/shop/_img/product/title_fcseoul.gif"/>
					</div>
				</div>
				<div>
					<div class="prd_img_wrap fl">
						<div class="prd_img">
							<img src="<%=goodsDetail.getGoodsImg()%>"/>
						</div>
						<div>
								<img class="detail_btn" src="https://www.fcseoul.com/resources/shop/_img/btn/zoom.gif"/>
						</div>
						<div style="clear:both;"></div>
					</div>
					<form action="FcController"/>
						<table width="100%" class="prd_info_box">
							<tbody>
								<tr>
									<td colspan="2" class="prd_info_tit">
										<%=goodsDetail.getGoodsName() %>
										<img src="<%=goodsDetail.getNewC()%>" onerror="this.style.display='none'"/>
										<img src="<%=goodsDetail.getBest()%>" onerror="this.style.display='none'"/>
									</td>
								</tr>
								<tr class="prd_info_r1">
									<td class="prd_info_c1">판매가격</td>
									<td id="unit_price" class="prd_info_c2 price"><%=goodsDetail.getGoodsPrice() %> 원</td>
								</tr>
								<tr class="prd_info_r1">
									<td class="prd_info_c1">적립 포인트</td>
									<td class="prd_info_c2 point">2,970 / 일반GS&POINT는 구매가격의 1% 입니다.</td>
								</tr>
								<tr class="prd_info_r2">
									<td class="prd_info_c1">제조사/원산지</td>
									<td class="prd_info_c2">프로스펙스</td>
								</tr>
								<tr class="prd_info_r2">
									<td class="prd_info_c1">브랜드명</td>
									<td class="prd_info_c2">FC서울</td>
								</tr>
								<tr class="prd_info_r2">
									<td class="prd_info_c1">색상선택</td>
									<td class="prd_info_c2">
										<p class="color_sel">
											<a class="prd_red">
												색
											</a>
										</p>
									</td>
								</tr>
								<tr class="prd_info_r2">
									<td class="prd_info_c1">사이즈</td>
									<td class="prd_info_c2">
										<input type="hidden" name="id" value="<%=id%>"/>
										<input type="hidden" name="goodsId" value="${goodsId}"/>
										<input type="hidden" name="qty" value="0"/>
										<input type="hidden" name="cBtn" value=""/>
										<input type="hidden" name="wlBtn" value=""/>
										<input type="hidden" name="command" value="updateAction" id="command"/>
<!-- 										<input type="hidden" name="goodsIdArr" value=""/> -->
										<select id="size_sel" name="goodsSize" class="size_sel">
											<option value="">선택해주세요</option>
											<%
												for(EShopDetailDto siDto : sizeInvenList) {
											%>
											<option class="inven_sel" value="<%=siDto.getGoodsSize1() %>"><%=siDto.getGoodsSize1()%> (재고수량  <%=siDto.getInventory1()%> 개)</option>
											<%
												}
											%>
										</select>
									</td>
								</tr>
								<tr class="prd_info_r2">
									<td class="prd_info_c1">수량</td>
									<td class="prd_info_c2">
										<input type="text" name="amount" id="amount" size="3" style="text-align: right;" value="1"/>
										개
										<button type="button" class="plus_btn">▲</button>
										<button type="button" class="minus_btn">▼</button>
									</td>
								</tr>
								<tr class="prd_info_r2">
									<td class="prd_info_c1">금액</td>
									<td id="price" class="prd_info_c2"><%=goodsDetail.getGoodsPrice() %> 원</td>
								</tr>
							</tbody>
						</table>
						<div class="prd_btn_box">
							<button  type="submit" name="btnType" value="cart" class="cart_btn">
								<img src="https://www.fcseoul.com/resources/shop/_img/btn/btn_cart.gif" class="prd_btn"/>
							</button>
							<button type="submit" name="btnType" value="buy" class="buy_btn">
								<img src="https://www.fcseoul.com/resources/shop/_img/btn/btn_buy.gif" class="prd_btn"/>
							</button>
							<button  type="submit" name="btnType" value="wishList" class="wish_btn">
								<img src="https://www.fcseoul.com/resources/shop/_img/btn/btn_wishlist.gif" class="prd_btn"/>
							</button>
						</div>
					</form>
					<div class="prd_detail_info">
						<div class="tab_box">
							<a><img src="https://www.fcseoul.com/resources/shop/_img/product/prd_tab1_on.gif" class="tab_on" id="t1"/></a>
							<a><img src="https://www.fcseoul.com/resources/shop/_img/product/prd_tab2.gif" class="" id="t2"/></a>
							<a><img src="https://www.fcseoul.com/resources/shop/_img/product/prd_tab3.gif" class="" id="t3"/></a>
							<a><img src="https://www.fcseoul.com/resources/shop/_img/product/prd_tab4.gif" class="" id="t4"/></a>
							<a><img src="https://www.fcseoul.com/resources/shop/_img/product/prd_tab5.gif" class="" id="t5"/></a>
						</div>
						<div class="prd_info_img">
							<img src="<%=goodsDetail.getImg()%>"/>
						</div>
						<div class="prd_tag">
							<p># 유니폼 # 40주년 # 홈 # 어웨이 # 필드</p>
						</div>
						<div class="tab_box">
							<a><img src="https://www.fcseoul.com/resources/shop/_img/product/prd_tab1.gif" class="" id="t1"/></a>
							<a><img src="https://www.fcseoul.com/resources/shop/_img/product/prd_tab2_on.gif" class="tab_on" id="t2"/></a>
							<a><img src="https://www.fcseoul.com/resources/shop/_img/product/prd_tab3.gif" class="" id="t3"/></a>
							<a><img src="https://www.fcseoul.com/resources/shop/_img/product/prd_tab4.gif" class="" id="t4"/></a>
							<a><img src="https://www.fcseoul.com/resources/shop/_img/product/prd_tab5.gif" class="" id="t5"/></a>
						</div>
						<div class="prd_text">
							<p>
							<b><u>* 해당 제품은 전면에 자이 스폰서만 부착된 유니폼입니다.</u></b>
							<br/>
							유니폼만 단독으로 배송되며, 마킹 부착을 희망하실 경우
							<br/>
							유니폼과 마킹지를 한번에 결제해주셔야만 부착하여 배송됩니다.
							<br/>
							이 점 양해 부탁드립니다.
							<br/>
							<br/>
							<b><u>* 교환 및 환불은 14일이내로 가능하며, 재고 부족으로 인해 교환이 어려울 수 있습니다.</u></b>
							<br/>
							<br/>
							<b><u><span>세탁 관련 주의사항</span></u></b>
							<br/>
							마킹이 부착된 유니폼은 세탁에 취약하므로 주의가 필요합니다.
							<br/>
							<br/>
							손세탁을 권장 드리며 불가피하게 세탁기를 돌려야 할 경우,
							<br/>
							세탁망에 넣어 울 세탁(찬물) 부탁드립니다.
							<br/>
							<br/>
							<u>건조기는 마킹지가 떨어질 수 있으니 사용 불가합니다.</u>
							<br/>
							<br/>
							섬유유연제를 사용할 경우, 유니폼이 이염 될 수 있으니 사용 불가합니다.
							<br/>
							<br/>
							세탁 후 개인 부주의로 인한 교환 및 환불은 불가합니다.
							<br/>
							<br/>
							<b><u>마킹 관련 안내사항</u></b>
							<br/>
							<br/>
							마킹이 부착된 유니폼은 교환 및 환불이 불가합니다.
							<br/>
							<br/>
							부착 시, 희망하시는 이름 부착 위치를 꼭 배송시 요청사항에 기입 부탁드립니다.
							<br/>
							<br/>
							별도의 요청사항을 기재하지 않으실 경우 상세이미지에 있는 번호 하단으로 이름마킹이 들어갑니다.
							<br/>
							이로인한 교환 및 환불은 불가하오니 양해부탁드립니다.
							<br/>
							<br/>
							23시즌 마킹은 홈&어웨이 모두 골드마킹입니다.
							<br/>
							(GK는 화이트)
							<br/>
							<br/>
							골드마킹은 열에 취약하며 원단 특성상 비침 현상이 있을 수 밖에 없습니다.
							<br/>
							따라서 여러 번 프레스기를 누를수록 비침현상이 심해지니 추천드리지 않습니다.
							<br/>
							<br/>
							<b><u>현장 수령 장소</u></b>
							<br/>
							홈경기일 : 북측광장 FC서울 마킹센터
							<br/>
							비홈경기일 : FC서울 팬파크(월드컵경기장역 2번출구 앞)
							<br/>
							<br/>
							<b><u>FC서울 팬파크 운영시간</u></b>
							<br/>
							평일) 10:00 ~ 20:00
							<br/>
							주말, 공휴일) 10:00 ~ 20:00
							<br/>
							<br/>
							</p>
						</div>
						<div class="tab_box">
							<a><img src="https://www.fcseoul.com/resources/shop/_img/product/prd_tab1.gif" class="" id="t1"/></a>
							<a><img src="https://www.fcseoul.com/resources/shop/_img/product/prd_tab2.gif" class="" id="t2"/></a>
							<a><img src="https://www.fcseoul.com/resources/shop/_img/product/prd_tab3_on.gif" class="tab_on" id="t3"/></a>
							<a><img src="https://www.fcseoul.com/resources/shop/_img/product/prd_tab4.gif" class="" id="t4"/></a>
							<a><img src="https://www.fcseoul.com/resources/shop/_img/product/prd_tab5.gif" class="" id="t5"/></a>
						</div>
						<div>
							<ul class="prd_view1">
								<li class="prd_view_t1">구입제품의 반품 / 교환</li>
								<li class="prd_view_t2">구입 후 7일 이내에 동일제품으로 교환 가능하며 운송비는 구매자께서 부담합니다.</li>
								<li class="prd_view_t3">주문제작 유니폼이나, 공동구매 제작상품, 마킹된 유니폼의 경우 소량 제작된 상품의 특성상 제품에 이상이 있을시를 제외하고 교환 및 환불이 불가 하오니 신중한 구매결정 부탁드립니다.</li>
								<li class="prd_view_t2">다른 제품으로 교환, 또는 이상이 없는 제품과 함께 교환을 원하실 경우 구매자께서 운송비를 부담합니다.</li>
								<li class="prd_view_t3">반품교환시 착불 배송비 초과금액(3,500원) 발생시 구매자께서 초과된 금액을 부담하게 되므로, 선불로 상품을 보내주시거나, 3500원을 동봉하여 CJ대한통운 택배를 통해 착불로 보내 주시기 바랍니다.</li>
								<li class="prd_view_t2">반품/교환 주소 : 서울시 마포구 월드컵로 240 월드컵경기장역 2번 출구 앞 FC서울 팬파크 TEL 070-4101-7710</li>
							</ul>
							<ul class="prd_view2">
								<li class="prd_view_t1">구입제품의 이상이 있을 경우 (색상, 사이즈, 다른상품교환)</li>
								<li class="prd_view_t2">구입후 7일이내 교환 가능하며 구매자께서 운송비를 부담합니다.</li>
							</ul>
							<ul class="prd_view2">
								<li class="prd_view_t1">주의사항!!</li>
								<li class="prd_view_t2">비닐포장 및 Tag의 폐기 또는 훼손 등으로 상품 가치가 멸실된 경우에는 제한 반품시에 해당 사은품이 있을 경우 같이 보내주셔야 합니다.</li>
							</ul>
						</div>
						<div class="tab_box">
							<a><img src="https://www.fcseoul.com/resources/shop/_img/product/prd_tab1.gif" class="" id="t1"/></a>
							<a><img src="https://www.fcseoul.com/resources/shop/_img/product/prd_tab2.gif" class="" id="t2"/></a>
							<a><img src="https://www.fcseoul.com/resources/shop/_img/product/prd_tab3.gif" class="" id="t3"/></a>
							<a><img src="https://www.fcseoul.com/resources/shop/_img/product/prd_tab4_on.gif" class="tab_on" id="t4"/></a>
							<a><img src="https://www.fcseoul.com/resources/shop/_img/product/prd_tab5.gif" class="" id="t5"/></a>
						</div>
						<div>
							<ul class="prd_view1">
								<li class="prd_view_t1">결제후 2~5일 이내에 상품을 받아 보실 수 있습니다.</li>
								<li class="prd_view_t2">국내 최대의 물류사 CJ대한통운 택배를 통하여 신속하고 안전하게 배송됩니다.</li>
							</ul>
							<ul class="prd_view2">
								<li class="prd_view_t1">10만원 이상 구입시 무료배송입니다. <img src="https://www.fcseoul.com/resources/shop/_img/icon/icon_freedelivery.gif" alt="무료배송" class="t7"></li>
								<li class="prd_view_t2">제주도를 포함한 도서,산간지역은 배송비(항공료 또는 도선료) 3500원이 추가 되므로 착불로 발송됩니다.</li>
							</ul>
						</div>
						<div class="tab_box">
							<a><img src="https://www.fcseoul.com/resources/shop/_img/product/prd_tab1.gif" class="" id="t1"/></a>
							<a><img src="https://www.fcseoul.com/resources/shop/_img/product/prd_tab2.gif" class="" id="t2"/></a>
							<a><img src="https://www.fcseoul.com/resources/shop/_img/product/prd_tab3.gif" class="" id="t3"/></a>
							<a><img src="https://www.fcseoul.com/resources/shop/_img/product/prd_tab4.gif" class="" id="t4"/></a>
							<a><img src="https://www.fcseoul.com/resources/shop/_img/product/prd_tab5_on.gif" class="tab_on" id="t5"/></a>
						</div>
						<div class="prd_rqa_box">
							<div class="rqa_upper">
								총 <span><%=count %>개</span>의 글이 등록되어 있습니다.
							</div>
							<table width="100%">
								<colgroup>
									<col width="8%"/>
									<col width="*"/>
									<col width="8%"/>
									<col width="12%"/>
									<col width="11%"/>
								</colgroup>
								<tr class="rqa_head">
									<th>번호</th>
									<th>제목</th>
									<th>&nbsp;</th>
									<th>작성자</th>
									<th>작성일</th>
								</tr>
								<%
								for(EShopDetailDto qrDto : goodsQRList) {
									if(qrDto.getCategory().equals("Q&A")) {
									%>
										<tr class="rqa" id="<%=qrDto.getBno()%>">
											<td class="no"><%=qrDto.getBno()%></td>
											<td class="rqa_tit">
												<img src="https://www.fcseoul.com/resources/shop/_img/icon/icon_qna.gif"/>
												 <%=qrDto.getTitle()%>
											</td>
											<td>
												<img src="<%=qrDto.getAnswer()%>" class="t1" alt="답변완료" onerror="this.style.display='none'">
											</td>
											<td><%=qrDto.getName()%></td>
											<td class="rqa_date"><%=qrDto.getwDate()%></td>
										</tr>
										<tr class="rqa_content_wrap">
											<td colspan="5" id="view_<%=qrDto.getBno()%>" class="rqa_content_box off">
												<table>
													<tr>
														<td class="rqa_content"><%=qrDto.getContent()%></td>
													</tr>
												</table>
												<%
												if(qrDto.getAnswer().equals("https://www.fcseoul.com/resources/shop/_img/btn/btn_complete.gif")) {
												%>
													<table class="answer_box">
														<tr>
															<td class="answerL">
																쇼핑몰운영자6	
															</td>
															<td class="answerR">
																<%=qrDto.getaContent()%>
															</td>
														</tr>
													</table>
												<%	
												}
												%>
											</td>
										</tr>
									<%
									}else {
									%>
										<tr class="rqa" id="<%=qrDto.getBno()%>">
											<td class="no"><%=qrDto.getBno()%></td>
											<td class="rqa_tit">
												<img src="https://www.fcseoul.com/resources/shop/_img/icon/icon_review.gif"/>
												<%=qrDto.getTitle()%>
											</td>
											<td>
											</td>
											<td><%=qrDto.getName()%></td>
											<td class="rqa_date"><%=qrDto.getwDate()%></td>
										</tr>
										<tr class="rqa_content_wrap">
											<td colspan="5" id="view_<%=qrDto.getBno()%>" class="rqa_content_box off">
												<table>
													<tr>
														<td class="rqa_content"><%=qrDto.getContent()%></td>
													</tr>
												</table>
											</td>
										</tr>
									<%	
									}
								}
								%>
							</table>
						</div>
<!-- 						<div class="page_box"> -->
<!-- 							<div class="page_btn"> -->
<%-- 								<a href="EShopDetail.jsp?goodsID=${goodsId}&page=1"> --%>
<!-- 									<img src="https://www.fcseoul.com/resources/shop/_img/board/pg_prev2.gif"/> -->
<!-- 								</a> -->
<%-- 								<a href="EShopDetail.jsp?goodsID=${goodsId}&page=<%=pageNum-1%>"> --%>
<!-- 									<img src="https://www.fcseoul.com/resources/shop/_img/board/pg_prev.gif"/> -->
<!-- 								</a> -->
<!-- 								&nbsp;&nbsp; -->
<%-- 								<% --%>
<!-- // 								for(int i=1; i<=(count/15)+1; i++) { -->
<!-- // 									if(pageNum == i) { -->
<%-- 										%> --%>
<%-- 										<a href="EShopDetail.jsp?goodsID=${goodsId}&page=<%=i %>" class="pg"> --%>
<%-- 											<b style="color:#d2232a"><%=i %></b> --%>
<!-- 										</a> -->
<%-- 										<% --%>
<!-- // 									} else { -->
<%-- 										%> --%>
<%-- 										<a href="EShopDetail.jsp?goodsID=${goodsId}&page=<%=i %>" class="pg"> --%>
<%-- 											<b><%=i %></b> --%>
<!-- 										</a> -->
<%-- 										<% --%>
<!-- // 									} -->
<!-- // 								} -->
<%-- 								%> --%>
<!-- 								&nbsp;&nbsp; -->
<%-- 								<% --%>
<!-- // 								if(pageNum == (count/15)+1) { -->
<%-- 									%> --%>
<%-- 									<a href="EShopDetail.jsp?goodsID=${goodsId}&page=<%=count/15+1%>"> --%>
<!-- 										<img src="https://www.fcseoul.com/resources/shop/_img/board/pg_next.gif"/> -->
<!-- 									</a> -->
<%-- 									<% --%>
<!-- // 								} else { -->
<%-- 									%> --%>
<%-- 									<a href="EShopDetail.jsp?goodsID=${goodsId}&page=<%=pageNum+1%>"> --%>
<!-- 										<img src="https://www.fcseoul.com/resources/shop/_img/board/pg_next.gif"/> -->
<!-- 									</a> -->
<%-- 									<%	 --%>
<!-- // 								} -->
<%-- 								%> --%>
<%-- 								<a href="EShopDetail.jsp?goodsID=${goodsId}&page=<%=count/15+1%>"> --%>
<!-- 									<img src="https://www.fcseoul.com/resources/shop/_img/board/pg_next2.gif"/> -->
<!-- 								</a> -->
<!-- 							</div> -->
<!-- 						</div> -->
						<div class="rqa_write_btn fr">
							<a>
								<img src="https://www.fcseoul.com/resources/shop/_img/btn/btn_write.gif"/>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div> 
	<div class="detail_popup_wrap" style="display: none;">
		<div class="detail_popup_box">
			<h1><button class="close_btn"></button></h1>
			<div class="img_slider_wrap">
				<div class="img_slider_box">
					<div class="slider">
						<div>
							<img src="<%=goodsDetail.getGoodsImg()%>"/>
						</div>
						<div>
							<img src="<%=goodsDetail.getGoodsImg()%>"/>
						</div>
					</div>
				</div>
			</div>
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