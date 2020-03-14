package com.spring.member.controller;

import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.spring.board.service.BoardService;
import com.spring.member.service.MemberService;
import com.spring.member.vo.MemberVO;
import com.spring.common.BabySession;
import com.spring.common.utils.FilePath;


@Controller
@RequestMapping(value="/member")
public class MemberController {
	private static final String CONTEXT_PATH = "member";

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/listMember")
	public ModelAndView listMember(){
		System.out.println("(log)MemberController listMember >>> ");
		List<MemberVO> list = memberService.listMember();
		
		System.out.println("listSize >>> " + list.size());
		System.out.println("list >>> " + list);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("MemberList", list);
		mav.setViewName(CONTEXT_PATH + "/searchMember");
		
		return mav;
		
	}
	
//	@RequestMapping("/selectMember")
//	public ModelAndView selectMember(@RequestParam("no") String no){
//		System.out.println("(log)MemberController selectMember >>> ");
//		ModelAndView mav = new ModelAndView();
//		if(no.equals("")){
//			mav.addObject("mode", "insert");
//		}else{
//			mav.addObject("memberVO", memberService.selectMember(no));
//			mav.addObject("mode", "update");
//		}
//		System.out.println("mav >>> : " + mav);
//		mav.setViewName(CONTEXT_PATH + "/member_pop");
//		return mav;
//	}
	
	@RequestMapping("/insertMember")
	public ModelAndView insertMember(@ModelAttribute MemberVO param, HttpServletRequest request) {
		System.out.println("(log)MemberController insertMember >>> ");
		System.out.println("param >> " + param.toString());
		System.out.println("getContentType >> " + (request.getContentType().toLowerCase().startsWith("multipart/form-data")));
		
		
		String mode = "";
		ModelAndView mav = new ModelAndView();
		
		if(!request.getContentType().toLowerCase().startsWith("multipart/form-data")){
		
			mode = "insert";
			mav.addObject("mode", mode);
			mav.setViewName(CONTEXT_PATH + "/member");
			System.out.println(">>>>><<<<<<");
			return mav;
	
		}else{
			String uploadPath = FilePath.UPLOAD_FILEPATH;
			int size = 100*1024*1024;
			
			try{
				
				MultipartRequest multi = new MultipartRequest(request, uploadPath,size,"EUC-KR", new  DefaultFileRenamePolicy());
				
				String kmem = multi.getParameter("kmem");
				String kkname = multi.getParameter("kkname");
				String kename = multi.getParameter("kename");
				String kid = multi.getParameter("kid");
				String kpw = multi.getParameter("kpw");
				String kgender = multi.getParameter("kgender");
				String khp = multi.getParameter("khp");
				String kbirth = multi.getParameter("kbirth");
				String kemail = multi.getParameter("kemail");
				String kpostno = multi.getParameter("kpostno");
				String kaddr = multi.getParameter("kaddr") + " " + multi.getParameter("kaddrdetail");
				String kdeleteyn = multi.getParameter("kdeleteyn");
				String kinsertdate = multi.getParameter("kinsertdate");
				String kupdatedate = multi.getParameter("kupdatedate");
				String kimg = multi.getParameter("kimg");

				System.out.println(">>>>>>>>>>>>>>>>>.");
				Enumeration kfiles = multi.getFileNames();
				kimg = (String)kfiles.nextElement();
				String kfilename = multi.getFilesystemName(kimg);

				param.setKmem(kmem);
				param.setKimg(kfilename);
				param.setKkname(kkname);
				param.setKename(kename);
				param.setKid(kid);
				param.setKpw(kpw);
				param.setKgender(kgender);
				param.setKhp(khp);
				param.setKbirth(kbirth);
				param.setKemail(kemail);
				param.setKpostno(kpostno);
				param.setKaddr(kaddr);
				param.setKdeleteyn(kdeleteyn);
				param.setKinsertdate(kinsertdate);
				param.setKupdatedate(kupdatedate);
				System.out.println("param >> " + param.toString());
				
			}catch(Exception e){
				System.out.println("error >>> : " + e.getMessage());
				
			}
		
			MemberVO cb = memberService.chaebunMember();
			String x = cb.getKmem();

			if(1 == x.length()){
				x = "000" + x;
			}
			if(2 == x.length()){
				x = "00" + x;
			}
			if(3 == x.length()){
				x = "0" + x;
			}
			System.out.println("commNo >>> : " + x);
			
			x = "K" + x;
			System.out.println("commNo >>> : " + x);
			
			param.setKmem(x);
			
			System.out.println("VO >> " + param.toString());
			
			int result = memberService.insertMember(param);
			System.out.println("insertMember result >>> : " +result);
			
			if(result > 0){
				
				List<MemberVO> list = memberService.listMember();
				
				System.out.println("listSize >>> " + list.size());
				System.out.println("list >>> " + list);
				
				mav.addObject("MemberList", list);
				mav.setViewName(CONTEXT_PATH + "/searchMember");
				
			} else {
			
				mav.setViewName(CONTEXT_PATH + "/member");
			}
		}
		return mav;
	}
	
