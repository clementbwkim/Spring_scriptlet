package com.spring.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.board.service.BoardService;
import com.spring.board.vo.BoardVO;

@Controller
@RequestMapping(value="/board")
public class BoardController {
	private static final String CONTEXT_PATH = "board";

	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/listBoard")
	public ModelAndView listBoard(){
		System.out.println("(log)BoardController listBoard >>> ");
		List<BoardVO> list = boardService.listBoard();
		
		System.out.println("listSize >>> " + list.size());
		System.out.println("list >>> " + list);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("BoardList", list);
		mav.setViewName(CONTEXT_PATH + "/listBoard");
		
		return mav;
		
	}
	
//	@RequestMapping("/selectBoard")
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
	
	@RequestMapping("/insertBoard")
	public ModelAndView insertBoard(@ModelAttribute BoardVO param, @RequestParam("isudType") String isudType) {
		System.out.println("(log)BoardController insertBoard >>> ");
		System.out.println("param >> " + param.toString());
	
		String mode = "";
		ModelAndView mav = new ModelAndView();
		
		if(isudType.equals("I")){
			
			mode = "insert";
			mav.addObject("mode", mode);
			mav.setViewName(CONTEXT_PATH + "/insertBoard");
			
		}else{
			BoardVO cb = boardService.chaebunBoard();
			String x = cb.getKno();

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
			
			x = "B" + x;
			System.out.println("commNo >>> : " + x);
			
			param.setKno(x);
			
			System.out.println("VO >> " + param.toString());
			
			int result = boardService.insertBoard(param);
			System.out.println("insertBoard result >>> : " +result);
			
			System.out.println("param >> " + param.toString());
			
			
			if(result > 0){
				
				List<BoardVO> list = boardService.listBoard();
				
				System.out.println("listSize >>> " + list.size());
				System.out.println("list >>> " + list);
				
				mav.addObject("boardList", list);
				mav.setViewName(CONTEXT_PATH + "/listBoard");
				
			} else {
				mav.setViewName(CONTEXT_PATH + "/board");
			}
		}
		System.out.println("mav >>>>> : " + mav);
		return mav;
	}
	
	@RequestMapping("/updateBoard")
	public ModelAndView updateBoard(@ModelAttribute BoardVO param, @RequestParam("isudType") String isudType, @RequestParam("kno") String kno){
		System.out.println("(log)BoardController updateBoard >>> ");
		
		String mode = "";
		
		
		ModelAndView mav = new ModelAndView();

		
		
		if(isudType.equals("U")){
			System.out.println("isudType U >>>> " + isudType);
			System.out.println("kno >>>> " + kno);
			BoardVO list = boardService.selectBoard(kno);
			
			System.out.println("list >>>> " + list.toString());
			mav.addObject("boardList", list);
			
			mode = "update";
			
			mav.addObject("mode", mode);
			
			mav.setViewName(CONTEXT_PATH + "/insertBoard");
			
		}else if(isudType.equals("UOK")){
			System.out.println("isudType UOK >>>> " + isudType);
		
			int result = boardService.updateBoard(param);
			System.out.println("result >>> " + result);
			
			
			List<BoardVO> list = boardService.listBoard();
			
			System.out.println("listSize >>> " + list.size());
			System.out.println("list >>> " + list);
	
			mav.addObject("boardList", list);
			
			mav.setViewName(CONTEXT_PATH + "/listBoard");
			
		}
		
		return mav;
	}
	
	@RequestMapping("/deleteBoard")
	public ModelAndView deleteBoard(@ModelAttribute BoardVO param){
		System.out.println("(log)BoardController deleteBoard >>> ");
		System.out.println("(log)BoardController deleteBoard >>> param " + param.toString() );
		System.out.println("(log)BoardController deleteBoard >>> param " + param.getKno());
		int result = boardService.deleteBoard(param);
		System.out.println("result >>> " + result);
		
		ModelAndView mav = new ModelAndView();
		
		List<BoardVO> list = boardService.listBoard();
		
		System.out.println("listSize >>> " + list.size());
		System.out.println("list >>> " + list);
		
		mav.addObject("boardList", list);
		mav.setViewName(CONTEXT_PATH + "/listBoard");
		return mav;
	}
	
	@RequestMapping("/chaebunBoard")
	public ModelAndView chaebunBoard(@RequestParam("kno") int kno){
		System.out.println("(log)BoardController chaebunBoard >>>>> ");
		ModelAndView mav = new ModelAndView();
		if(kno==0){
			mav.addObject("mode", "chaebun");
		}else{
			mav.addObject("BoardVO", boardService.chaebunBoard());
			mav.addObject("mode", "chaebun");
		}
		mav.setViewName(CONTEXT_PATH + "/listBoard");
		return mav;
	}
}
