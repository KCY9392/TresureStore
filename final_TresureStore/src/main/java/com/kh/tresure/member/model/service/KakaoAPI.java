package com.kh.tresure.member.model.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.tresure.member.controller.MemberController;
import com.kh.tresure.member.model.vo.KakaoUserInfo;
import com.kh.tresure.member.model.vo.Member;
 
@Service
public class KakaoAPI {
    
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	/**
	 * 받은 code로 access_token 가져오기
	 * @param authorize_code
	 * @return
	 */
    public String getAccessToken (String authorize_code) {
        String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";
        
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            
            //    POST 요청을 위해 기본값이 false인 setDoOutput을 true로
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            
            //    POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=2f3c85098b01f4c1919eb4761e43a541");
            sb.append("&redirect_uri=http://localhost:8888/tresure/loginJoin/kakao");
            sb.append("&code=" + authorize_code);
            bw.write(sb.toString());
            bw.flush();
            
            //결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            logger.info("getAToken-responseCode : " + responseCode);
 
            //요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";
            
            while ((line = br.readLine()) != null) {
                result += line;
            }
            logger.info("getAToken-response body : " + result);
            
            //Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);
            
            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
            
            logger.info("access_token : " + access_Token);
            logger.info("refresh_token : " + refresh_Token);
            
            br.close();
            bw.close();
        } catch (IOException e) {
            e.printStackTrace();
        } 
        
        return access_Token;
    }
    
    
    /**
     * access_token으로 user정보 가져오기 (닉네임, 이메일계정)
     * @param access_Token
     * @return
     */
    public Member getUserInfo (String access_Token) {
        
    	Member member = new Member();
        String reqURL = "https://kapi.kakao.com/v2/user/me";
        
        try {
        	
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            
            //요청에 필요한 Header에 포함될 내용
            conn.setRequestProperty("Authorization", "Bearer " + access_Token);
            
            int responseCode = conn.getResponseCode();
            logger.info("responseCode : " + responseCode);
            
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            
            String line = "";
            String result = "";
            
            while ((line = br.readLine()) != null) {
                result += line;
            }
            logger.info("response body : " + result);
            
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);
            
            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
            
            String nickname = properties.getAsJsonObject().get("nickname").getAsString();
            String email = kakao_account.getAsJsonObject().get("email").getAsString();
            String birth = kakao_account.getAsJsonObject().get("birthday").getAsString();
            
            if(email != null) {
	            member = Member.builder()
								.userName(nickname)
								.email(email)
								.birth(birth).build();
	            return member;
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        return member;
    }

    
    
    /**
     * 카카오 로그아웃(이 서비스에서만 로그아웃 -> 웹브라우저에 카카오계정 세션은 만료되지않고, 로그아웃호출한 앱의 토큰만 만료
     * @param accessToken
     */
    public void kakaoLogout(String accessToken) {
    	
        String reqURL = "https://kapi.kakao.com/v1/user/logout";
        
        try {
        	
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Authorization", "Bearer " + accessToken);
            
            int responseCode = conn.getResponseCode();
            logger.info("responseCode = " + responseCode);

            if(responseCode == 400)
                throw new RuntimeException("카카오 로그아웃 도중 오류 발생");
            
            
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            
            String br_line = "";
            String result = "";
            
            while ((br_line = br.readLine()) != null) {
                result += br_line;
            	}
            logger.info("결과 : " + result);
        }catch(IOException e) {
        	e.printStackTrace();
        }
    }


    /**
     * 카카오계정 토큰을 호출하여 로그아웃 -> 회원탈퇴시 연결끊기를 할까 ?
     * @param access_Token
     */
    public void unlink(String access_Token) {
    	
	    String reqURL = "https://kapi.kakao.com/v1/user/unlink";
	    
	    try {
	    	
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        conn.setRequestProperty("Authorization", "Bearer " + access_Token);
	        
	        int responseCode = conn.getResponseCode();
	        logger.info("responseCode : " + responseCode);
	        
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        
	        String result = "";
	        String line = "";
	        
	        while ((line = br.readLine()) != null) {
	            result += line;
	        	}
	        System.out.println(result);
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	}


}
 