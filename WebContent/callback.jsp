<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<script type="text/javascript">
  var naver_id_login = new naver_id_login("YacP7ni0eeWF8J32HBok", "http://localhost:5050/WebProject/callback.jsp");
  // 접근 토큰 값 출력
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
	let token = naver_id_login.oauthParams.access_token;
    let id = naver_id_login.getProfileData('id');
    let email = naver_id_login.getProfileData('email');
    let nickname = naver_id_login.getProfileData('nickname');
    let name = naver_id_login.getProfileData('name');
    let gender = naver_id_login.getProfileData('gender');
    /* let age = naver_id_login.getProfileData('age'); */
    $.ajax({
    	type : "POST",
    	url : "./loginNaverServlet",
    	data : {token:token, id:id, email:email, nickname:nickname, name:name, gender:gender},
    	success : function(){
    		location.href = "FCmain.jsp"
    	/* 	if(LoginN == 1){
    		location.href ="mainPage.jsp"
    		} else {
    			alert("로그인 실패")
    		} */
    	},
    	error : function(){
    		alert("로그인 오류");
    	}
    })
   
  }
</script>
</body>
</html>
