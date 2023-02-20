package com.kh.tresure.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

	@Component
	public class IpValid {
		
		@Autowired
		private BCryptPasswordEncoder bcryptPasswordEncoder;
		
		private final String manager = "127.0.0.1";
		
		
		protected boolean IpValidCheck(String secretIp) {
			boolean result = false;
			
			if(bcryptPasswordEncoder.matches(manager, secretIp)){
				result = true;
			}
			
			return result;
		}
	}



