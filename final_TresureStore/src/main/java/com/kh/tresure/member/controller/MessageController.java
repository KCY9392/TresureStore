package com.kh.tresure.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.tresure.common.Utils;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Controller
public class MessageController {

	private final DefaultMessageService messageService;
	
    public MessageController() {
        // 반드시 계정 내 등록된 유효한 API 키, API Secret Key를 입력해주셔야 합니다!
        this.messageService = NurigoApp.INSTANCE.initialize("NCSMNFPOFDMIBIQP", "8EOTAXNR7W0ALKIXLJHDJGJMZB3TGCGZ", "https://api.coolsms.co.kr");
        
    }
    
    
    /**
     * 단일 메시지 발송 예제
     */
    @RequestMapping("/sendSms.do")
    public SingleMessageSentResponse sendOne(String phone) {
    	
    	int randomNum = Utils.randomNumber();
    	
        Message message = new Message();
        // 발신번호 및 수신번호는 반드시 01012345678 형태로 입력되어야 합니다.
        message.setFrom("01049402461");
        message.setTo(phone);
        message.setText("보물상점의 인증 번호는 "+ randomNum + " 입니다.");

        SingleMessageSentResponse response = this.messageService.sendOne(new SingleMessageSendingRequest(message));
        System.out.println(response);

        return response;
    }
    
}