	@RequestMapping("/updateMember")
	public ModelAndView updateMember(@ModelAttribute MemberVO param, HttpServletRequest request, @RequestParam(value = "kmem", required=false) String kmem){
		System.out.println("(log)MemberController updateMember >>> ");
		
		String mode = "";
		
		ModelAndView mav = new ModelAndView();
		
		if(!request.getContentType().toLowerCase().startsWith("multipart/form-data")){
			System.out.println("kmem >>>> " + kmem);
			MemberVO list = memberService.selectMember(kmem);
			
			System.out.println("list >>>> " + list.toString());
			mav.addObject("MemberList", list);
			
			mode = "update";
			
			mav.addObject("mode", mode);
			
			mav.setViewName(CONTEXT_PATH + "/member");
			
		}else if(request.getContentType().toLowerCase().startsWith("multipart/form-data")){
		
			String uploadPath = FilePath.UPLOAD_FILEPATH;
			int size = 100*1024*1024;
			
			try{
				
				MultipartRequest multi = new MultipartRequest(request, uploadPath,size,"EUC-KR", new  DefaultFileRenamePolicy());
				
				kmem = multi.getParameter("kmem");
				String kkname = multi.getParameter("kkname");
				String kename = multi.getParameter("kename");
				String kid = multi.getParameter("kid");
				String kpw = multi.getParameter("kpw");
				String kgender = multi.getParameter("kgender");
				String khp = multi.getParameter("khp");
				String kbirth = multi.getParameter("kbirth");
				String kemail = multi.getParameter("kemail");
				String kpostno = multi.getParameter("kpostno");
				String kaddr = multi.getParameter("kaddr") + " " + multi.getParameter("kaddrdetail");
				String kdeleteyn = multi.getParameter("kdeleteyn");
				String kinsertdate = multi.getParameter("kinsertdate");
				String kupdatedate = multi.getParameter("kupdatedate");
				String kimg = multi.getParameter("kimg");

				Enumeration kfiles = multi.getFileNames();
				kimg = (String)kfiles.nextElement();
				String kfilename = multi.getFilesystemName(kimg);

				param.setKmem(kmem);
				param.setKimg(kfilename);
				param.setKkname(kkname);
				param.setKename(kename);
				param.setKid(kid);
				param.setKpw(kpw);
				param.setKgender(kgender);
				param.setKhp(khp);
				param.setKbirth(kbirth);
				param.setKemail(kemail);
				param.setKpostno(kpostno);
				param.setKaddr(kaddr);
				param.setKdeleteyn(kdeleteyn);
				param.setKinsertdate(kinsertdate);
				param.setKupdatedate(kupdatedate);
				System.out.println("param >> " + param.toString());
				
			}catch(Exception e){
				System.out.println("error >>> : " + e.getMessage());
				
			}
			
			int result = memberService.updateMember(param);
			System.out.println("result >>> " + result);
			
			
			List<MemberVO> list = memberService.listMember();
			
			System.out.println("listSize >>> " + list.size());
			System.out.println("list >>> " + list);
	
			mav.addObject("MemberList", list);
			
			mav.setViewName(CONTEXT_PATH + "/searchMember");
			
		}// end of else if(request.getContentType().toLowerCase().startsWith("multipart/form-data"))
		
		return mav;
	}
	
	@RequestMapping("/deleteMember")
	public ModelAndView deleteMember(@ModelAttribute MemberVO param){
		System.out.println("(log)MemberController deleteMember >>> ");
		System.out.println("(log)MemberController deleteMember >>> param " + param.toString() );
		System.out.println("(log)MemberController deleteMember >>> param " + param.getKmem());
		int result = memberService.deleteMember(param);
		System.out.println("result >>> " + result);
		
		ModelAndView mav = new ModelAndView();
		
		List<MemberVO> list = memberService.listMember();
		
		System.out.println("listSize >>> " + list.size());
		System.out.println("list >>> " + list);
		
		mav.addObject("MemberList", list);
		mav.setViewName(CONTEXT_PATH + "/searchMember");
		return mav;
	}
	
	@RequestMapping("/chaebunMember")
	public ModelAndView chaebunMember(@RequestParam("kmem") int kmem){
		System.out.println("(log)MemberController chaebunMember >>>>> ");
		ModelAndView mav = new ModelAndView();
		if(kmem==0){
			mav.addObject("mode", "chaebun");
		}else{
			mav.addObject("memberVO", memberService.chaebunMember());
			mav.addObject("mode", "chaebun");
		}
		mav.setViewName(CONTEXT_PATH + "/member_pop");
		return mav;
	}
	
	@RequestMapping("/loginMember")
	public ModelAndView loginMember(@ModelAttribute MemberVO param, HttpServletRequest hReq){
		System.out.println("(log)MemberController loginMember >>> ");
		
		List<MemberVO> list = memberService.loginMember(param);
		System.out.println("listSize >>> " + list.size());
		System.out.println("list >>> " + list);
		
		ModelAndView mav = new ModelAndView();
		
		if(list.size() > 0){
			//세션부여시 try, catch로 부여한다 
			try {
				String userID = param.getKid();
				BabySession.setSession(hReq, userID);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			mav.addObject("boardList", boardService.listBoard());
			mav.setViewName("board/listBoard");
			
		}else if(list.size() == 0){
			String mode = "";
			
			mav.addObject("mode", mode);
			mav.setViewName(CONTEXT_PATH + "/member");
		}
		return mav;
		
	}
	
	@ResponseBody
	@RequestMapping("/idCheckMember")
	//스프링에서 ajax를 사용하려면 @ResponseBody && String 타임으로 받아야한다. **
	public String idCheckMember(@ModelAttribute MemberVO param ){
		System.out.println("(log)MemberController idCheckMember >>> ");
		List<MemberVO> list = memberService.idCheckMember(param);
		System.out.println("mvo >>>> : " + list.toString());
		
		if(list.size() > 0){
			return "1";
		}else{
			return "0";
		}
				
	}
	
	@RequestMapping("/logOutMember")
	public String logOutMember(HttpServletRequest hReq){
		System.out.println("(log)MemberController logOutMember >>> ");
		
			try {
				BabySession.killSession(hReq);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
	
		return "../index";
	}
	
}

