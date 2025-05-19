<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.niw.user.model.dto.User" %><!--회원 dto 만들어서 넣기 -->
<%
User loginUser= (User)session.getAttribute("loginUser");
	Cookie[] cookies=request.getCookies();
	String saveId=null;
    if(cookies != null) { 
        for(Cookie c : cookies){
            if(c.getName().equals("saveId")){
                saveId = c.getValue();
                break;
            }
        }
    }
 	/* 여기에 사용자객체 담아오기, 로그인방식에 따라 세션으로할지 토큰으로 할지 결정후 수정 필요 */
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 첫 프로젝트</title>

<script src="<%=request.getContextPath()%>/resources/js/jquery-3.7.1.min.js"></script>
  <!-- 폰트 -->
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700;900&display=swap" rel="stylesheet">
  <!-- 부트스트랩 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">
</head>
<body>
  <!-- 상단 메뉴 -->
<div class="top-nav">
  <div class="container">
    <div class="row py-1">
      <div class="col-12 d-flex justify-content-end">
        <div class="d-flex gap-3">
          <% if(loginUser==null) { %>
            <!-- 비로그인 상태 메뉴 -->
            <a href="<%=request.getContextPath()%>/user/loginview.do" class="active"><i class="bi bi-person-circle me-1"></i>로그인</a>
            <a href="<%=request.getContextPath()%>/user/enroll.do"><i class="bi bi-person-plus me-1"></i>회원가입</a>
            <a href="<%=request.getContextPath()%>/cs/main.do"><i class="bi bi-headset me-1"></i>고객센터</a>
          <% } else { %>
            <!-- 로그인 상태 메뉴 -->
            <a href="<%=request.getContextPath()%>/user/logout.do"><i class="bi bi-box-arrow-right me-1"></i>로그아웃</a>
            <a href="<%=request.getContextPath()%>/user/mypage.do"><i class="bi bi-person-gear me-1"></i>마이페이지</a>
            <a href="<%=request.getContextPath()%>/message/list.do"><i class="bi bi-envelope me-1"></i>쪽지</a>
            <a href="<%=request.getContextPath()%>/cs/main.do"><i class="bi bi-headset me-1"></i>고객센터</a>
          <% } %>
        </div>
      </div>
    </div>
  </div>
