<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 조회</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script>
	function confirmDelete(bId) {
		var check = confirm("해당 게시물을 정말 삭제합니까?");
		
		if(check) {
			const form = document.createElement("form");
			form.method = "POST";
			form.action = "/deleteBoard";
			
			const input = document.createElement("input");
			input.type = "Integer";
			input.name = "bId";
			input.value = bId;
			
			form.appendChild(input);
			
			document.body.appendChild(form);
			form.submit();
			
			alert("삭제하였습니다");
		} else {
			return false;
		}
	}
	
</script>
<style>
	.table-rounded {
		border-radius:0.5rem;
		overflow: hidden;	
	}
	.table-fixed {
		table-layout: fixed;
		width: 100%;
	}
	.table-fixed th {
		overflow: hidden;
		text-overflow: ellipsis;
	}
</style>
</head>
<body>
<div class="container-md mt-4" style="max-width:900px">
	<div class="d-flex justify-content-between align-items-center mb-4">
		<h3>게시물 상세</h3>
	</div>
	<div class="table-responsive">
	    <table class="table table-bordered table-rounded">
	    <thead class="table-light">
            <tr>
                <th style="width: 20%">제목</th>   
                <th style="width: 8%">작성자</th>
                <th style="width: 10%">작성일시</th>
                <th style="width: 5%">조회수</th>
            </tr>
        </thead>
	    <tbody>
            <tr>
                <td class="align-middle">${board.bTitle}</td>
                <td class="align-middle">${board.bWriter}</td>
                <td class="align-middle">${board.bDateTime}</td>
                <td class="text-center align-middle">${board.bViews}</td>
            </tr>
        </tbody>
	    </table>
	</div>
	<div class="mt-4">
	    <div class="card">
	        <div class="card-header">
	            <h6 class="fw-bold mb-0">내용</h6>
	        </div>
	        <div class="card-body" style="min-height: 200px; max-height: 500px; overflow-y: auto;">
	            <p class="card-text">${board.bContent}</p>
	        </div>
	    </div>
	</div>
    <sec:authentication property="principal" var="principal"/>
    <!-- 버튼 그룹 -->
    <div class="d-flex justify-content-between mt-4">
        <div class="d-flex gap-2">
            <sec:authorize access="isAuthenticated()">
                <c:if test="${board.user.username == principal.username}">
                    <button type="button" class="btn btn-outline-primary" 
                        onclick="location.href='/editBoard?bId=${board.bId}&page=${page}'">수정</button>
                </c:if>
            </sec:authorize>
            <sec:authorize access="hasRole('ROLE_ADMIN')">
                <button type="button" class="btn btn-outline-danger" 
                    onclick="confirmDelete(${board.bId})">삭제</button>
            </sec:authorize>
            <sec:authorize access="!hasRole('ROLE_ADMIN')">
                <c:if test="${board.user.username == principal.username}">
                    <button type="button" class="btn btn-outline-danger" 
                        onclick="confirmDelete(${board.bId})">삭제</button>
                </c:if>
            </sec:authorize>
        </div>
        <div>
            <c:choose>
                <c:when test="${empty searchparam.searchOption && empty searchparam.searchKeyword}">
                    <a href="/list?page=${page}" class="btn btn-secondary">목록으로 돌아가기</a>
                </c:when>
                <c:otherwise>
                    <a href="/list?page=${page}&searchOption=${searchparam.searchOption}&searchKeyword=${searchparam.searchKeyword}" 
                       class="btn btn-secondary">목록으로 돌아가기</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    
    <!-- 댓글 작성 폼 -->
    <div class="card mt-4 mb-4">
        <div class="card-header">
            <h5 class="mb-0">댓글 작성</h5>
        </div>
        <div class="card-body">
            <div class="mb-3">
                <label for="cContent" class="form-label">내용</label>
                <textarea class="form-control" id="cContent" name="cContent" rows="3"></textarea>
            </div>
            <button type="button" id="regComment" class="btn btn-primary">댓글 작성</button>
        </div>
    </div>
    
    <!-- 댓글 목록 -->
    <div class="card">
        <div class="card-header">
            <h5 class="mb-0">댓글</h5>
        </div>
        <div class="card-body">
            <div id="commentSection"></div>
        </div>
    </div>
