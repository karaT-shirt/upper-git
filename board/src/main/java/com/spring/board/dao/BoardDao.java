package com.spring.board.dao;
 
import java.util.List;
 
import javax.annotation.Resource;
 
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
 
import com.spring.board.dto.BoardDto;
import com.spring.board.form.BoardForm;
 
@Repository
public class BoardDao {
 
	@Resource(name = "sqlSession")
    private SqlSession sqlSession;
 
    private static final String NAMESPACE = "com.spring.board.boardMapper";
    
    public int getBoardCount(BoardForm boardForm) throws Exception {
    	 
        return sqlSession.selectOne(NAMESPACE + ".getBoardCount", boardForm);
    }

    public List<BoardDto> getBoardList(BoardForm boardForm) throws Exception {
        
        return sqlSession.selectList(NAMESPACE + ".getBoardList", boardForm);
    }
    
    public int updateBoardHits(BoardForm boardForm) throws Exception {
        
        return sqlSession.update(NAMESPACE + ".updateBoardHits", boardForm);
    }
    
    public int insertBoardFail(BoardForm boardForm) throws Exception {
        return sqlSession.insert(NAMESPACE + ".insertBoardFail", boardForm);
    }
   
    public BoardDto getBoardDetail(BoardForm boardForm) throws Exception {
        
        return sqlSession.selectOne(NAMESPACE + ".getBoardDetail", boardForm);
    }
      
    public int insertBoard(BoardForm boardForm) throws Exception {
        return sqlSession.insert(NAMESPACE + ".insertBoard", boardForm);
    }
    
    public int deleteBoard(BoardForm boardForm) throws Exception {
        
        return sqlSession.delete(NAMESPACE + ".deleteBoard", boardForm);
    }
    
    public int updateBoard(BoardForm boardForm) throws Exception {
        
        return sqlSession.update(NAMESPACE + ".updateBoard", boardForm);
    }
}
