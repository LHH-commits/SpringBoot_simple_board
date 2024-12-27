<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authentication property="principal" var="principal"/>

<div id="commentList">
	<c:forEach var="comment" items="${comments}">
	    <div style="margin-left: ${comment.depth * 50}px;" class="commentBox card mb-3">
	    	<div class="card-body">
	    		<div class="d-flex justify-content-between align-items-center mb-2">
	    			<h6 class="card-subtitle text-muted mb-0">작성자: ${comment.cWriter}</h6>
	    			<small class="text-muted">${comment.cDatetime}</small>
	    		</div>
	    		<p class="card-text border-bottom pb-3">${comment.cContent}</p>
	    		
	    		<input type="hidden" name="group" value="${comment.group}">
	    		<input type="hidden" name="order" value="${comment.order}">
	    		<input type="hidden" name="depth" value="${comment.depth}">
	    		
	    		<div class="btn-group">
	    			<!-- 본인 댓글만 수정버튼표시 -->
	    			<sec:authorize access="isAuthenticated()">
	    				<c:if test="${principal.username == comment.username}">
	    					<button class="btn btn-sm btn-outline-primary commentEditForm" 
	    							cId="${comment.cId}" cContent="${comment.cContent}">수정</button>
	    				</c:if>
	    			</sec:authorize>
	    			
	    			<!-- 삭제 버튼 권한 -->
	    			<sec:authorize access="hasRole('ROLE_ADMIN') or (hasRole('ROLE_USER') and principal.username == #comment.username)">
	    				<button class="btn btn-sm btn-outline-danger deleteComment" 
	    						data-comment-id="${comment.cId}">삭제</button>
	    			</sec:authorize>
	    			
	    			<button class="btn btn-sm btn-outline-secondary replyForm">답글</button>
	    		</div>
	    		
	    		<!-- 수정 폼 -->
	    		<div class="editForm mt-3" style="display:none;">
	    			<textarea class="form-control mb-2" cols="80" rows="3"></textarea>
	    			<div>
	    				<button type="button" class="btn btn-sm btn-secondary cancelEdit">취소</button>
	    				<button type="button" class="btn btn-sm btn-primary updateEdit" 
	    						cId="${comment.cId}">등록</button>
	    			</div>
	    		</div>
	    		
	    		<!-- 답글 폼 - 이 부분을 card-body 바로 아래로 이동 -->
	    		<div class="replyFormContainer mt-3" style="display:none;">
	    			<textarea class="form-control mb-2" cols="80" rows="2"></textarea>
	    			<div>
	    				<button type="button" class="btn btn-sm btn-secondary cancelReply">취소</button>
	    				<button type="button" class="btn btn-sm btn-primary addReply" 
	    						cId="${comment.cId}" 
	    						group="${comment.group}" 
	    						order="${comment.order}" 
	    						depth="${comment.depth}">등록</button>
	    			</div>
	    		</div>
	    	</div>
	    </div>
	</c:forEach>
</div>