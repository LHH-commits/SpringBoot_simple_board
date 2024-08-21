package com.lcomputerstudy.example.service;

import java.util.List;
import com.lcomputerstudy.example.domain.Board;

public interface BoardService {
	// 요청시 필요한 변수에 따라서 쓰면 된다
	// ex) insertBoard는 Board작성시에 필요한 요소들을 채워야 하기 때문에 Board board를
	// 사용하는 것이 편하고
	// selectBoardBid나 deleteBoard 같은건 그냥 bId를 받아와서 해당하는 글을 보거나 삭제하기때문에
	// int bId를 사용하는 것이 편하다
	
	// 게시글 목록 불러오기
	public List<Board> selectBoardList();
	
	// 게시글 작성 기능
	public void insertBoard(Board board);
	
	// 게시글 상세보기
	public Board selectBoardBid(int bId);
	
	// 게시글 삭제
	public Board deleteBoard(int bId);
}
