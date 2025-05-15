<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/views/common/header.jsp" %>
<section>
<!-- 메인 콘텐츠 -->
    <div class="container mt-4">
        <div class="row">

            <!-- 왼쪽 컬럼 -->
            <div class="col-md-8 board-menu">
                <h5 class="border-bottom pb-2 mb-3">베스트</h5>
                <ul class="list-group mb-4">
                    <li class="list-group-item">🏢 요즘 핫한 개발 언어 <span class="float-end text-muted">👍 60 💬 526</span>
                    </li>
                    <li class="list-group-item">😕 여드름 도대체 몇살까지 나나요? <span class="float-end text-muted">👍 0 💬
                            17</span></li>
                    <li class="list-group-item">📍 명수님이 좋아하는 맛집 추천 <span class="float-end text-muted">👍 0 💬 8</span>
                    </li>
                    <!-- 생략 가능 -->
                </ul>

                <h5 class="border-bottom pb-2 mb-3">뻘뻘팀</h5>
                <ul class="list-group">
                    <li class="list-group-item">⭐ 스타우브 베이비웍 <span class="float-end text-muted">77</span></li>
                    <li class="list-group-item">🎄 조금 많이 이르지만 이거 사놓을까? 미니트리 <span class="float-end text-muted">81</span>
                    </li>
                </ul>

                <h5 class="border-bottom pb-2 mt-3 mb-3">
                    <a href="./study.html">스터디 게시판 </a>
                </h5>
                <ul class="list-group">
                    <a href="./groupdetail.html">
                    <li class="list-group-item"><span class="badge" style="top: 30%; right: 59%;">모집중</span> [Kotlin + Spring] 코프링 스터디원 모집 <span class="float-end text-muted">77</span></li></a>
                    <a href="./groupdetail.html">
                    <li class="list-group-item"><span class="badge" style="top: 30%; right: 41%;">모집중</span> 팀네이버 신입공채 Tech 최종면접 스터디원 모집 (Data 분야) <span class="float-end text-muted">81</span>
                    </li></a>
                    <a href="./groupdetail.html">
                    <li class="list-group-item"><span class="badge" style="top: 30%; right: 50%;">모집중</span> 같이 성장할 백엔드 스터디원 모집!(JAVA / Spring)<span class="float-end text-muted">81</span>
                    </li></a>
                </ul>
            </div>

            <!-- 오른쪽 컬럼 -->
            <div class="col-md-4">
                <div class="user-card">
                    <div class="info">
                        <span class="welcome-msg"><strong>아이디</strong>님 환영합니다!</span><br>
                        <span class="welcome-msg"><strong>OO</strong>고등학교</span>
                    </div>
                    <div class="user-menu">
                        <div class="wrapper">
                            <span class="badge">999+</span>
                            <button class="btn btn-sm btn-outline-secondary ms-3">알림</button>
                        </div>
                        <button class="btn btn-sm btn-outline-secondary ms-3">마이페이지</button>
                        <button class="btn btn-sm btn-outline-secondary ms-3">로그아웃</button>
                    </div>
                </div>
                <h5 class="border-bottom pb-2 mb-3">광고자리</h5>
                <ol class="list-group list-group-numbered mb-4">
                    <li class="list-group-item">부산도시가스</li>
                    <li class="list-group-item">제이시스메디칼</li>
                    <li class="list-group-item">키다리스튜디오</li>
                    <li class="list-group-item">스크레인스파이코리아</li>
                    <li class="list-group-item">가축위생방역지원본부</li>
                </ol>

                <!-- <h5 class="border-bottom pb-2 mb-3">법률·노무 상담</h5>
        <ul class="list-group">
          <li class="list-group-item">💬 당근마켓 거래 신고 가능할까?ㅠㅠ <span class="float-end text-muted">307</span></li>
          <li class="list-group-item">📩 법률상담 부탁드립니다 <span class="float-end text-muted">35</span></li>
        </ul> -->
            </div>

        </div>
    </div>
</section>
    <%@ include file="/views/common/footer.jsp" %>