</div>

  <!-- 헤더 -->
  <header class="blind-header py-4">
    <div class="container">
      <div class="row align-items-center">
        <div class="col-lg-3 col-md-4 col-6 mb-3 mb-md-0">
          <a href="<%=request.getContextPath() %>" class="blind-brand">
            <div class="logo-container me-3">
              <i class="bi bi-book fs-4"></i>
            </div>
            <span class="h4 mb-0">학습메이트</span>
          </a>
        </div>
        <div class="col-lg-6 col-md-7 col-12 mt-3 mt-md-0">
          <div class="blind-search">
            <i class="bi bi-search blind-search-icon"></i>
            <input type="text" class="form-control" placeholder="찾고 싶은 학습자료를 검색해보세요">
          </div>
        </div>
        <div class="col-lg-3 col-md-1 d-none d-md-block">
          <div class="d-flex justify-content-end gap-3">
            <button class="blind-btn"><i class="bi bi-cart fs-4"></i></button>
            <button class="blind-btn"><i class="bi bi-bell fs-4"></i></button>
          </div>
        </div>
      </div>
    </div>
  </header>

  <!-- 메뉴 -->
  <nav class="blind-nav">
    <div class="container">
      <ul class="nav justify-content-start flex-nowrap hide-scrollbar">
        <li class="nav-item">
          <a class="nav-link" href="#">
            <i class="bi bi-file-earmark-text"></i>자료게시판
            <i class="bi bi-chevron-down dropdown-toggle-icon"></i>
          </a>
          <div class="custom-dropdown-menu">
            <a class="custom-dropdown-item" href="#">초등 학습자료</a>
            <a class="custom-dropdown-item" href="#">중등 학습자료</a>
            <a class="custom-dropdown-item" href="#">고등 학습자료</a>
            <div class="custom-dropdown-divider"></div>
            <a class="custom-dropdown-item" href="#">교사용 자료</a>
            <a class="custom-dropdown-item" href="#">입시자료</a>
            <a class="custom-dropdown-item" href="#">일반자료</a>
          </div>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">
            <i class="bi bi-chat-dots"></i>자유게시판
            <i class="bi bi-chevron-down dropdown-toggle-icon"></i>
          </a>
          <div class="custom-dropdown-menu">
            <a class="custom-dropdown-item" href="#">일상 이야기</a>
            <a class="custom-dropdown-item" href="#">학습 질문</a>
            <a class="custom-dropdown-item" href="#">고민 상담</a>
            <div class="custom-dropdown-divider"></div>
            <a class="custom-dropdown-item" href="#">정보 공유</a>
            <a class="custom-dropdown-item" href="#">유머</a>
          </div>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">
            <i class="bi bi-people"></i>스터디 게시판
            <i class="bi bi-chevron-down dropdown-toggle-icon"></i>
          </a>
          <div class="custom-dropdown-menu">
            <a class="custom-dropdown-item" href="<%=request.getContextPath()%>/study/studymain.do">스터디 모집</a>
            <a class="custom-dropdown-item" href="<%=request.getContextPath()%>/study/mystudygroup.do">스터디 그룹</a>
            <div class="custom-dropdown-divider"></div>
            <a class="custom-dropdown-item" href="<%=request.getContextPath()%>/study/timerecord.do">타이머</a>
            <a class="custom-dropdown-item" href="<%=request.getContextPath()%>/study/calender.do">내 공부 시간</a>
          </div>
        </li>
      </ul>
    </div>
  </nav>
    <script>
    document.addEventListener('DOMContentLoaded', () => {
    	  const navItems = document.querySelectorAll('.blind-nav .nav-item');

    	  if (navItems.length === 0) {
    	    return;
    	  }

    	  function closeAllDropdowns() {
    	    navItems.forEach(item => {
    	      const menu = item.querySelector('.custom-dropdown-menu');
    	      const link = item.querySelector('.nav-link');
    	      if (menu) {
    	        menu.style.display = 'none';
    	        menu.classList.remove('dropdown-visible');
    	      }
    	      if (link) {
    	        link.classList.remove('active');
    	      }
    	    });
    	  }

    	  closeAllDropdowns();

    	  navItems.forEach((item) => {
    	    const link = item.querySelector('.nav-link');
    	    const menu = item.querySelector('.custom-dropdown-menu');

    	    if (link && menu) {
    	      menu.style.display = 'none';
    	      
    	      link.addEventListener('click', function(e) {
    	        e.preventDefault();
    	        e.stopPropagation();
    	        
    	        const computedStyle = window.getComputedStyle(menu);
    	        const isCurrentlyVisible = menu.style.display === 'block' || 
    	                                  computedStyle.display === 'block' ||
    	                                  menu.classList.contains('dropdown-visible');
    	        
    	        closeAllDropdowns();

    	        if (!isCurrentlyVisible) {
    	          menu.style.display = 'block';
    	          menu.classList.add('dropdown-visible');
    	          this.classList.add('active');
    	        }
    	      });
    	    }
    	  });

    	  document.addEventListener('click', function(e) {
    	    const clickedOnNavLink = e.target.closest('.blind-nav .nav-link');
    	    const clickedInsideDropdownMenu = e.target.closest('.custom-dropdown-menu');

    	    if (clickedOnNavLink) {
    	      return;
    	    }

    	    if (clickedInsideDropdownMenu) {
    	      return;
    	    }
    	    
    	    closeAllDropdowns();
    	  });
    	});
  </script>





