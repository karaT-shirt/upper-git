package com.spring.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.board.dao.MemberDao;
import com.spring.board.form.MemberForm;

@Service
public class MemberService {
	@Autowired
	MemberDao memberdao;
	
	public void join(MemberForm memberform) throws Exception{
		memberdao.join(memberform);
	}
	public boolean login(MemberForm memberform, HttpServletRequest req) throws Exception{
		HttpSession session = req.getSession();
		
		MemberForm memberform2 = memberdao.login(memberform);
		if(memberform2 != null) {
			session.setAttribute("account", memberform2);
			return true;
		}
		else {
			return false;
		}
	}
}
