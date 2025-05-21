<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/board.css">
<script src="<%=request.getContextPath()%>/resources/js/board.js"></script>
<section class="row justify-content-between mt-4">
	<!-- 사이드 네비게이터 -->
	<aside class="card col-lg-2">
		<div class="card-header">
			<ul class="list-group list-group-flush">
				<li class="list-group-item">
					<a href="">전체글</a>
				</li>
				<li class="list-group-item">
					<a href="">일반글</a>
				</li>
				<li class="list-group-item">
					<a href="">질문글</a>
				</li>
			</ul>
		</div>
	</aside>
	<!-- 메인보드 -->
	<article class="col-lg-7">
		<!-- 게시글 상단 선택 요소 -->
		<div class="row flex-row justify-content-between">
			<div class="col-lg-5">
				<h2> 자유게시판 </h2>
			</div>
			<div class="col-lg-7 d-flex justify-content-end align-items-end">
				<div>
					<select id="order" name="order" class="form-select form-select-sm">
						<option value="ARTICLE_DATETIME" selected>게시일순</option>
						<option value="ARTICLE_LIKES">추천수순</option>
						<option value="ARTICLE_VIEWS">조회수순</option>
					</select>
				</div>
				<div>
					<select id="numPerPage" name="numPerPage" class="form-select form-select-sm">
						<option selected value="10">게시글수</option>
						<option value="10">10</option>
						<option value="30">30</option>
						<option value="50">50</option>
					</select>
				</div>
				<div>
					<form action="">
						<button type="submit" class="btn btn-primary" style="width:80px">글쓰기</button>
					</form>
				</div>
			</div>
		</div>
		<hr>
		<!-- 게시글 리스트 컨테이너 -->
		<div id="article-container">
			
		</div>
		<hr>
		<!-- 게시글 하단 선택요소 -->
		<div class="row flex-row justify-content-between mt-4">
			<div class="col-8 ml-4">
				<input type="text" placeholder="게시글 검색">
				<button type="button" class="btn btn-primary" onclick="searchArticle()" value="검색">
			</div>
			<div class="col-2">
				<select id="likes" name="likes" class="form-select form-select-sm w-auto mr-4">
					<option selected>추천수</option>
					<option value="0">전체</option>
					<option value="5">5개 이상</option>
					<option value="10">10개 이상</option>
					<option value="50">50개 이상</option>
				</select>
			</div>
		</div>
		<div id="page-bar" class="col-12 text-center mt-4">
			page-bar
		</div>
	</article>

	<!-- 오른쪽 추천게시판 -->
	<aside class="card col-lg-2">
		<div class="card-header">
			<h5 class="section-title">
				<a href="">추천</a>
			</h5>
			<ul class="list-group list-group-flush">
				<li class="list-group-item">
					<a href="">전체글</a>
				</li>
				<li class="list-group-item">
					<a href="">일반글</a>
				</li>
				<li class="list-group-item">
					<a href="">질문글</a>
				</li>
			</ul>
		</div>
	</aside>
	
</section>
<%@include file="/WEB-INF/views/common/footer.jsp" %>
