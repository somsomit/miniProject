package com.spring.board.service;

import java.util.List;

//import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.spring.board.dao.BoardDao;
import com.spring.board.vo.BoardVO;

@Service
@Transactional
public class BoardServiceImpl implements BoardService {
	
//	Logger logger = Logger.getLogger(BoardServiceImpl.class);
	
	@Autowired
	private BoardDao boardDao;

	@Override
	public List<BoardVO> boardList(BoardVO bvo) {
		// TODO Auto-generated method stub
		System.out.println("[log] BoardServiceImpl.boardList 시작");
		List<BoardVO> bList = null;
		bList = boardDao.boardList(bvo);
		System.out.println("[log] BoardServiceImpl.boardList 끝");
		return bList;
	}

	@Override
	public BoardVO boardDetail(BoardVO bvo) {
		// TODO Auto-generated method stub
		System.out.println("[log] BoardServiceImpl.boardDetail 시작");
		BoardVO boardDetail = null;
		boardDetail = boardDao.boardDetail(bvo);
		System.out.println("[log] BoardServiceImpl.boardDetail 끝");
		return boardDetail;
	}

	@Override
	public int boardInsert(BoardVO bvo) {
		// TODO Auto-generated method stub
		System.out.println("[log] BoardServiceImpl.boardInsert 시작");
		int result = 0;
		result = boardDao.boardInsert(bvo);
		System.out.println("[log] BoardServiceImpl.boardInsert 끝");
		return result;
	}

//	@Override
//	public int boardUpdate(BoardVO bvo) {
//		// TODO Auto-generated method stub
//		return 0;
//	}
//
//	@Override
//	public int boardDelete(BoardVO bvo) {
//		// TODO Auto-generated method stub
//		return 0;
//	}

	@Override
	public BoardVO sequenceB(BoardVO _bvo) {
		// TODO Auto-generated method stub
		System.out.println("[log] BoardServiceImpl.sequenceB 시작");
		BoardVO bvo = null;
		bvo = boardDao.sequenceB(bvo);
		System.out.println("[log] BoardServiceImpl.sequenceB 끝");
		return bvo;
	}

}
