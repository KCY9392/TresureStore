package com.kh.tresure.common.manager;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.*;

@Controller
public class managerController {

	private ipValid ipvalid;
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	public managerController(ipValid ipvalid, BCryptPasswordEncoder bcryptPasswordEncoder) {
		this.ipvalid = ipvalid;
		this.bcryptPasswordEncoder = bcryptPasswordEncoder;
	}
	
	@RequestMapping("/gogo")
	public String gogo(HttpServletRequest request) {
		
		HttpServletRequest req = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();

		String secretIp = getIp(req);
		
		boolean result = ipvalid.IpValidCheck(secretIp);
		
		if(result == true ) {
			
			return "manager/admin";
		} else {
			return "redirect://";
		}
	}
	
	
	public String getIp(HttpServletRequest request){
	     String ip = request.getHeader("X-Forwarded-For");

	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = request.getHeader("Proxy-Client-IP");
	    }
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = request.getHeader("WL-Proxy-Client-IP");
	    }
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = request.getHeader("HTTP_CLIENT_IP");
	    }
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = request.getHeader("HTTP_X_FORWARDED_FOR");
	    }
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = request.getRemoteAddr();
	    }
	    
	    String newIp = bcryptPasswordEncoder.encode(ip);
	   
	    return newIp;
	}
}
