package user;
import net.nurigo.sdk.message.service.DefaultMessageService;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;

public class Sms {
	
	
	final DefaultMessageService messageService;
	Sms() {
		String apiKey ="NCSHWUSIDOYUNGZG";
		String secretApiKey = "VLBHWWYDREFLPQTGIUUHIXWDUSUJWFVB";
		this.messageService = NurigoApp.INSTANCE.initialize(apiKey, secretApiKey, "https://api.coolsms.co.kr");
		try {
		} catch(Exception e) {
			e.printStackTrace();
		}
	}


	public String sendMobileOTP(String phone){
	      String mobileOTPNum = "";
	      for(int i=1; i<=6; i++) {
	         int num = (int)(Math.random()*9)+1;
	         mobileOTPNum += num;
	      }
	        try {
	           Message message = new Message();
	           message.setFrom("01058945806");
	           message.setTo(phone);
	           message.setText("FC서울 모바일 인증번호는 ["+mobileOTPNum+"] 입니다.");
	           
	           SingleMessageSentResponse response = this.messageService.sendOne(new SingleMessageSendingRequest(message));
	           if(response != null) {
	              System.out.println("인증번호를 위한 문자가 발송되었습니다.");
	           }
	        }catch(Exception e) {
	        	System.out.println(phone);
	        	System.out.println("문자발송 실패: " + e.getMessage());
	        }
	        return mobileOTPNum;
	}
//	public static void main(String[] args) throws Exception{
//		Sms sms = new Sms();
//		sms.sendMobileOTP();
//	}
}