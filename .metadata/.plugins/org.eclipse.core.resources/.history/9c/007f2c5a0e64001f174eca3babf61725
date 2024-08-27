package com.lcomputerstudy.example.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lcomputerstudy.example.domain.Board;
import com.lcomputerstudy.example.domain.Pagination;
import com.lcomputerstudy.example.mapper.BoardMapper;

@Service("BoardServiceImpl")
public class BoardServiceImpl implements BoardService {

	@Autowired BoardMapper boardmapper;
	@Override
	public List<Board> selectBoardList(Pagination pagination) {
		return boardmapper.selectBoardList(pagination);
	}
	
	@Override
	public int countBoard() {
		return boardmapper.countBoard();
	}
	
	@Override
	public void insertBoard(Board board) {
		boardmapper.insertBoard(board);
	}
	
	// 상세보기(조회)와 동시에 조회수 카운트가 진행되기때문에 둘을 같이 사용-> @Transactional 사용
	@Transactional
	@Override
	public Board selectBoardBid(int bId) {
		boardmapper.countViews(bId);
		return boardmapper.selectBoardBid(bId);
	}
	
	@Override
	public void deleteBoard(int bId) {
		boardmapper.deleteBoard(bId);
	}
	
	@Override
	public void updateBoard(Board board) {
		boardmapper.updateBoard(board);
	}
}
