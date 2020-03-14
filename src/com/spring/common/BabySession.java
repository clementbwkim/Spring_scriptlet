package com.spring.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class BabySession {
		/*
		 * ���� ���̵� ������ ������ �����̸��� ���� 
		 * 
		 * */
		
		private static final String KID = "kid";
		
		/*
		 * Kill Session, ���ǿ� ��� ������ ��� �����.
		 * 
		 * @param	hReq	servlet request
		 * @return 	servlet request�� null�̸� false�� �����ϰ�, 
		 * 			�ƴϸ� ���ǿ� ��� ������ ��� ����� true�� ����.
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
		 * ���� ������ ������ ���ǿ��� �����´�.
		 * 
		 * @param hReq 	servlet request.
		 * @return servlet request �� null �̸� �� ���ڿ�("")�� �����ϰ�, 
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
		* �������̵� ������ ���ǿ��� �����´�.
		* 
		* @param     hReq       servlet request.
		* @return    servlet request�� null�̸� �� ���ڿ�("")�� �����ϰ�, 
		*            �ƴϸ� ������ ������ �ִ� �������̵� ����.
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
