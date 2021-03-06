package com.spring.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class BabySession {
		/*
		 * 유저 아이디 정보를 관리할 세션이름을 정의 
		 * 
		 * */
		
		private static final String KID = "kid";
		
		/*
		 * Kill Session, 세션에 담긴 정보를 모두 지운다.
		 * 
		 * @param	hReq	servlet request
		 * @return 	servlet request가 null이면 false를 리턴하고, 
		 * 			아니면 세션에 담긴 정보를 모두 지우고 true를 리턴.
		 * @exception Exception.
		 * */
		
		public static boolean killSession(final HttpServletRequest hReq) throws Exception {
			
			if(hReq == null) return false;
			
			try{
				HttpSession hSession = hReq.getSession(true);
				hSession.invalidate();
			}catch(Exception e){
				
				throw e;
			}
			return true;
		}
		/*
		 * 유저 아이지 정보를 세션에서 가져온다.
		 * 
		 * @param hReq 	servlet request.
		 * @return servlet request 가 null 이면 빈 문자열("")을 리턴하고, 
		 * @exception Exception
		 * 
		 * */
		
		public static boolean setSession(final HttpServletRequest hReq, final String _userID) throws Exception{
			
			String userID = _userID;
			
			if(hReq == null) return false;
			if(userID == null || userID.trim().length() == 0) return false;
			
			HttpSession hSession = hReq.getSession(true);
			
			try{
				hSession.setAttribute(KID, userID);
			}catch(Exception e){
				throw e;
			}
			return true;
		}
		
		/*
		* 유저아이디 정보를 세션에서 가져온다.
		* 
		* @param     hReq       servlet request.
		* @return    servlet request가 null이면 빈 문자열("")을 리턴하고, 
		*            아니면 세션이 가지고 있는 유저아이디를 리턴.
		* @exception Exception.
		*/
		public static String getSession(final HttpServletRequest hReq) throws Exception {
			
			if(hReq == null) return "";
			String strSession;
			
			HttpSession hSession = hReq.getSession(false);
			
			try{
				strSession = (String)hSession.getAttribute(KID);
			}catch(Exception e){
				throw e;
			}
			return strSession;
		}
}