</div>
	<script>
	function loadComments() {
		$.ajax({
			url: '/commentList',
			type: 'GET',
			data: {
				bId: '${board.bId}',
		    	page: '${page}',
		    	searchOption: '${searchparam.searchOption}',
		    	searchKeyword: '${searchparam.searchKeyword}',
		    	uId: '${principal.username }',
		    	cId: '${comment.cId}',
		    	cContent: '${comment.cContent}'
			},
			success: function(response) {
				$('#commentSection').html(response);
			}
		})
	}
	
	$(function() {
		
		loadComments();
		
		// 답글버튼을 눌렀을때 대댓글폼 보이기
		$(document).on('click','.replyForm', function(){
			$(this).closest('.card-body').find('.replyFormContainer').toggle();
		});
		
		// 취소 버튼 눌렀을때 폼 숨기기
		$(document).on('click', '.cancelReply', function(){
			$(this).closest('.replyFormContainer').hide();
		});
		
		// 등록버튼 클릭시
		$(document).on('click', '.addReply', function(){
			const cId = $(this).attr('cId');
			const group = $(this).attr('group');
			const order = $(this).attr('order');
			const depth = $(this).attr('depth');
			const $form = $(this).closest('.replyFormContainer');
			const replyContent = $form.find('textarea').val();
			
			$.ajax({
				type: "POST",
				url: "/addComment",
				data: {
					bId: '${board.bId}',
					page: '${page}',
					searchOption: '${searchparam.searchOption}',
					searchKeyword: '${searchparam.searchKeyword}',
					uId: '${principal.username }',
					cContent: replyContent,
					parentId: cId,
					group: group,
					order: order,
					depth: depth
				},
				success: function() {
					loadComments();
					$form.hide();
					$form.find('textarea').val('');
				}
			});
		});
		
		$(document).on('click', '#regComment', function() {
			const $form = $(this).closest('div');
			const commentContent = $form.find('textarea').val();
			
			$.ajax({
				type: "POST",
				url: "/addComment",
				data: {
					bId: '${board.bId}',
			    	page: '${page}',
			    	searchOption: '${searchparam.searchOption}',
			    	searchKeyword: '${searchparam.searchKeyword}',
			    	uId: '${principal.username }',
			    	cContent: commentContent,
			    	group: 0,
			    	order: 1,
			    	depth: 0
				},
				success: function() {
					loadComments();
				}
			});
		});
		
		$(document).on('click', '.commentEditForm', function(){
			const cId = $(this).attr('cId');
			const cContent = $(this).attr('cContent');
			
			const $commentEditForm = $(this).closest('.commentBox').find('.editForm');
			$commentEditForm.find('textarea').val(cContent);
			
			$commentEditForm.toggle();
		});
		
		// 수정취소버튼
		$(document).on('click', '.cancelEdit', function(){
			$(this).closest('.editForm').hide();
		});
		
		$(document).on('click', '.updateEdit', function(){
			const $form = $(this).closest('div');
			const updateContent = $form.find('textarea').val();
			const commentId = $(this).attr('cId');
			
			$.ajax({
				type: "POST",
				url: "/updateComment",
				data: {
					bId: '${board.bId}',
			    	page: '${page}',
			    	searchOption: '${searchparam.searchOption}',
			    	searchKeyword: '${searchparam.searchKeyword}',
			    	uId: '${principal.username}',
			    	cContent: updateContent,
			    	cId: commentId
				},
				success: function() {
					loadComments();
				}
			});
		});
		
		$(document).on('click', '.deleteComment', function(){
			const commentId = $(this).data('comment-id');
			
			$.ajax({
				type: "POST",
				url: "/deleteComment",
				data: {
					bId: '${board.bId}',
			    	cId: commentId
				},
				success: function() {
					loadComments();
				}
			});
		});
	});
	</script>
	
</body>
</html>