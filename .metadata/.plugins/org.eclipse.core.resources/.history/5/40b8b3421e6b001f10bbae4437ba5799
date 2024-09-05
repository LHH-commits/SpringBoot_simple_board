package com.lcomputerstudy.example.mapper;

import com.lcomputerstudy.example.domain.Comment;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CommentMapper {
	
	// 댓글 작성
    public void addComment(Comment comment);
    
    // 댓글 목록
    public List<Comment> ListCommentsByBid(int bId);
    
    // 댓글 개별 삭제
    public void deleteComment(int cId);
    
    // 게시물 삭제시 해당 bId에 있는 댓글들 전부 삭제
    public void deleteCommentByBid(int bId);
    
    // 댓글 개별삭제를 위한 c_id기준으로 댓글정보 가져오기
    public Comment getCommentById(int cId);
    
    // 댓글 수정
    public void updateComment(Comment comment);
}