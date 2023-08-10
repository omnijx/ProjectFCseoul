
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.EShopCatePageDto"%>
<%@ page import="dao.EShopCatePageDao"%>
<%@ page import="java.sql.*"%>

<%
	ArrayList<EShopCatePageDto> prdList = (ArrayList<EShopCatePageDto>)request.getAttribute("prdList");
	ArrayList<EShopCatePageDto> prdListBest = (ArrayList<EShopCatePageDto>)request.getAttribute("prdListBest");
	int count = (int)request.getAttribute("count");
	int pageNum = (int)request.getAttribute("pageNum");
	
%>
<!DOCTYPE html>
<html>
<head>
	
	<meta charset="UTF-8">
	<title>FC서울 공식 쇼핑몰</title>
	<link rel="shortcut icon" type="image/x-icon" href="https://fcseoulpub.s3.ap-northeast-2.amazonaws.com/multi01/Club/Club/1675316444376.png">
	<link rel="stylesheet" href="css/EShopCateStyle.css">
	<script src="js/jquery-3.7.0.min.js"></script>
	<script>
		
		
		$(function(){
			$(document).ready(function(){
				$("#priceOrderSel").change(function(){
					let id = '${id}';
					let page = '${page}';
					let type = '${type}';
					let maintxt = '${maintxt}';
					let sel = $("#priceOrderSel option:selected").val();
					$.ajax({
						type: "post",
						url: "EShopCatePageServlet",
						data: { 
							"id": id, "page": page, "type": type, "maintxt": maintxt, "select": sel
						},
						datatype: "json",
						success: function(data){
							$(".pl").html("");
							let img;
							let prdList;
							for(var i=0; i<=data.length-1; i++) {
								prdList = "<div class='prd_list'>" +
											"<div class='prd_list_wrap' id='prdList'>" +
												"<div class='prd_img'>" +
													"<a href='FcController?goodsId=" + data[i].goodsId + "&command=detailPage'>" +
														"<img src='" + data[i].goodsImg + "'/>" +
										  			"</a>" +
										  		"</div>" +
										  		"<div class='goods_name'>" +
										  			"<a href='FcController?goodsId=" + data[i].goodsId + "&command=detailPage'>" +
										  				data[i].goodsName +
										  			"</a>" +
										  		"</div>" +
										  		"<div class='goods_price'>" +
										  			data[i].price + " 원" +
										  		"</div>" +
										  		"<div class='goods_type'>" +
										  			"<img src='" + data[i].newP + "' onerror=\"this.style.display='none'\"/>" +
										  			"<img src='" + data[i].bestP + "' onerror=\"this.style.display='none'\"/>" +
										  		"</div>" +
										  		"<div style='clear:both;'></div>" +
										 	 "</div>" +
										  "</div>";
								$(".pl").append(prdList);
							}
						},
						error: function (request, status, error) {
					        console.log("code: " + request.status)
					        console.log("message: " + request.responseText)
					        console.log("error: " + error);
					    }
					});
					let pNum = <%=pageNum%>;
					$(".pn").removeClass("now_page").css("color", "black");
					$(".p" + pNum).addClass("now_page").css("color", "#d2232a");
					
				});
				
				$(".pg").click(function(){
					let id = '${id}';
					let page = $(this).find(".pn").text();
					let type = '${type}';
					let maintxt = '${maintxt}';
					let sel = $("#priceOrderSel option:selected").val();
					$.ajax({
						type: "post",
						url: "EShopCatePageServlet",
						data: { 
							"id": id, "page": page, "type": type, "maintxt": maintxt, "select": sel
						},
						datatype: "json",
						success: function(data){
							$(".pl").html("");
							let img;
							let prdList;
							for(var i=0; i<=data.length-1; i++) {
								prdList = "<div class='prd_list'>" +
											"<div class='prd_list_wrap' id='prdList'>" +
												"<div class='prd_img'>" +
													"<a href='FcController?goodsId=" + data[i].goodsId + "&command=detailPage'>" +
														"<img src='" + data[i].goodsImg + "'/>" +
										  			"</a>" +
										  		"</div>" +
										  		"<div class='goods_name'>" +
										  			"<a href='FcController?goodsId=" + data[i].goodsId + "&command=detailPage'>" +
										  				data[i].goodsName +
										  			"</a>" +
										  		"</div>" +
										  		"<div class='goods_price'>" +
										  			data[i].price + " 원" +
										  		"</div>" +
										  		"<div class='goods_type'>" +
										  			"<img src='" + data[i].newP + "' onerror=\"this.style.display='none'\"/>" +
										  			"<img src='" + data[i].bestP + "' onerror=\"this.style.display='none'\"/>" +
										  		"</div>" +
										  		"<div style='clear:both;'></div>" +
										 	 "</div>" +
										  "</div>";
								$(".pl").append(prdList);
							}
						},
						error: function (request, status, error) {
					        console.log("code: " + request.status)
					        console.log("message: " + request.responseText)
					        console.log("error: " + error);
					    }
					});
					$(".pn").removeClass("now_page").css("color", "black");
					$(this).find(".pn").addClass("now_page").css("color", "#d2232a");
					
				});
				
				
				
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
		function openFilter() {
			let btn1 = document.getElementById("filterBtn");
			let dark = document.getElementById("bg_dark");
			if(btn1.style.display == "none") {
				btn1.style.display = "block";
				dark.style.display = "block";
			}
		}
		function closeFilter() {
			let btn1 = document.getElementById("filterBtn");
			let dark = document.getElementById("bg_dark");
			if(btn1.style.display == "block") {
				btn1.style.display = "none";
				dark.style.display = "none";
			}
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
	<div id="filterBtn" class="filter_popup_wrap" style="display:none;">
		<div class="filter_popup">
			<h1>
				검색하기
				<button type="button" onclick="closeFilter();">닫기</button>
			</h1>
			<div class="fieldset">
				<div class="target_wrap">
					<div class="title">
						대상선택
					</div>
					<div class="check">
						<div class="fl">
							<input type="checkbox" id="a_target" value="A"/>
							<label for="a_target">전체</label>
						</div>
						<div class="fl">
							<input type="checkbox" id="m_target" value="M"/>
							<label for="m_target">남자</label>
						</div>
						<div class="fl">
							<input type="checkbox" id="f_target" value="F"/>
							<label for="f_target">여자</label>
						</div>
						<div class="fl">
							<input type="checkbox" id="c_target" value="C"/>
							<label for="c_target">어린이</label>
						</div>
						<div style="clear:both;"></div>
					</div>
					<div style="clear:both;"></div>
				</div>
			</div>
			<div class="fieldset">
				<div class="category_wrap">
					<div class="title">
						카테고리 선택
					</div>
					<div class="select_all">
						<input type="checkbox" id="a_category" name="category_all" value="ALL"/>
						<label for="a_category">전체선택</label>
					</div>
					<div class="check">
						<div class="fl">
							<input type="checkbox" id="n_category" value="NEW"/>
							<label for="n_category">NEW</label>
						</div>
						<div class="fl">
							<input type="checkbox" id="uni_category" value="UNIFORM"/>
							<label for="uni_category">유니폼</label>
						</div>
						<div class="fl">
							<input type="checkbox" id="tra_category" value="TRAINNING"/>
							<label for="tra_category">트레이닝웨어</label>
						</div>
						<div class="fl">
							<input type="checkbox" id="p_category" value="PASSION"/>
							<label for="p_category">패션</label>
						</div>
						<div style="clear:both;"></div>
					</div>
					<div class="check">
						<div class="fl">
							<input type="checkbox" id="t_category" value="TOOL"/>
							<label for="t_category">응원용품</label>
						</div>
						<div class="fl">
							<input type="checkbox" id="sou_category" value="SOUVENIR"/>
							<label for="sou_category">기념품</label>
						</div>
						<div class="fl">
							<input type="checkbox" id="c_category" value="CHILD"/>
							<label for="c_category">어린이</label>
						</div>
						<div class="fl">
							<input type="checkbox" id="s_category" value="SALE"/>
							<label for="s_category">SALE</label>
						</div>
						<div style="clear:both;"></div>
					</div>
					<div style="clear:both;"></div>
				</div>
			</div>
			<div class="fieldset">
				<div class="price_wrap">
					<div class="title">
						가격대 선택
					</div>
					<div class="check">
						<div class="price_sel fl">
							<input type="text" id="min_price"/>
							원~
							<input type="text" id="max_price"/>
							원
						</div>
						<div style="clear:both;"></div>
					</div>
					<div style="clear:both;"></div>
				</div>
			</div>
			<div class="sel_button_wrap">
				<a href="" onclick="" class="search_btn">검색하기</a>
				<a href="" onclick="" class="reset_btn">초기화</a>
			</div>
		</div>
	</div>
	<div class="main_container">
		<div class="content_wrap">
			<div class="main_content">
				<div class="content_title">
					<div class="mini_title">
						HOME > <span>${type}</span>
					</div>
					<div class="title">
						<span>${type}</span>
						<img src="https://www.fcseoul.com/resources/shop/_img/product/title_fcseoul.gif"/>
					</div>
				</div>
				<div class="best_wrap">
					<div class="best_box fl">
						<div class="best_img">
							<img src="https://www.fcseoul.com/resources/shop/_img/product/txt_bestproduct.gif"/>
						</div>
					</div>
					<%
					for(EShopCatePageDto dto : prdListBest){
					%>
					<div class="best_box fl">
						<div class="best_content">
							<a href="FcController?goodsId=<%=dto.getGoodsId()%>&command=detailPage">
								<img src="<%=dto.getGoodsImg()%>"/>
							</a>
							<div class="goods_name">
								<a href="FcController?goodsId=<%=dto.getGoodsId()%>&command=detailPage"><%=dto.getGoodsName() %></a>
							</div>
							<div class="goods_price">
								<%=dto.getPrice() %>원
							</div>
							<div class="goods_type">
								<img src="<%=dto.getBestP()%>" onerror="this.style.display='none'"/>
								<img src="<%=dto.getNewP()%>" onerror="this.style.display='none'"/>
							</div>
						</div>
					</div>
					<%
					}
					%>
				</div>
				<div class="type_content">
					<div class="filter_wrap">
						<div class="filter_box">
							<div class="filter_box_text fl">
								카테고리에 총 
								<span><%=count %>개</span>
								의 상품이 등록되어 있습니다.
							</div>
							<div class="filter_box_button">
								<button type="button" id="filterBtn" onclick="openFilter();">필터</button>
								<select id="priceOrderSel">
									<option value="ALL">기본</option>
									<option value="LOW">낮은가격순</option>
									<option value="HIGH">높은가격순</option>
								</select>
							</div>
							<div style="clear:both;"></div>
						</div>
					</div>
					<div class="type_content_box">
					<div class="pl">
					<%
					for(EShopCatePageDto dto : prdList){
					%>
						<div class="prd_list">
							<div class="prd_list_wrap" id="prdList">
								<div class="prd_img">
									<a href="FcController?goodsId=<%=dto.getGoodsId()%>&command=detailPage">
										<img src="<%=dto.getGoodsImg() %>"/>
									</a>
								</div>
								<div class="goods_name">
									<a href="FcController?goodsId=<%=dto.getGoodsId()%>&command=detailPage">
										<%=dto.getGoodsName() %>
									</a>
								</div>
								<div class="goods_price">
									<%=dto.getPrice() %> 원 
								</div>
								<div class="goods_type">
									<img src="<%=dto.getNewP()%>" onerror="this.style.display='none'"/>
									<img src="<%=dto.getBestP()%>" onerror="this.style.display='none'"/>
								</div>
								<div style="clear:both;"></div>
							</div>
						</div>
					<%
					} 
					%>
					</div>
						<div style="clear:both;"></div>
						<div class="bottom_line">
						</div>
						<div class="mt20">
						</div>
						<div style="clear:both;"></div>
						<div class="page_box">
							<div class="page_btn">
								<a href="FcController?type=${type}&page=1&command=catePage">
									<img src="https://www.fcseoul.com/resources/shop/_img/board/pg_prev2.gif"/>
								</a>
								<a href="FcController?type=${type}&page=<%=pageNum-1%>&command=catePage">
									<img src="https://www.fcseoul.com/resources/shop/_img/board/pg_prev.gif"/>
								</a>
								&nbsp;&nbsp;
								<%
								int maxCount = count/15+1;
								if(maxCount%15 == 0) {
									maxCount -= 1;
								}
								for(int i=1; i<=maxCount; i++) {
									if(pageNum == i) {
										%>
										<a class="pg">
											<b style="color:#d2232a" class="pn now_page p<%=pageNum%>"><%=i %></b>
										</a>
										<%
									} else {
										%>
										<a class="pg">
											<b class="pn"><%=i %></b>
										</a>
										<%
									}
								}
								%>
								&nbsp;&nbsp;
								<%
								if(pageNum == maxCount) {
									%>
									<a href="FcController?type=${type}&page=<%=maxCount%>&command=catePage">
										<img src="https://www.fcseoul.com/resources/shop/_img/board/pg_next.gif"/>
									</a>
									<%
								} else {
									%>
									<a href="FcController?type=${type}&page=<%=pageNum+1%>&command=catePage">
										<img src="https://www.fcseoul.com/resources/shop/_img/board/pg_next.gif"/>
									</a>
									<%	
								}
								%>
								<a href="FcController?type=${type}&page=<%=maxCount%>&command=catePage">
									<img src="https://www.fcseoul.com/resources/shop/_img/board/pg_next2.gif"/>
								</a>
							</div>
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