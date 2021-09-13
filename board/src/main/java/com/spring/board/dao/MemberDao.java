package com.spring.board.dao;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.board.form.MemberForm;

@Repository
public class MemberDao {
	@Resource(name="sqlSession")
	SqlSession sqlsession;
	
	String namespace = "com.spring.board.memberMapper";
	
	public MemberForm login(MemberForm memberform) {
		MemberForm memberform2 = sqlsession.selectOne(namespace+".login",memberform);
		
		return memberform2;
	}
	public void join(MemberForm memberform) {
		sqlsession.insert(namespace+".join",memberform);
	}
	
}
