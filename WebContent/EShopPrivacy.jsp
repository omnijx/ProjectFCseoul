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
	<link rel="stylesheet" href="css/EShopPrivacy.css">
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
									<span class="sub_t2">개인정보처리방침</span>
								</td>
							</tr>
							<tr>
								<td class="upperpage_title">
									<span class="upperpage_t1">개인정보처리방침</span>
									<img src="https://www.fcseoul.com/resources/shop/_img/product/title_fcseoul.gif"/>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="br15"></div>
					<table width="100%">
						<tbody>
							<tr>
								<td style="text-align: right;">
									<select>
										<option value="ver1">버전 V1.0 (2016.01.15 ~ 현재까지 적용)</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>
									<div class="chap_t" style="padding-top: 20px;">
										<span class="chap_t_txt">1. 총칙</span>
										<a>
											<img src="https://www.fcseoul.com/resources/shop/_img/icon/icon_top.gif"/>
										</a>
									</div>
									<div class="chap_content">
										① 개인정보란 생존하는 개인에 관한 정보로서 당해 정보에 포함되어 있는 성명, 주민등록번호 등의 사항에 의하여 당해 개인을 식별할 수 있는 정보(당해 정보만으로는 특정 개인을 식별할 수 없더라도 다른 정보와 용이하게 결합하여 식별할 수 있는 것을 포함합니다)를 말합니다.
										<br/>
										② FC서울 웹사이트는 귀하의 개인정보보호를 매우 중요시하며, 『정보통신망이용촉진및정보보호에관한법률』상의 개인정보보호규정 및 정보통신부가 제정한 『개인정보보호지침』을 준수하고 있습니다. FC서울 웹사이트는 개인정보보호정책을 통하여 귀하께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.
										<br/>
										③ FC서울 웹사이트는 개인정보보호정책을 홈페이지 첫 화면에 공개함으로써 귀하께서 언제나 용이하게 보실 수 있도록 조치하고 있습니다.
										<br/>
										④ FC서울 웹사이트는 개인정보보호정책의 지속적인 개선을 위하여 개인정보보호정책을 개정하는데 필요한 절차를 정하고 있습니다. 그리고 개인정보보호정책을 개정하는 경우 버전번호 등을 부여하여 개정된 사항을 귀하께서 쉽게 알아볼 수 있도록 하고 있습니다.
									</div>
									<div class="chap_t">
										<span class="chap_t_txt">2. 수집하는 개인정보 항목</span>
										<a>
											<img src="https://www.fcseoul.com/resources/shop/_img/icon/icon_top.gif"/>
										</a>
									</div>
									<div class="chap_content">
										1) 회사는 회원가입, 상담, 서비스 신청, 상품 판매 위탁 업체(플레이위드어스/GS멤비즈(주))의 예매 및 배송을 위한 자료 등을 위해 아래와 같은 개인정보를 수집하고 있습니다.
										<br/>
										<br/>
										<br/>
										·수집항목 : 이름 , 생년월일 , 성별 , 로그인ID , 비밀번호 , 닉네임, 자택 주소 , 휴대전화번호 , 이메일 , 연계정보(CI), 중복가입확인정보(DI)
										<br/>
										·개인정보 제공(플레이위드어스) : 이름 , 생년월일, 로그인ID , 성별, 주소, 휴대폰번호
										<br/>
										·개인정보 제공(GS멤비즈(주)) : 이름, 생년월일, 성별, 주소, 휴대폰번호, 이메일 연계정보(CI), 중복가입확인정보(DI)
										<br/>
										<br/>
										<table class="pri_table">
											<colgroup>
												<col width="22%"/>
												<col width="*"/>
												<col width="20%"/>
												<col width="15%"/>
												<col width="15%"/>
											</colgroup>
											<caption></caption>
											<tr>
												<th>서비스유형</th>
												<th>수집·이용목적</th>
												<th>필수항목</th>
												<th>선택항목</th>
												<th class="none">수집방법</th>
											</tr>
											<tr>
												<td>
													FC서울 쇼핑몰 상품 판매
												</td>
												<td>
													·연간회원 이용 및 상품배송 등 회사가 제공하는 제반 서비스 공급
													<br/>
													<br/>
													·상담·불만 처리 및 서비스관련 정보제공
												</td>
												<td>
													이름, 생년월일, 주소, 휴대폰번호
												</td>
												<td>
												</td>
												<td>
													플레이위드어스
												</td>
											</tr>
										</table>
										<br/>
										<br/>
										2) 서비스 이용과정이나 사업 처리과정에서 아래와 같은 정보들이 생성되어 수집될 수 있습니다.
										<br/>
										- 서비스 이용기록, 접속로그, 쿠키, 접속IP 정보, 불량이용 기록
										<br/>
										<br/>
										3) 서비스 이용 과정에서 이용자의 별도 동의 절차를 거쳐 개인정보가 추가 수집될 수 있습니다.
										<br/>
										- 개인정보 수집 및 이용에 대한 동의를 거부할 수 있으며 거부 시 별도 동의를 받는 서비스는 참여하실 수 없습니다.
										<br/>
										<br/>
										<table class="pri_table">
											<colgroup>
												<col width="25%"/>
												<col width="*"/>
												<col width="25%"/>
												<col width="25%"/>
											</colgroup>
											<caption></caption>
											<tr>
												<th>서비스명</th>
												<th>수집·이용 목적</th>
												<th>수집하는 항목</th>
												<th class="none">보유 및 이용기간</th>
											</tr>
											<tr>
												<td>홈페이지 회원가입 14세미만 법정대리인 동의</td>
												<td>미성년자 법정대리인 동의</td>
												<td>이름, 생년월일, 이메일</td>
												<td>동의 후 지체 없이 파기</td>								
											</tr>
											<tr>
												<td>고객센터</td>
												<td>[Q&amp;A문의]<br>문의내역 확인과 답변처리</td>
												<td>이름, 아이디, 이메일, 연락처 회원의 문의/답변 내용에 포함된 개인정보</td>
												<td>문의 답변 완료 후 1주일 보관 후 파기</td>
											</tr>
											<tr>
												<td>이벤트신청</td>
												<td>이벤트 응모 및 상품배송 등 회사가 제공하는 제반 서비스 공급</td>
												<td>· 이름, 아이디, 이메일, 연락처<br>· 회원 이벤트 내용에 포함된 개인정보</td>
												<td>이벤트 완료 후 지체없이 파기</td>
											</tr>
											<tr>
												<td>FC서울 쇼핑몰</td>
												<td>물품배송</td>
												<td>이름, 아이디, 연락처, 주소</td>
												<td>배송 완료 후 1개월 후 지체없이 파기</td>
											</tr>
										</table>
									</div>
									<div class="chap_t">
										<span class="chap_t_txt">3. 개인정보의 수집 및 이용목적</span>
										<a>
											<img src="https://www.fcseoul.com/resources/shop/_img/icon/icon_top.gif"/>
										</a>
									</div>
									<div class="chap_content">
										1) 개인정보는 생존하는 개인에 관한 정보로서 회원 개인을 식별할 수 있는 정보(당해 정보만으로는 특정 개인을 식별할 수 없더라도 다른 정보와 용이하게 결합하여 식별할 수 있는 것을 포함)를 말합니다. 회사는 서비스 제공, 상담 및 불만 처리 등의 서비스 제공을 하기 위하여 개인정보를 수집·이용하고 있습니다. 고객은 동의를 거부할 권리를 가지고 있으며, 필수적 동의 사항을 거부할 경우 서비스 제공이 어려울 수 있습니다. 선택적 동의 사항을 거부할 경우에도 서비스 이용에는 제한이 없습니다.
										<br/>
										<br/>
										2) 회사는 고객의 기본적 인권 침해의 우려가 있는 민감한 개인정보(인종 및 민족, 사상 및 신조, 출신지 및 본적지, 정치적 성향 등)는 수집하지 않습니다.
										<br/>
										<br/>
										3) 회사가 수집한 개인정보는 다음의 목적을 위해 활용합니다.
										<br/>
										<br/>
										· 서비스 제공
										<br/>
										콘텐츠 제공, 물품배송 서비스 제공
										<br/>	
										<br/>	
										·회원 관리
										<br/>
										회원제 서비스 이용에 따른 본인확인, 개인식별, 불량회원의 부정 이용 방지와 비인가 사용 방지, 가입 의사 확인, 가입 및 가입횟수 제한, 만 14세 미만 아동 개인정보 수집 시 법정대리인 동의여부 확인, 추후 법정대리인 본인확인, 분쟁 조정을 위한 기록보존, 불만처리 등 민원처리, 고지사항 전달, 회원탈퇴 의사의 확인
										<br/>
										<br/>
										·신규 서비스 개발, 기능 개선에 활용
										<br/>
										신규 서비스(제품) 개발 및 특화, 맞춤형 서비스 제공, 기능 개선, 접속 빈도 파악, 회원의 서비스 이용에 대한 통계 확인
									</div>
									<div class="chap_t">
										<span class="chap_t_txt">4. 개인정보의 보유 및 이용기간</span>
										<a>
											<img src="https://www.fcseoul.com/resources/shop/_img/icon/icon_top.gif"/>
										</a>
									</div>
									<div class="chap_content">
										회사는 고객의 서비스 가입일로부터 고객에게 서비스를 제공하는 기간 동안에 한하여 고객의 개인정보를 보유 및 이용하게 됩니다. 회원 탈퇴를 요청하거나 개인정보의 수집 및 이용에 대한 동의를 철회하는 경우, 수집/이용목적을 달성하거나 보유/이용기간이 종료한 경우, 사업폐지 등의 사유발생시 당해 개인정보를 지체 없이 파기합니다.
										<br/>
										<br/>
										다만, 정보통신망 이용촉진 및 정보보호 등에 관한 법률에 따라 1년 간 이용 기록이 없는 회원의 경우, 이용중인 회원의 개인정보와 별도 분리하여 안전하게 보관하며, 동 개인정보는 법률에 의한 경우가 아니고서는 보전되는 이외의 다른 목적으로 이용되지 않습니다.
										<br/>
										<br/>
										서비스유형별 보유기간은 아래와 같습니다.
										<table class="pri_table">
											<colgroup>
												<col width="33%"/>
												<col width="*"/>
												<col width="33%"/>
											</colgroup>
											<caption></caption>
											<tr>
												<th>서비스유형</th>
												<th>보유기간</th>														
												<th class="none">비고</th>
											</tr>
											<tr>
												<td>FC서울 홈페이지</td>
												<td>서비스 계약 해지시까지(탈퇴)</td>
												<td>1년간 이용 기록이 없는 회원정보는 분리하여 보관</td>													
											</tr>
											<tr>
												<td>GS&amp;POINT</td>
												<td>서비스 계약 해지시까지(탈퇴)</td>
												<td>&nbsp;</td>
											</tr>
											<tr>
												<td>경품수령</td>
												<td>수령리스트 : 5년</td>
												<td>회계 처리 관련 기록 보존연한</td>
											</tr>
											<tr>
												<td>FC서울 쇼핑몰</td>
												<td>경품발송 후 1개월 후 지체없이 파기</td>
												<td>&nbsp;</td>
											</tr>
											<tr>
												<td>고객센터</td>
												<td>고객 문의 해결 후 1주일 후 지체없이 파기</td>
												<td>&nbsp;</td>
											</tr>
										</table>
										<br/>
										<br/>
										단, 회계 처리 및 정산, 소송이나 분쟁 등 기타 필요한 경우를 대비하여 일정기간 보유하여야 할 필요가 있을 경우 개인정보는 일정기간 보유합니다. 또한 상법, 국세기본법, 통신비밀보호법, 전자상거래 등에서 소비자보호에 관한 법률, 신용정보의 이용 및 보호에 관한 법률 등 관계법령에 따라 보존할 필요가 있는 경우 회사는 관계법령에서 정한 기간 동안 회원정보를 보관합니다. 이 경우 회사는 보관하는 정보를 그 보관의 목적으로만 이용하며 보존기간은 다음과 같습니다.
										<br/>
										<br/>
										· 상업장부와 영업에 관한 중요서류 및 전표 : 10년 - 중요서류/5년 - 전표(상법)
										<br/>
										· 거래에 관한 장부 및 증빙서류 : 5년(국세기본법, 법인세법, 부가가치세법 등)
										<br/>
										· 통신사실확인자료 제공시 필요한 가입자의 전기통신 일시, 전기통신 개시·종료시간, 통신번호 등 상대방의 가입자번호,사용초, 통신신망에 접속된 정보통신기기의 위치추적자료 : 12개월(통신비밀보호법)
										<br/>
										· 통신사실확인자료 제공시 필요한 로그기록자료, IP주소 등 : 3개월(통신비밀보호법)
										<br/>
										· 표시/광고에 관한 기록 : 6개월(전자상거래등에서의 소비자보호에 관한 법률)
										<br/>
										· 계약 또는 청약철회 등에 관한 기록 : 5년(전자상거래등에서의 소비자보호에 관한 법률)
										<br/>
										· 대금결제 및 재화 등의 공급에 관한 기록 : 5년(전자상거래등에서의 소비자보호에 관한 법률)
										<br/>
										· 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년(전자상거래등에서의 소비자보호에 관한 법률)
										<br/>
										· 신용정보의 수집/처리 및 이용 등에 관한 기록 : 3년(신용정보의 이용 및 보호에 관한 법률)
									</div>
									<div class="chap_t">
										<span class="chap_t_txt">5. 개인정보의 이용</span>
										<a>
											<img src="https://www.fcseoul.com/resources/shop/_img/icon/icon_top.gif"/>
										</a>
									</div>
									<div class="chap_content">
										① 회원이 FC서울 가입 시 제공한 개인정보는 각종 고객상담, E-Mail 서비스, 개인 홈페이지 서비스를 원활하게 제공하기 위한 것입니다.
										<br/>
										② 회사가 수집하는 개인정보는 서비스의 제공에 필요한 최소한으로 하되, 필요한 경우 보다 더 자세한 정보를 요구할 수 있습니다.
										<br/>
										③ 회사는 회사에서 벌어지는 각종 이벤트 행사에 참여한 회원의 개인정보를 제3자에게 제공할 수 있습니다. 이러한 경우에도 개인정보의 제3자 제공은 이용자 의 동의 하에서만 이루어지며 개인정보가 제공되는 것을 원하지 않는 경우에는, 특정 서비스를 이용하지 않거나 특정한 형태의 판촉이나 이벤트에 참여하지 않으면 됩니다.
										<br/>
										④ 회사가 외부업체(이하 위탁 받는 업체)에 특정서비스의 제공을 위탁하는 경우 서비스 제공에 필요한 회원의 개인정보를 회원의 동의를 받아 위탁 받는 업체에 제공할 수 있으며 서비스 위탁 사실을 명시 합니다. 위탁 받는 업체는 제공받은 회원의 개인정보의 수집, 취급, 관리에 있어 위탁 받은 목적 외의 용도로 이를 이용하거나 제3자에게 제공하지 않습니다.
										<br/>
										⑤ 회사는 회사가 제공하는 서비스를 이용하는 이용자를 대상으로 해당 서비스의 양적, 질적 향상을 위하여 이용자의 개인 식별이 가능한 개인정보를 이용자의 동의를 받아 이를 수집하여 맞춤서비스, 온라인광고서비스, 쇼핑몰서비스, 커뮤니티서비스, 유료컨텐츠서비스, 모바일서비스, 콜센터를 통한 보험, 신용카드 등의 텔레마케팅 서비스 등에 이용할 수 있습니다.
										<br/>
										⑥ 회사는 회원에게 제공되는 서비스의 질을 향상시키기 위해 맞춤서비스, 온라인광고 서비스, 쇼핑몰서비스, 커뮤니티서비스, 유료컨텐츠서비스, 모바일서비스, 보험, 신용카드 등의 텔레마케팅서비스, 통계작성 또는 시장조사 등 다양한 서비스를 제공할 목적으로 여러 분야의 전문 컨텐츠 사업자 혹은 비즈니스 사업자와 함께 파트너쉽을 맺을 수 있습니다.
										<br/>
										⑦ 회사는 5항의 파트너쉽을 맺은 제휴사와 회원의 개인정보를 제공, 공유할 경우 반드시 이용자의 동의를 받아 필요한 최소한의 정보를 제휴사에게 제공, 공유하며 이때 누구에게 어떤 목적으로 어떠한 정보(제휴사명, 제휴의 목적, 공유하는 개인 정보)를 공유하는지 명시합니다.
										<br/>
										⑧ 동조 3항 ~ 7항의 개인정보 이용 시 이용자의 동의는 별도의 공지사항 등을 통하여 공지하는 방법으로 받아낼 수 있습니다.
										<br/>
										⑨ 회원은 원하는 경우 언제든 회사에 제공한 개인정보의 수집과 이용에 대한 동의를 철회할 수 있습니다.
									</div>
									<div class="chap_t">
										<span class="chap_t_txt">6. 개인정보의 파기절차 및 방법</span>
										<a>
											<img src="https://www.fcseoul.com/resources/shop/_img/icon/icon_top.gif"/>
										</a>
									</div>
									<div class="chap_content">
										회사는 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체없이 파기합니다. 파기절차 및 방법은 다음과 같습니다. 다만, 정보통신망 이용촉진 및 정보보호 등에 관한 법률에 따라 1년 간 이용 기록이 없는 회원의 경우, 이용중인 회원의 개인정보와 별도 분리하여 안전하게 보관하며, 동 개인정보는 법률에 의한 경우가 아니고서는 보전되는 이외의 다른 목적으로 이용되지 않습니다.
										<br/>
										<br/>
										·파기절차
										<br/>
										회원님이 회원가입 등을 위해 입력하신 정보는 목적이 달성된 후 별도의 DB로 옮겨져(종이의 경우 별도의 서류함) 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(보유 및 이용기간 참조) 일정 기간 저장된 후 파기되어집니다.
										<br/>
										별도 DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 보유되어지는 이외의 다른 목적으로 이용되지 않습니다.
										<br/>
										<br/>
										·파기방법
										<br/>
										전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.
									</div>
									<div class="chap_t">
										<span class="chap_t_txt">7. 개인정보 제공</span>
										<a>
											<img src="https://www.fcseoul.com/resources/shop/_img/icon/icon_top.gif"/>
										</a>
									</div>
									<div class="chap_content">
										회사는 이용자의 개인정보를 원칙적으로 외부에 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.
										<br/>
										<br/>
										·이용자들이 사전에 동의한 경우
										<br/>
										·법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우
									</div>
									<div class="chap_t">
										<span class="chap_t_txt">8. 수집한 개인정보의 위탁</span>
										<a>
											<img src="https://www.fcseoul.com/resources/shop/_img/icon/icon_top.gif"/>
										</a>
									</div>
									<div class="chap_content">
										회사는 위탁업무계약서 등을 통하여 개인정보보호 관련 규정의 준수, 개인정보에 관한 비밀유지, 제3자 제공에 대한 금지, 사고시의 책임부담, 위탁기간, 처리 종료후의 개인정보 파기 의무 등을 규정하고, 이를 준수하도록 관리하고 있습니다.
										<br/>
										<br/>
										현재 FC서울의 원활한 서비스 제공을 위해 필수적인 취급 위탁 업체는 아래와 같습니다.
										<br/>
										<br/>
										<table class="pri_table">
											<colgroup>
												<col width="20%"/>
												<col width="*"/>
												<col width="25%"/>
												<col width="25%"/>
												<col width="14%"/>
											</colgroup>
											<caption></caption>
											<tr>
												<th>서비스유형</th>
												<th>위탁받는자</th>
												<th>위탁목적</th>
												<th>제공정보항목</th>
												<th class="none">보유 및 이용기간</th>
											</tr>
											<tr>
												<td>FC서울 홈페이지</td>
												<td>LG CNS/<br>크림하우스㈜</td>
												<td>구매 및 요금 결제 ,물품배송 또는 청구지 등 발송,<br>회원관리 회원제 서비스 이용에 따른 본인확인 ,불만처리 등 민원처리 ,고지사항 전달</td>
												<td>이름, 생년월일, 성별, 로그인 ID, 자택전화번호, 주소, 휴대폰번호, 이메일</td>		
												<td>위탁계약<br>종료시까지</td>											
											</tr>
											<tr>
												<td>FC서울 쇼핑몰 상품판매</td>
												<td>플레이위드어스</td>
												<td>상품판매 및 발송</td>
												<td>이름, 로그인ID, 생년월일, 휴대폰번호</td>		
												<td>위탁계약<br>종료시까지</td>											
											</tr>
											<tr>
												<td>GS&amp;POINT</td>
												<td>GS멤비즈(주)</td>
												<td>멤버십 서비스 이용 및 적립 / 포인트 사용 확인 서비스</td>
												<td>이름, 생년월일, 성별, 주소, 휴대폰번호, 이메일 연계정보(CI)</td>		
												<td>위탁계약<br>종료시까지</td>											
											</tr>
										</table>
									</div>
									<div class="chap_t">
										<span class="chap_t_txt">9. 이용자 및 법정대리인의 권리와 그 행사방법</span>
										<a>
											<img src="https://www.fcseoul.com/resources/shop/_img/icon/icon_top.gif"/>
										</a>
									</div>
									<div class="chap_content">
										이용자 및 법정대리인은 언제든지 등록되어 있는 자신 혹은 당해 만 14세 미만 아동의 개인정보를 조회하거나 수정할 수 있으며 가입해지를 요청할 수도 있습니다.
										<br/>
										이용자 혹은 만 14세 미만 아동의 개인정보 조회·수정을 위해서는 '회원정보'의 '내 정보'를 통하여 가능하며, 가입해지 시에는 '회원정보'의 '해지신청'을 클릭하여 본인 확인 절차를 거치신 후 직접 열람, 정정 또는 탈퇴가 가능합니다. 혹은 개인정보 관리책임자에게 서면, 전화 또는 이메일로 연락하시면 지체 없이 조치하겠습니다.
										<br/>
										<br/>
										이용자가 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 당해 개인정보를 이용 또는 제공하지 않습니다. 또한 잘못된 개인정보를 제3자에게 이미 제공한 경우에는 정정 처리결과를 제3자에게 지체 없이 통지하여 정정이 이루어지도록 하겠습니다.
										<br/>
										회사는 이용자 혹은 법정대리인의 요청에 의해 해지 또는 삭제된 개인정보는 "회사가 수집하는 개인정보의 보유 및 이용기간"에 명시된 바에 따라 처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고 있습니다.
									</div>
									<div class="chap_t">
										<span class="chap_t_txt">10. 개인정보 자동수집 장치의 설치, 운영 및 그 거부에 관한 사항</span>
										<a>
											<img src="https://www.fcseoul.com/resources/shop/_img/icon/icon_top.gif"/>
										</a>
									</div>
									<div class="chap_content">
										이용자 개개인에게 개인화되고 맞춤화된 서비스를 제공하기 위해서 회사는 이용자의 정보를 저장하고 수시로 불러오는 '쿠키(cookie)'를 사용합니다.
										<br/>
										쿠키는 웹사이트를 운영하는데 이용되는 서버가 사용자의 브라우저에게 보내는 조그마한 데이터 꾸러미로 이용자 컴퓨터의 하드디스크에 저장됩니다.
										<br/>
										<br/>
										· 쿠키 등 사용 목적
										<br/>
										회원과 비회원의 접속 빈도나 방문 시간 등을 분석, 이용자의 취향과 관심분야를 파악 및 자취 추적, 각종 이벤트 참여 정도 및 방문 회수 파악 등을 통한 타겟 마케팅 및 개인 맞춤 서비스 제공 귀하는 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서, 귀하는 웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수도 있습니다.
										<br/>
										<br/>
										· 쿠키 설정 거부 방법
										<br/>
										쿠키 설정을 거부하는 방법으로는 회원님이 사용하시는 웹 브라우저의 옵션을 선택함으로써 모든 쿠키를 허용하거나 쿠키를 저장할 때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수 있습니다.
										<br/>
										설정방법 예(인터넷 익스플로어의 경우) : 웹 브라우저 상단의 도구 > 인터넷 옵션 > 개인정보
										<br/>
										단, 귀하께서 쿠키 설치를 거부하였을 경우 서비스 제공에 어려움이 있을 수 있습니다.
									</div>
									<div class="chap_t">
										<span class="chap_t_txt">11. 개인정보보호를 위한 기술적 대책</span>
										<a>
											<img src="https://www.fcseoul.com/resources/shop/_img/icon/icon_top.gif"/>
										</a>
									</div>
									<div class="chap_content">
										고객의 개인정보를 보호하기 위해 기술적 대책을 마련하고 있으며, 이를 적용하고 있습니다.
										<br/>
										<br/>
										※ 기술적 대책
										<br/>
										고객의 개인정보를 취급함에 있어 개인정보가 분실, 도난, 누출, 변조 또는 훼손되지 않도록 안전성 확보를 위하여 다음과 같은 기술적 대책을 강구하고 있습니다.
										<br/>
										<br/>
										· 고객의 주민번호는 저장되지 않으며 연계정보(CI), 중복가입확인정보(DI)로 저장되어 있습니다.
										<br/>
										· fcseoul.com은 백신프로그램을 이용하여 컴퓨터 바이러스에 의한 피해를 방지하기 위한 조치를 취하고 있습니다. 백신프로그램은 주기적으로 업데이트되며 갑작스런 바이러스가 출현할 경우 백신이 나오는 즉시 이를 제공함으로써 개인정보가 침해 되는 것을 방지하고 있습니다.
										<br/>
										· fcseoul.com은 암호알고리즘을 이용하여 네트워크 상의 개인정보를 안전하게 전송할 수 있는 보안장치(SSL 또는 SET)를 채택하고 있습니다. 해킹 등 외부침입에 대비하여 각 서버마다 침입차단시스템 및 취약점 분석시스템 등을 이용하여 보안에 만전을 기하고 있습니다.
									</div>
									<div class="chap_t">
										<span class="chap_t_txt">12. 개인정보에 관한 민원서비스</span>
										<a>
											<img src="https://www.fcseoul.com/resources/shop/_img/icon/icon_top.gif"/>
										</a>
									</div>
									<div class="chap_content">
										회사는 고객의 개인정보를 보호하고 개인정보와 관련한 불만을 처리하기 위하여 아래와 같이 관련 부서 및 개인정보관리책임자를 지정하고 있습니다.
										<br/>
										<br/>
										· 개인정보관리책임자 성명 : 이재근
										<br/>
										· 소속부서 : 사업부문
										<br/>
										· 전자우편 : hbss@gssports.co.kr
										<br/>
										<br/>
										· 개인정보관리담당자 성명 : 김기남
										<br/>
										· 소속부서 : 재경팀
										<br/>
										· 전자우편 : kinkim@gssports.co.kr
										<br/>
										<br/>
										귀하께서는 회사의 서비스를 이용하시며 발생하는 모든 개인정보보호 관련 민원을 개인정보관리책임자 혹은 담당부서로 신고하실 수 있습니다. 회사는 이용자들의 신고사항에 대해 신속하게 충분한 답변을 드릴 것입니다.
										<br/>
										<br/>
										기타 개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다.
										<br/>
										<br/>
										· 개인분쟁조정위원회 (www.1336.or.kr)
										<br/>
										· 정보보호마크인증위원회 (www.eprivacy.or.kr/02-580-0533~4)
										<br/>
										· 대검찰청 인터넷범죄수사센터 (http://icic.sppo.go.kr/02-3480-3600)
										<br/>
										· 경찰청 사이버테러대응센터 (http://icic.sppo.go.kr/02-392-0330)
										<br/>
										<br/>
										· 부칙 (2005.3.1)
										<br/>
										이 약관은 2005년 3월 1일부터 시행하며 종전의 약관은 이 약관으로 대체합니다.
										<br/>
										· 부칙 (2016.1.15)
										<br/>
										이 약관은 2016년 1월 15일부터 시행하며 종전의 약관은 이 약관으로 대체합니다.
										<br/>
										<br/>
										'FC서울'은 (이하 '회사'는) 고객님의 개인정보를 중요시하며, "정보통신망 이용촉진 및 정보보호"에 관한 법률을 준수하고 있습니다.
										<br/>
										회사는 개인정보처리방침을 통하여 고객님께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.
										<br/>
										회사는 개인정보처리방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.
										<br/>
										<br/>
										본 방침은: 2016 년 01 월 15 일 부터 시행됩니다.
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