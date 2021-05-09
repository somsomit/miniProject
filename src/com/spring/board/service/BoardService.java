package com.spring.board.service;

import java.util.List;
import com.spring.board.vo.BoardVO;

public interface BoardService {
	
	public List<BoardVO> boardList(BoardVO bvo); // 리스트 조회
	public BoardVO boardDetail(BoardVO bvo); // 상세 조회
	public int boardInsert(BoardVO bvo); // 등록
//	public int boardUpdate(BoardVO bvo); // 수정
//	public int boardDelete(BoardVO bvo); // 삭제
//	
	public BoardVO sequenceB(BoardVO _bvo); // 채번

}
