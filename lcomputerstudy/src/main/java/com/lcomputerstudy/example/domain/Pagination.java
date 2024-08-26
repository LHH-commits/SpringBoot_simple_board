package com.lcomputerstudy.example.domain;

public class Pagination {

	int count;		//전체 게시글 수
	int page;		//현재 사용자가 보고 있는 페이지 번호 (ex) 사용자가 2페이지를 보고 있다면 page=2
	int boardsPerPage;	//현재 페이지에 해당하는 게시글의 수만큼 가지고 온다 
	int startPage;	//화면 하단에 표시될 페이지 번호의 시작점 ex) 1, 6, 11...
	int endPage;	//화면 하단에 표시될 페이지 번호의 마지막번호 ex) startPage=1일때 endPage=5 단, lastPage를 넘기지 않음
	int lastPage;	//전체 게시글 수 기준으로 계산된 마지막 번호
	int prevPage;	//이전 페이지 그룹의 마지막 페이지 ex)현재 endPage가 10이라면 prevPage는 5
	int nextPage;	//다음 페이지 그룹의 시작 페이지 ex)현재 startPage가 1이라면 nextPage는 6
	public static final int pageUnit=5;	//화면에 보여질 페이지번호의 최대 갯수
	public static final int perPage=5;	//한 페이지에서 보여줄 게시글의 수
	
	public Pagination() {
		
	}
	
	public void build() {
		boardsPerPage = (page-1) * perPage; // 현재페이지에서 보여줄 게시물 수를 계산 ex) 현재 2번째 페이지를 보고 있고 perPage가 5라면 pageNum은 5
		startPage = ((page-1)/pageUnit)*pageUnit+1; // 현재 페이지가 속한 페이지그룹의 시작 페이지를 계산 ex) 현재 2페이지를 보고 있다면 pageUnit=5일때 startPage=1
		lastPage = (int)Math.ceil(count / (float)perPage); // 전체 게시글 수에 따른 마지막 페이지 계산 ex) 현재 게시글 수가 52이고 perPage=5일때 lastPage=11
		endPage = startPage+pageUnit-1; // 현재 페이지 그룹에서의 마지막 페이지 ex) startPage=6, pageUnit=5일때 endPage=10
		endPage = endPage < lastPage ? endPage : lastPage; // 전체 글의 마지막 페이지를 endPage가 넘을 수 없게 조정 ex) 전체글을 세어서 마지막 페이지(lastPage)가 7이라면 endPage는 10이 아닌 7로 조정
		prevPage = (endPage-pageUnit); // 이전 페이지 그룹의 마지막 페이지를 계산 ex) 현재 endPage=10, pageUnit=5라면 prevPage=5
		nextPage = (startPage+pageUnit); // 다음 페이지 그룹의 시작 페이지를 계산 ex) 현재 startPage=6, pageUnit=5라면 nextPage=11
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getboardsPerPage() {
		return boardsPerPage;
	}

	public void setboardsPerPage(int boardsPerPage) {
		this.boardsPerPage = boardsPerPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}
	
	
}