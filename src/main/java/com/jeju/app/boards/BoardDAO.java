package com.jeju.app.boards;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeju.app.boards.hearts.HeartDTO;
import com.jeju.app.pages.Pager;

@Repository
public class BoardDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.jeju.app.boards.BoardDAO.";

	
	public List<BoardDTO> getPlaceList(Pager pager) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getPlaceList", pager);
	}
	
	public List<BoardDTO> getDinerList(Pager pager) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getDinerList", pager);
	}
	
	public List<BoardDTO> getHotelList(Pager pager) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getHotelList", pager);
	}
	
	public List<BoardDTO2> getPlaceCardList(Map<String, Object> map) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getPlaceCardList", map);
	}
	
	public List<BoardDTO2> getDinerCardList(Map<String, Object> map) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getDinerCardList", map);
	}
	
	public List<BoardDTO2> getHotelCardList(Map<String, Object> map) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getHotelCardList", map);
	}
	
	public BoardDTO getDetail(BoardDTO boardDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getDetail", boardDTO);
	}
	
	public int add(BoardDTO boardDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"add", boardDTO);
	}
	
	public Long getTotalcount1(Pager pager) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getTotalCount1", pager);
	}
	public Long getTotalcount2(Pager pager) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getTotalCount2", pager);
	}
	public Long getTotalcount3(Pager pager) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getTotalCount3", pager);
	}
	
	public int addFiles(BoardFileDTO boardFileDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"addFile", boardFileDTO);
	}
	
	public int updateHits(BoardDTO boardDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"updateHits", boardDTO);
	}
	
	public int update(BoardDTO boardDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"update", boardDTO);
	}
	
	public int delete(BoardDTO boardDTO) throws Exception{
		return sqlSession.delete(NAMESPACE+"delete", boardDTO);
	}
	
	public BoardFileDTO getFileDetail(BoardFileDTO boardFileDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getFileDetail", boardFileDTO);
	}
	
	public int fileDelete(BoardFileDTO boardFileDTO) throws Exception{
		return sqlSession.delete(NAMESPACE+"fileDelete", boardFileDTO);
	}
	
	public int fileDeleteAll(BoardDTO boardDTO) throws Exception{
		return sqlSession.delete(NAMESPACE+"fileDeleteAll", boardDTO);
	}
	
	//좋아요 기능
	//1. 좋아요를 눌렀는지, 몇 개 눌렀는지 확인
	public HeartDTO findHeart(HeartDTO heartDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"findHeart", heartDTO);
	}
	
	//2. 게시글의 좋아요 개수 증가
	public int plusHeart(HeartDTO heartDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"plusHeart", heartDTO);
	}
	
	//3. 게시글의 좋아요 개수 감소
	public int minusHeart(HeartDTO heartDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"minusHeart", heartDTO);
	}
	
	//4. 게시물에 좋아요 누른 적이 없다면 좋아요 테이블에 row 추가
	public int insertHeart(HeartDTO heartDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"insertHeart", heartDTO);
	}
	
	//5. 회원의 좋아요 테이블의 게시물 별 좋아요 개수 감소
	public int deleteHeart(HeartDTO heartDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"deleteHeart", heartDTO);
	}
	
}
