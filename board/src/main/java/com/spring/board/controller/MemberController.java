package com.spring.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.board.service.MemberService;
import com.spring.board.form.MemberForm;

@Controller
@RequestMapping(value="/board")
public class MemberController {
	@Autowired
	MemberService memberservice;
	
	@RequestMapping(value = "/main")
	public String Main(HttpServletRequest req, HttpServletResponse resp) throws Exception{
		return "member/main";
	}
	@RequestMapping(value="/join")
	public String join(MemberForm memberform) throws Exception{
		memberservice.join(memberform);
		return "member/main";
	}
	@RequestMapping(value="/login")
	public String login(MemberForm memberform, HttpServletRequest req, Model model)throws Exception{
		boolean result = memberservice.login(memberform, req);
		if(result == true) {
			return "board/boardList";
		}else {
			model.addAttribute("false", false);
			return "member/alert";
		}
	}
}
