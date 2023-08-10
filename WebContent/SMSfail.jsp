<%@ page import="net.nurigo.java_sdk.api.Message"%>
<%@ page import="net.nurigo.java_sdk.Coolsms"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="coolsms.Coolsms" %>
<%@ page import="coolsms.exceptions.CoolsmsException" %>
<%@ page import="coolsms.messages.Message" %>
<%@ page import="java.util.HashMap" %>

<%
try {
    String apiKey = "NCSHWUSIDOYUNGZG";
    String apiSecret = "VLBHWWYDREFLPQTGIUUHIXWDUSUJWFVB";
    String from = "01058945806";
    String to = "01058945806";

    // Coolsms API 초기화
    Coolsms coolsms = new Coolsms(apiKey, apiSecret);
    Message sms = new Message();

    // 인증번호 생성 (랜덤 숫자)
    String verificationCode = String.valueOf((int) (Math.random() * 900000) + 100000);

    HashMap<String, String> params = new HashMap<String, String>();
    params.put("to", to);
    params.put("from", from);
    params.put("type", "SMS");
    params.put("text", "인증번호: " + verificationCode);
    params.put("app_version", "JAVA SDK v2.2");

    // 문자 메시지 전송
    HashMap<String, String> resultMap = sms.send(params);

    // 전송 결과 확인
    String resultCode = resultMap.get("result_code");
    if (resultCode.equals("00")) {
        // 전송 성공
        // 인증번호를 세션에 저장하여 다음 페이지에서 사용할 수 있도록 합니다.
        session.setAttribute("verificationCode", verificationCode);
        response.getWriter().write("success");
    } else {
        // 전송 실패
        response.getWriter().write("failure");
    }
} catch (CoolsmsException e) {
    e.printStackTrace();
    response.getWriter().write("failure");
}
%>