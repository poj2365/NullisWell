<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<section>
    <!-- 메인 콘텐츠 -->
    <div class="container mt-4">
        <div class="row">

            <!-- 왼쪽 컬럼 -->
            <div class="col-md-12 board-menu">
                <h5 class="border-bottom pb-2 mt-3 mb-3">
                    <a href="<%=request.getContextPath()%>/study/studymain.do">스터디 게시판 </a>
                </h5>
                <ul class="list-group">
                    <a href="<%=request.getContextPath()%>/study/studygroupdetail.do">
                    <li class="list-group-item"><span class="badge bg-secondary" style="top: 30%; right: 59%;">모집완료</span> [Kotlin + Spring] 코프링 스터디원 모집 <span class="float-end text-muted">77</span></li></a>
                    <a href="./groupdetail.html">
                    <li class="list-group-item"><span class="badge bg-secondary" style="top: 30%; right: 41%;">모집완료</span> 팀네이버 신입공채 Tech 최종면접 스터디원 모집 (Data 분야) <span class="float-end text-muted">81</span>
                    </li></a>
                    <a href="./groupdetail.html">
                    <li class="list-group-item"><span class="badge bg-secondary" style="top: 30%; right: 50%;">모집완료</span> 같이 성장할 백엔드 스터디원 모집!(JAVA / Spring)<span class="float-end text-muted">81</span>
                    </li></a>
                    <li class="list-group-item"><span class="badge bg-secondary" style="top: 30%; right: 50%;">모집완료</span> 같이 성장할 백엔드 스터디원 모집!(JAVA / Spring)<span class="float-end text-muted">81</span>
                    </li></a>
                    <li class="list-group-item"><span class="badge" style="top: 30%; right: 50%;">모집중</span> 같이 성장할 백엔드 스터디원 모집!(JAVA / Spring)<span class="float-end text-muted">81</span>
                    </li></a>
                    <li class="list-group-item"><span class="badge" style="top: 30%; right: 50%;">모집중</span> 같이 성장할 백엔드 스터디원 모집!(JAVA / Spring)<span class="float-end text-muted">81</span>
                    </li></a>
                    <li class="list-group-item"><span class="badge2" style="top: 30%; right: 50%;">모집중</span> 같이 성장할 백엔드 스터디원 모집!(JAVA / Spring)<span class="float-end text-muted">81</span>
                    </li></a>
                    <li class="list-group-item"><span class="badge-recruiting" style="top: 30%; right: 50%;">모집중</span> 같이 성장할 백엔드 스터디원 모집!(JAVA / Spring)<span class="float-end text-muted">81</span>
                    </li></a>
                    <li class="list-group-item"><span class="badge-recruiting" style="top: 30%; right: 50%;">모집중</span> 같이 성장할 백엔드 스터디원 모집!(JAVA / Spring)<span class="float-end text-muted">81</span>
                    </li></a>
                    <li class="list-group-item"><span class="badge-recruiting" style="top: 30%; right: 50%;">모집중</span> 같이 성장할 백엔드 스터디원 모집!(JAVA / Spring)<span class="float-end text-muted">81</span>
                    </li></a>
                    <li class="list-group-item"><span class="badge-recruiting" style="top: 30%; right: 50%;">모집중</span> 같이 성장할 백엔드 스터디원 모집!(JAVA / Spring)<span class="float-end text-muted">81</span>
                    </li></a>
                </ul>
            </div>
            <p style="text-align: center; margin: 10px; font-size: 18px;">1 2 3 4 5 6 7 8 9</p>
            <button class="btn btn-secondary" onclick="createGroup();">그룹 생성</button>
            <!-- 로그인 체크 해야되고 회원 id 값 가져가야함 -->
        </div>
    </div>
</section>
<script>
	const createGroup = ()=>{
		const userId = "test";
		location.assign("<%=request.getContextPath()%>/study/groupcreate.do?userId="+userId);
	}
</script>
<%@include file="/WEB-INF/views/common/footer.jsp" %>