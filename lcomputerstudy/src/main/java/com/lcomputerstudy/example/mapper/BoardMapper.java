package com.lcomputerstudy.example.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.lcomputerstudy.example.domain.Board;

@Mapper
public interface BoardMapper {
	// 게시글목록을 데이터베이스에서 조회
	public List<Board> selectBoardList();
	
	// MyBatis로 게시글 작성 쿼리를 매핑
	public void insertBoard(Board board);
}
