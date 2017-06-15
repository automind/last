package com.kedu.persistence;

import java.util.List;

import com.kedu.domain.BoardVo;
import com.kedu.domain.Criteria;
import com.kedu.domain.SearchCriteria;



/*********************************************
 * <pre>
 * org.zerock.persistence
 * BoardDao.java
 * </pre>
 * @author 	: MeanBottle
 * @Date   	: 2017. 4. 19.
 * @Version : 1.0
 ********************************************/
public interface BoardDao {
	
	/*********************************************
	 * <pre>
	 * 1. 개요		: 게시글 등록
	 * 2. 처리내용	: 게시글 데이터 베이스에 Insert
	 * </pre>
	 * @Method Name : create
	 * @param  		: BoardVo vo
	 * @throws Exception
	 ********************************************/
	public void create(BoardVo vo)throws Exception;
	
	/*********************************************
	 * <pre>
	 * 1. 개요		: 게시글 조회(상세보기)
	 * 2. 처리내용	: 게시글 데이터베이스에서 select
	 * </pre>
	 * @Method Name : read
	 * @param 		: bno (글번호)
	 * @return		: BoardVo
	 * @throws Exception
	 ********************************************/
	public BoardVo read(Integer bno)throws Exception;
	
	/*********************************************
	 * <pre>
	 * 1. 개요		: 게시글 수정
	 * 2. 처리내용	: 게시글 데이터베이스 수정
	 * </pre>
	 * @Method Name : update
	 * @param 		: BoardVo vo
	 * @throws Exception
	 ********************************************/
	public void update(BoardVo vo)throws Exception;
	
	/*********************************************
	 * <pre>
	 * 1. 개요		: 게시글 삭제
	 * 2. 처리내용	: 게시글 데이터베이스 삭제
	 * </pre>
	 * @Method Name : delete
	 * @param 		: Integer bno(글 번호)
	 * @throws Exception
	 ********************************************/
	public void delete(Integer bno)throws Exception;
	
	/*********************************************
	 * <pre>
	 * 1. 개요		: 게시글 목록
	 * 2. 처리내용	: 데이터베이스 게시글 목록 처리
	 * </pre>
	 * @Method Name : listAll
	 * @return		: List<BoardVo>
	 * @throws Exception
	 ********************************************/
	public List<BoardVo> listAll()throws Exception;
	
	/*********************************************
	 * <pre>
	 * 1. 개요		: 게시글 페이지 
	 * 2. 처리내용	: 데이터베이스 게시글 페이지 처리
	 * </pre>
	 * @Method Name : listPage
	 * @param 		: int page
	 * @return 	    : List<BoardVo>
	 * @throws Exception
	 ********************************************/
	public List<BoardVo> listPage(int page)throws Exception;
	
	/*********************************************
	 * <pre>
	 * 1. 개요		: 리스트 크리테리아
	 * 2. 처리내용	: 페이지전문 클래스 처리 
	 * </pre>
	 * @Method Name : listCriteria
	 * @param 		: Criteria cri
	 * @return		: List<BoardVo>
	 * @throws Exception
	 ********************************************/
	public List<BoardVo> listCriteria(Criteria cri)throws Exception;
	
	/*********************************************
	 * <pre>
	 * 1. 개요		: 게시글 페이지
	 * 2. 처리내용	: 하단 페이지 처리
	 * </pre>
	 * @Method Name : countPaging
	 * @param 		: Criteria cri
	 * @return		: int
	 * @throws Exception
	 ********************************************/
	public int countPaging(Criteria cri)throws Exception;
	
	/*********************************************
	 * <pre>
	 * 1. 개요		: 리스트 검색
	 * 2. 처리내용	: 리스트 출력 처리
	 * </pre>
	 * @Method Name : listSearch
	 * @param 		: SearchCriteria cri
	 * @return		: List<BoardVo>
	 * @throws Exception
	 ********************************************/
	public List<BoardVo> listSearch(SearchCriteria cri)throws Exception;
	
	/*********************************************
	 * <pre>
	 * 1. 개요		: 검색 리스트 
	 * 2. 처리내용	: 검색 리스트 수  
	 * </pre>
	 * @Method Name : listSearchCount
	 * @param cri
	 * @return
	 * @throws Exception
	 ********************************************/
	public int listSearchCount(SearchCriteria cri)throws Exception;
	
	/*********************************************
	 * <pre>
	 * 1. 개요		: 댓글 게시글
	 * 2. 처리내용	: 댓글 수 변경
	 * </pre>
	 * @Method Name : updateReplyCunt
	 * @param 		: bno
	 * @param 		: int amount
	 * @throws Exception
	 ********************************************/
	public void updateReplyCnt(Integer bno, int amount)throws Exception;

	/*********************************************
	 * <pre>
	 * 1. 개요		: 조회수 
	 * 2. 처리내용	: 조회수 변경 처리
	 * </pre>
	 * @Method Name : updateViewCnt
	 * @param 		: Integer bno
	 * @throws Exception
	 ********************************************/
	public void updateViewCnt(Integer bno) throws Exception;
	
	/*********************************************
	 * <pre>
	 * 1. 개요		: 추가
	 * 2. 처리내용	: 파일 첨부 처리
	 * </pre>
	 * @Method Name : addAttach
	 * @param 		: String fullName
	 * @throws Exception
	 ********************************************/
	public void addAttach(String fullName) throws Exception;
	
	/*********************************************
	 * <pre>
	 * 1. 개요		: 검색
	 * 2. 처리내용	: 첨부 파일 가져오기
	 * </pre>
	 * @Method Name : getAttach
	 * @param  		: Integer bno
	 * @return		: List<String>
	 * @throws Exception
	 ********************************************/
	public List<String> getAttach(Integer bno) throws Exception;
	
	/*********************************************
	 * <pre>
	 * 1. 개요		: 삭제
	 * 2. 처리내용	: 첨부 파일 삭제
	 * </pre>
	 * @Method Name : deleteAttach
	 * @param 		: Integer bno
	 * @throws Exception
	 ********************************************/
	public void deleteAttach(Integer bno) throws Exception;
	
	/*********************************************
	 * <pre>
	 * 1. 개요		: 수정
	 * 2. 처리내용	: 첨부 파일 수정
	 * </pre>
	 * @Method Name : replaceAttach
	 * @param fullName
	 * @param bno
	 * @throws Exception
	 ********************************************/
	public void replaceAttach(String fullName, Integer bno) throws Exception;
}

