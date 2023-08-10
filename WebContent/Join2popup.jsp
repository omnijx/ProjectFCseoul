<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>인증 팝업</title>
  <link rel="shortcut icon" type="image/x-icon" href="https://fcseoulpub.s3.ap-northeast-2.amazonaws.com/multi01/Club/Club/1675316444376.png">
  <script src="js/jquery-3.7.0.min.js"></script>
  <script>
    // 휴대폰 번호 유효성 검사
    function validatePhoneNumber() {
      var phoneNumber = document.getElementById("phoneNumber").value;
      // 유효성 검사 로직 구현
      // 예: 번호 길이, 숫자 체크 등

      // 유효성 검사 통과 시 인증번호 요청 버튼 활성화
      var button = document.getElementById("requestButton");
      button.disabled = false;
    }
	
    // 인증번호 요청
    function requestOTP() {
      // 휴대폰 번호 가져오기
      var phoneNumber = document.getElementById("phoneNumber").value;
//       var phoneNumber = document.getElementById("otp").value;
      $.ajax({
    	  url: "./UserPhoneServlet", // 인증번호 발송을 처리하는 JSP 파일 경로
          type: "POST",
          data: {
            phoneNumber: phoneNumber
          },
          success: function(response) {
            console.log("인증번호가 성공적으로 발송되었습니다.");
            console.log(response);
          },
          error: function(error) {
            // 인증번호 발송 실패 후 처리
            console.error("인증번호 발송에 실패했습니다.");
          }
      });

      // 인증번호 입력란 보이도록 변경
      document.getElementById("otpContainer").style.display = "block";
      var phoneNumber = document.getElementById("phoneNumber").value;
	    // 인증 확인
    }
	    function verifyOTP() {
	      var otp = document.getElementById("otp").value;
	      var phoneNumber = document.getElementById("phoneNumber").value;
	      var name = document.getElementById("name").value;
	      $.ajax({
	    	  url: "./UserOtpServlet", // 인증번호 발송을 처리하는 JSP 파일 경로
	          type: "POST",
	          data: {
	            phoneNumber: phoneNumber,
	            otp: otp,
	          },
	          dataType: "json",
	          success: function(data) {
	        	  if(data.result == "success"){
	        	  alert(data.message);
	        	  window.opener.location.href = "FcController?command=join3&phone="+phoneNumber+"&name="+name; // 다음 페이지로 이동
	        	  alert("!!!!!!!!!!!!!!!");
	              window.close(); // 현재 팝업 창 닫기
	        	  } else {
	        		  alert("!!!");
		        	  alert(data.message);
	        	  }
	          },
	          error: function(error) {
	        	  alert("실패");
	          }
	      });
	    }


    // 팝업에서 인증 처리 후, 부모 창으로 결과 전달
    function sendResult(result) {
      window.opener.postMessage(result, window.opener.location.origin);
      window.close();
    }
  </script>
  
</head>
<body>
  <h2>휴대폰 인증</h2>
  <form>
  	<input type="text" placeholder="성명입력" name="name" id="name"/>
    <label for="phoneNumber"><h3>휴대폰 번호</h3></label>
    <input type="text" id="phoneNumber" name="phoneNumber" maxlength="11" onkeyup="validatePhoneNumber()" placeholder="숫자만 입력">

    <button type="button" id="requestButton" onclick="requestOTP()" disabled>인증번호 받기</button>

    <div id="otpContainer" style="display: none;">
      <label for="otp">인증번호:</label>
      <input type="text" id="otp" name="otp" maxlength="6">

      <button type="button" onclick="verifyOTP()">인증 확인</button>
    </div>
  </form>
</body>
</html>
