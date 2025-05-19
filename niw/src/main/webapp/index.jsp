<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp" %>

  
  <!-- 메인 컨텐츠 -->
  <div class="container mt-4">
    <div class="row">
      <!-- 왼쪽 컬럼 -->
      <div class="col-md-8">
        <!-- 베스트 게시판 -->
        <div class="card">
          <div class="card-header">
            <h5 class="section-title">
              <span class="section-title-icon">🏆</span>베스트
            </h5>
          </div>
          <ul class="list-group list-group-flush">
            <li class="list-group-item">
              <div class="post-title">
                <span class="post-emoji">🏢</span>
                <span>요즘 핫한 개발 언어</span>
              </div>
              <div class="post-info">
                <span class="post-likes">
                  <span class="post-likes-icon">👍</span>60
                </span>
                <span class="post-comments">
                  <span class="post-comments-icon">💬</span>526
                </span>
              </div>
            </li>
            <li class="list-group-item">
              <div class="post-title">
                <span class="post-emoji">😕</span>
                <span>여드름 도대체 몇살까지 나나요?</span>
              </div>
              <div class="post-info">
                <span class="post-likes">
                  <span class="post-likes-icon">👍</span>0
                </span>
                <span class="post-comments">
                  <span class="post-comments-icon">💬</span>17
                </span>
              </div>
            </li>
            <li class="list-group-item">
              <div class="post-title">
                <span class="post-emoji">📍</span>
                <span>명수님이 좋아하는 맛집 추천</span>
              </div>
              <div class="post-info">
                <span class="post-likes">
                  <span class="post-likes-icon">👍</span>0
                </span>
                <span class="post-comments">
                  <span class="post-comments-icon">💬</span>8
                </span>
              </div>
            </li>
          </ul>
        </div>

        <!-- 뻘뻘팀 게시판 -->
        <div class="card">
          <div class="card-header">
            <h5 class="section-title">
              <span class="section-title-icon">💫</span>뻘뻘팀
            </h5>
          </div>
          <ul class="list-group list-group-flush">
            <li class="list-group-item">
              <div class="post-title">
                <span class="post-emoji">⭐</span>
                <span>스타우브 베이비웍</span>
              </div>
              <div class="post-info">
                <span class="post-comments">
                  <span class="post-comments-icon">💬</span>77
                </span>
              </div>
            </li>
            <li class="list-group-item">
              <div class="post-title">
                <span class="post-emoji">🎄</span>
                <span>조금 많이 이르지만 이거 사놓을까? 미니트리</span>
              </div>
              <div class="post-info">
                <span class="post-comments">
                  <span class="post-comments-icon">💬</span>81
                </span>
              </div>
            </li>
          </ul>
        </div>

        <!-- 스터디 게시판 -->
        <div class="card">
          <div class="card-header">
            <h5 class="section-title">
              <span class="section-title-icon">📚</span>
              <a href="<%=request.getContextPath()%>/study/studyMain.do">스터디 게시판</a>
            </h5>
          </div>
          <ul class="list-group list-group-flush">
            <a href="./groupdetail.html">
              <li class="list-group-item">
                <div class="post-title">
                  <span class="badge-recruiting">모집중</span>
                  <span>[Kotlin + Spring] 코프링 스터디원 모집</span>
                </div>
                <div class="post-info">
                  <span class="post-comments">
                    <span class="post-comments-icon">💬</span>77
                  </span>
                </div>
              </li>
            </a>
            <a href="./groupdetail.html">
              <li class="list-group-item">
                <div class="post-title">
                  <span class="badge-recruiting">모집중</span>
                  <span>팀네이버 신입공채 Tech 최종면접 스터디원 모집 (Data 분야)</span>
                </div>
                <div class="post-info">
                  <span class="post-comments">
                    <span class="post-comments-icon">💬</span>81
                  </span>
                </div>
              </li>
            </a>
            <a href="./groupdetail.html">
              <li class="list-group-item">
                <div class="post-title">
                  <span class="badge-recruiting">모집중</span>
                  <span>같이 성장할 백엔드 스터디원 모집!(JAVA / Spring)</span>
                </div>
                <div class="post-info">
                  <span class="post-comments">
                    <span class="post-comments-icon">💬</span>81
                  </span>
                </div>
              </li>
            </a>
          </ul>
        </div>
      </div>

      <!-- 오른쪽 컬럼 -->
      <div class="col-md-4">
        <!-- 사용자 프로필 카드 -->
        <div class="user-profile-card">
          <div class="user-info">
            <div class="welcome-message">
              <strong>아이디</strong>님 환영합니다!
            </div>
            <div class="user-school">
              <strong>OO</strong>고등학교
            </div>
          </div>
          <div class="user-actions">
            <button class="btn-custom notification-btn">
              알림
              <span class="notification-badge">999+</span>
            </button>
            <button class="btn-custom">마이페이지</button>
            <button class="btn-custom">로그아웃</button>
          </div>
        </div>

        <!-- 광고 카드 -->
        <div class="card">
          <div class="card-header">
            <h5 class="section-title">
              <span class="section-title-icon">📢</span>광고자리
            </h5>
          </div>
          <ol class="ad-list list-group list-group-flush">
            <li class="list-group-item ad-item">부산도시가스</li>
            <li class="list-group-item ad-item">제이시스메디칼</li>
            <li class="list-group-item ad-item">키다리스튜디오</li>
            <li class="list-group-item ad-item">스크레인스파이코리아</li>
            <li class="list-group-item ad-item">가축위생방역지원본부</li>
          </ol>
        </div>
      </div>
    </div>
  </div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>

