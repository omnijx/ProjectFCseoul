<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>FC서울 공식 쇼핑몰</title>
	<link rel="shortcut icon" type="image/x-icon" href="https://fcseoulpub.s3.ap-northeast-2.amazonaws.com/multi01/Club/Club/1675316444376.png">
	<link rel="stylesheet" href="css/EShopTerm.css">
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
							<img src="https://www.fcseoul.com/resources/shop/_img/customer/lnb_title.gif"/>
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
				<div class="upper_content">
					<table width="100%">
						<tbody>
							<tr>
								<td class="sub_t1">
									Home > 고객센터 >  
									<span class="sub_t2">이용약관</span>
								</td>
							</tr>
							<tr>
								<td class="upperpage_title">
									<span class="upperpage_t1">이용약관</span>
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
									<div class="chap_t">
										<span class="chap_t_txt">제 1 장 총칙</span>
										<a>
											<img src="https://www.fcseoul.com/resources/shop/_img/icon/icon_top.gif"/>
										</a>
									</div>
									<div class="chap_content">
										<span class="content_txt f_red">제 1 조 목적</span> <br/>
										이 약관은 FC서울 홈페이지 회원약관에 동의한 모든 회원 및 비회원들을 대상으로 하며, FC서울이 운영하는 인터넷쇼핑몰(이하 "몰"이라 한다)에서 제공하는 인터넷 관련 서비스(이하 "서비스"라 한다)를 이용함에 있어 인터넷쇼핑몰 과 이용자의 권리의무 및 책임사항을 규정함을 목적으로 합니다.
										<div class="br20"></div>
										<span class="content_txt f_red">제 2 조 정의</span> <br/>
										1.몰 : FC서울이 재화 또는 용역을 이용자에게 제공하기 위하여 컴퓨터 및 모바일 등 정보통신설비를 이용하여 재화 또는 용역을 거래할 수 있도록 설정한 가상의 영업장 혹은 인터넷쇼핑몰을 운영하는 사업자
										<br/>
										2.이용자 : "몰"에 접속하여 이 약관에 따라 "몰"이 제공하는 서비스를 받는 회원 및 비회원
										<br/>
										3.회원 : "몰"의 회원약관에 동의하여 FC서울에 개인정보를 제공하여 이용계약을 체결한 모든 회원을 지칭하며, "몰"의 정보를 지속적으로 제공받으며, "몰"이 제공하는 서비스를 계속적으로 이용할 수 있는 자
										<br/>
										4.비회원 : 회원에 가입하지 않고 "몰"이 제공하는 서비스를 이용하는 자
										<br/>
										5.아이디(ID) : 회원의 식별과 서비스 이용을 위하여 회원이 정하고 FC서울이 승인하는 문자 또는 숫자의 조합
										<br/>
										6.비밀번호 : 회원이 부여받은 아이디(ID)와 일치되는 회원임을 확인하고 회원의 비밀보호를 위해 회원 자신이 정한 문자 또는 숫자의 조합
										<br/>
										7.해지 : "회사" 또는 회원이 서비스 개통 후 이용계약을 해약하는 것
										<div class="br20"></div>
										<span class="content_txt f_red">제 3 조 약관의 명시와 개정</span><br/>
										1. FC서울은 이 약관의 내용과 상호, 영업소 소재지, 대표자의 성명, 사업자등록번호, 연락처(전화, 팩스, 전자우편 주소 등) 등을 이용자가 알 수 있도록 "몰"의 초기 서비스화면(전면)에 게시합니다.
										<br/>
										2.이 약관은 FC서울이 제공하는 화면에 게시하거나 기타의 방법으로 이용고객 또는 회원에게 공지하고 회원이 이에 동의함으로써 효력을 발생합니다.
										<br/>
										3.FC서울은 전자거래기본법, 전자서명법, 정보통신망이용촉진및정보보호등에관한법률, 방문판매등에 관한 법률, 소비자보호법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
										<br/>
										4.FC서울이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 공지함으로써 그 공지 후 7일이 경과한 날로부터 효력을 발생합니다.
										<br/>
										5. 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정전의 약관조항이 그대로 적용됨을 원칙으로 합니다. 다만, 개정약관의 적용를 원하는 회원의 동의절차의 편의를 위하여 이미 계약을 체결한 이용자가 동조 제 4항의 공지에도 불구하고 개정약관 조항의 적용을 받지 않기를 원한다는 이의를 표시하지 않은 경우에는 동조 2항의 동의한 것으로 간주되며 개정약관이 적용됩니다.
										<br/>
										6.이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 정부가 제정한 전자거래소비자보호지침 및 관계법령 또는 상관례에 따릅니다.
										<br/>
										<div class="br20"></div>
										<span class="content_txt f_red">제 4 조 서비스의 제공 및 변경</span><br/>
										1."몰"은 다음과 같은 업무를 수행합니다.
										<br/>
										<div class="sub_txt">
											가) 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결
											<br/>
											나) 구매계약이 체결된 재화 또는 용역의 배송
											<br/>
											다) 기타 "몰"이 정하는 업무
										</div>
										<br/>
										2."몰"은 재화의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화용역의 내용 및 제공일자를 명시하여 현재의 재화용역의 내용을 게시한 곳에 그 제공일자 이전 7일부터 공지합니다.
										<br/>
										3."몰"이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 "몰"은 이로 인하여 이용자가 입은 손해를 배상합니다. 단, "몰"에 고의 또는 과실이 없는 경우에는 그러하지 아니합니다.
										<br/>
										<div class="br20"></div>
										<span class="content_txt f_red">제 5 조 서비스의 중단</span>
										<br/>
										1.몰"은 컴퓨터 등 정보통신설비의 보수점검교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.
										<br/>
										2.서비스 중단의 경우에는 "몰"은 "몰"이 정한 방법으로 이용자에게 통지합니다.
										<br/>
										3."몰"은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단 "몰"에 고의 또는 과실이 없는 경우에는 그러하지 아니합니다.
										<br/>
									</div>
									<div class="chap_t">
										<span class="chap_t_txt">제 2 장 회원의 가입 및 탈퇴</span>
										<a>
											<img src="https://www.fcseoul.com/resources/shop/_img/icon/icon_top.gif"/>
										</a>
									</div>
									<div class="chap_content">
										<span class="content_txt f_red">제 6 조 회원가입, 탈퇴, 자격상실등</span><br/>
										1.이용자의 회원 가입, 탈퇴등은 "몰"의 회원가입약관을 준용합니다.
										<br/>
										2.단, 전자상거래등을 이용하여 당사와의 거래가 발생된 고객의 경우에는 관련 법률에 의거하여 관련법률에 규정된 기본적인 정보사항만을 계약 해지일로부터 3년 동안 관리 합니다.
									</div>
									<div class="chap_t">
										<span class="chap_t_txt">제 3 장 서비스의 이용</span>
										<a>
											<img src="https://www.fcseoul.com/resources/shop/_img/icon/icon_top.gif"/>
										</a>
									</div>
									<div class="chap_content">
										<span class="content_txt f_red">제 7 조 구매신청</span><br/>
										"몰"이용자는 "몰"상에서 이하의 방법에 의하여 구매신청의 청약을 합니다.
										<br/>
										<br/>
										1. 성명, 주소, 전화번호
										<br/>
										2. 재화 또는 용역의 선택
										<br/>
										3. 결제방법의 선택
										<br/>
										4. 이 약관에 동의한다는 표시 (예:마우스 클릭)
										<div class="br20"></div>
										<span class="conten_txt f_red">제 8 조 계약의 성립</span>
										1."몰"은 제7조와 같은 구매신청에 대하여 다음 각 호에 해당하지 않는 한 승낙합니다.
										<br/>
										<div class="sub_txt">
											가)신청 내용에 허위, 기재누락, 오기가 있는 경우
											<br/>
											나)미성년자가 담배, 주류 등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우
											<br/>
											다)기타 구매신청에 승낙하는 것이 "몰" 기술상 현저히 지장이 있다고 판단하는 경우
										</div>
										<br/>
										2."몰"의 승낙은 제10조 제1항의 수신확인 통지 형태로 이용자에게 도달한 시점에 이루어지며, 이 때 계약이 성립한 것으로 봅니다.
										<div class="br20"></div>
										<span class="content_txt f_red">제 9 조 지급방법</span><br/>
										몰"에서 구매한 재화 또는 용역에 대한 대금지급방법은 다음 각 호의 하나로 할 수 있습니다.
										<br/>
										<div class="sub_txt">
											1. 계좌이체
											<br/>
											2. 신용카드결제
											<br/>
											3. 온라인무통장입금
											<br/>
											4. 기타 "몰"이 인정하는 결제수단 등
										</div>
										<div class="br20"></div>
										<span class="content_txt f_red">제 10 조 수신확인통지·구매신청 변경 및 취소</span><br/>
										1."몰"은 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다.
										<br/>
										2.수신확인통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있습니다.
										<br/>
										3."몰"은 배송전 이용자의 구매신청 변경 및 취소 요청이 있는 때에는 지체 없이 그 요청에 따라 처리합니다.
										<div class="br20"></div>
										<span class="content_txt f_red">제 11 조 배송, 적립금</span><br/>
										1."몰"은 이용자가 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 명시합니다. 만약 "몰"의 고의에 의한 중대한 과실로 약정 배송기간을 초과한 경우에는 그로 인한 이용자의 손해를 배상합니다.
										<br/>
										2."몰"은 이용자가 구매완료한 재화에 대하여 소정의 적립금을 지급합니다. 단 이 기간은 물품 배송일로 부터 약 1개월로 한정하며, 이용자가 구매완료후 직접 내려받습니다.(구입완료 후 반품 및 교환은 기본적으로 불가합니다.)
									</div>
									<div class="chap_t">
										<span class="chap_t_txt">제 4 장 청약의 철회 및 최저가보장</span>
										<a>
											<img src="https://www.fcseoul.com/resources/shop/_img/icon/icon_top.gif"/>
										</a>
									</div>
									<div class="chap_content">
										<span class="content_txt f_red">제 12 조 환급, 반품 및 교환</span><br/>
										1."몰"은 이용자가 구매 신청한 재화 또는 용역이 품절 등의 사유로 재화의 인도 또는 용역의 제공을 할 수 없을 때에는 지체 없이 그 사유를 이용자에게 통지하고, 사전에 재화 또는 용역의 대금을 받은 경우에는 대금을 받은 날부터 3일 이내에, 그렇지 않은 경우에는 그 사유 발생일로부터 3일 이내에 계약해제 및 환급절차를 취합니다.
										<br/>
										2.다음 각 호의 경우에는 "몰"은 배송된 재화일지라도 재화를 반품받은 다음 영업일 이내에 이용자의 요구에 따라 즉시 환급, 반품 및 교환 조치를 합니다. 다만 그 요구기한은 배송된 날로부터 7일 이내로 합니다.
										<div class="sub_txt">
											가) 배송된 재화가 주문내용과 상이하거나 "몰"이 제공한 정보와 상이할 경우
											<br/>
											나) 배송된 재화가 파손, 손상되었거나 오염되었을 경우
											<br/>
											다) 재화가 광고에 표시된 배송기간보다 늦게 배송된 경우
											<br/>
											라) 방문판매등에관한법률 제18조에 의하여 광고에 표시하여야 할 사항을 표시하지 아니한 상태에서 이용자의 청약이 이루어진 경우
										</div>
										<br/>
										<br/>
										3.다음 각 호의 경우에는 배송된 재화의 교환 및 반품이 제한 될 수 있습니다.
										<div class="sub_txt">
											가) 반품된 재화의 상품가치가 현저히 감소했을 경우
											<br/>
											나) 이용자가 구입완료를 선택하여 적립금을 내려 받은 이후 발생되는 반품의 경우
										</div>
									</div>
									<div class="chap_t">
										<span class="chap_t_txt">제 5 장 회원정보의 보호및 보안관리</span>
										<a>
											<img src="https://www.fcseoul.com/resources/shop/_img/icon/icon_top.gif"/>
										</a>
									</div>
									<div class="chap_content">
										<span class="content_txt f_red">제 13 조 개인정보보호</span><br/>
										1."몰"은 이용자의 정보수집시 구매계약 이행에 필요한 최소한의 정보를 수집합니다. 
										<br/>
										다음 사항을 필수사항으로 하며 그 외 사항은 선택사항으로 합니다.
										<div class="sub_txt">
											가) 성명 (한글, 영문)
											<br/>
											나) 주소
											<br/>
											다) 전화번호
											<br/>
											라) 희망ID(회원의 경우)
											<br/>
											마) 비밀번호(회원의 경우)
											<br/>
											바) 주문 비밀번호
										</div>
										<br/>
										2."몰"이 이용자의 개인식별이 가능한 개인정보를 수집하는 때에는 반드시 당해 이용자의 동의를 받습니다.
										<br/>
										3.제공된 개인정보는 당해 이용자의 동의없이 목적 외의 이용이나 제3자에게 제공할 수 없으며, 이에 대한 모든 책임은 "몰"이 집니다. 다만, 다음의 경우에는 예외로 합니다.
										<div class="sub_txt">
											가) 배송업무상 배송업체에게 배송에 필요한 최소한의 이용자의 정보(성명, 주소, 전화번호) 를 알려주는 경우
											<br/>
											나) 통계작성, 학술연구 또는 시장조사를 위하여 필요한 경우로서 특정 개인을 식별할 수 없는 형태로 제공하는 경우
										</div>
										<br/>
										4."몰"이 제2항과 제3항에 의해 이용자의 동의를 받아야 하는 경우에는 개인정보관리 책임자의 신원(소속, 성명 및 전화번호 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공받는자, 제공목적 및 제공할 정보의 내용)등 정보 통신망 이용촉진 등에 관한 법률 제16조제3항이 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다.
										<br/>
										<br/>
										5.이용자는 언제든지 "몰"이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 "몰"은 이에 대해 지체없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는 "몰"은 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.
										<br/>
										<br/>
										6."몰"은 개인정보 보호를 위하여 관리자를 한정하여 그 수를 최소화하며 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출, 변조 등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다.
										<br/>
										<br/>
										7."몰" 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체없이 파기합니다.
									</div>
									<div class="chap_t">
										<span class="chap_t_txt">제 6 장 회사의 의무와 회원의 의무</span>
										<a>
											<img src="https://www.fcseoul.com/resources/shop/_img/icon/icon_top.gif"/>
										</a>
									</div>
									<div class="chap_content">
										<span class="content_txt f_red">제 14 조 "몰"의 의무</span><br/>
										1."몰" 은 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 재화용역을 제공하는 데 최선을 다하여야 합니다.
										<br/>
										2."몰"은 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야 합니다.
										<br/>
										3."몰"이 상품이나 용역에 대하여 「표시광고의 공정화에 관한 법률」 제3조 소정의 부당한 표시광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다.
										<br/>
										4."몰"은 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.
										<div class="br20"></div>
										<span class="content_txt f_red">제 15 조 회원의 ID 및 비밀번호에 대한 의무</span><br/>
										1.제13조의 경우를 제외한 ID와 비밀번호에 관한 관리책임은 회원에게 있습니다.
										<br/>
										2.회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.
										<br/>
										3.회원이 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에 는 바로 "몰"에 통보하고 "몰"의 안내가 있는 경우에는 그에 따라야 합니다.
										<div class="br20"></div>
										<span class="content_txt f_red">제 16 조 이용자의 의무</span><br/>
										이용자는 다음 행위를 하여서는 안됩니다.
										<br/>
										<br/>
										1. 신청 또는 변경시 허위내용의 등록
										<br/>
										2. "몰"에 게시된 정보의 변경
										<br/>
										3. "몰"이 정한 정보 이외의 정보(컴퓨터 프로그램 등)의 송신 또는 게시
										<br/>
										4. "몰" 기타 제3자의 저작권 등 지적재산권에 대한 침해
										<br/>
										5. "몰" 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위
										<br/>
										6. 외설 또는 폭력적인 메시지화상음성 기타 공서양속에 반하는 정보를 몰에 공개 또는 게시하는 행위
									</div>
									<div class="chap_t">
										<span class="chap_t_txt">제 7 장 저작권</span>
										<a>
											<img src="https://www.fcseoul.com/resources/shop/_img/icon/icon_top.gif"/>
										</a>
									</div>
									<div class="chap_content">
										<span class="content_txt f_red">제 17 조 저작권의 귀속 및 이용제한</span><br/>
										1."몰"이 작성한 저작물에 대한 저작권 기타 지적재산권은 "몰"에 귀속합니다.
										<br/>
										2.이용자는 "몰"을 이용함으로써 얻은 정보를 "몰"의 사전 승낙없이 복제, 전송, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.
										<div class="br20"></div>
										<span class="content_txt f_red">제 18 조 분쟁해결</span><br/>
										1."몰"은 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구(고객만족센터)를 설치하여 운영합니다.
										<br/>
										2."몰"은 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보해 드립니다.
										<br/>
										3. "몰"과 이용자간에 발생한 분쟁은 전자거래기본법 제28조 및 동 시행령 제15조에 의하여 설치된 전자거래분쟁조정위원회의 조정에 따를 수 있습니다.
										<div class="br20"></div>
										<span class="content_txt f_red">제 19 조 재판권 및 준거법</span><br/>
										1."몰"과 이용자간에 발생한 전자거래 분쟁에 관한 소송은 민사소송법상의 관할법원에 제기합니다.
										<br/>
										2."몰"과 이용자간에 제기된 전자거래 소송에는 한국법을 적용합니다.
										<div class="br20"></div>
										<div class="content_txt">
											본 약관은 <span class="f_red">2016년 3월 18일</span>부터 시행합니다.
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