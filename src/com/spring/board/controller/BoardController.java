package com.spring.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.board.common.file.FileUploadUtil;
import com.spring.board.common.util.Sequence;
import com.spring.board.service.BoardService;
import com.spring.board.vo.BoardVO;

@Controller
@RequestMapping(value="/board")
public class BoardController {
	
	Logger logger = Logger.getLogger(BoardController.class);
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value="/boardList", method = RequestMethod.GET)
	public String boardList(@ModelAttribute BoardVO bvo, Model model){
		logger.info("[log] BoardController.boardList 시작");
		List<BoardVO> boardList = null;
		boardList = boardService.boardList(bvo);
		model.addAttribute("boardList", boardList);
		return "board/boardList";
	} // end of boardList

	@RequestMapping(value="/boardDetail", method=RequestMethod.GET)
	public String boardDetail(@ModelAttribute BoardVO bvo, Model model){
		logger.info("[log] BoardController.boardDetail 시작");
		logger.info("[log] b_num : " + bvo.getB_num());
		
		BoardVO boardDetail = new BoardVO();
		boardDetail = boardService.boardDetail(bvo);
		
		if(boardDetail != null && (!boardDetail.equals(""))){
			boardDetail.setB_content(boardDetail.getB_content().toString().replaceAll("\n", "<br>"));
			logger.info("[log] content : " + boardDetail.getB_content());
			logger.info("[log] file : " + boardDetail.getB_file());
		}
		
		model.addAttribute("boardDetail", boardDetail);
		logger.info("[log] BoardController.boardDetail 끝");
		return "board/boardDetail";
	} // end of boardDetail
	
	// 글 쓰기 페이지로 이동
	@RequestMapping(value="/writeForm", method=RequestMethod.GET)
	public String writeForm(){
		logger.info("[log] BoardController.writeForm 시작");
		
		logger.info("[log] BoardController.writeForm 끝");
		return "board/writeForm";		
	} // end of writeForm
	
	@RequestMapping(value="boardInsert", method=RequestMethod.POST)
	public String boardInsert(@ModelAttribute BoardVO bvo, 
							  HttpServletRequest request) throws Exception{
		logger.info("[log] BoardController.boardInsert 시작");
		
		BoardVO numbering = null;
		numbering = boardService.sequenceB(numbering);
		
		String number = numbering.getB_num();
		logger.info("채번 확인 : " + number);
		bvo.setB_num(Sequence.num_B(number));
		
		int result = 0;
		String url = "";
		
		String b_file = FileUploadUtil.fileUpload(bvo.getFile(), request);
		bvo.setB_file(b_file);
		
		result = boardService.boardInsert(bvo);
		
		if(result == 1){
			url = "/board/boardList.som";
		}
		
		logger.info("[log] BoardController.boardInsert 끝");
		
		return "redirect:" + url;
	} // end of boardInsert
}
