<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp" %>
  <main class="bg-primary-light py-5">
    <div class="container login-animation">
      <div class="login-container">
        <div class="card login-card shadow-custom">
          <div class="login-header gradient-header text-center text-white position-relative"
            style="background: linear-gradient(135deg, var(--bs-blind-dark) 0%, var(--bs-blind-gray) 100%);">
            <div class="position-relative">
              <h2 class="fw-bold mb-2 fs-1">로그인</h2>
              <p class="mb-0 fs-6">학습메이트에 오신 것을 환영합니다! 😄</p>
            </div>
          </div>
          <div class="login-body">
            <form>
              <div class="form-floating mb-3">
                <input type="text" class="form-control" id="username" placeholder="아이디">
                <label for="username"><i class="bi bi-person me-1"></i>아이디</label>
              </div>
              <div class="form-floating mb-3">
                <input type="password" class="form-control" id="password" placeholder="비밀번호">
                <label for="password"><i class="bi bi-lock me-1"></i>비밀번호</label>
              </div>

              <div class="d-flex justify-content-between align-items-center mb-4">
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" id="rememberMe">
                  <label class="form-check-label" for="rememberMe">
                    로그인 상태 유지
                  </label>
                </div>
                <div class="login-options">
                  <a href="#">아이디/비밀번호 찾기</a>
                </div>
              </div>

              <div class="d-grid mb-4">
                <button class="btn btn-primary py-3 fw-bold fs-5" type="submit">
                  <i class="bi bi-box-arrow-in-right me-2"></i>로그인
                </button>
              </div>

              <div class="login-divider">
                <span>또는</span>
              </div>

              <div class="row g-2 mb-4">
                <div class="col-6">
                  <button type="button" class="btn w-100 btn-google d-flex align-items-center justify-content-center">
  					<img src="https://img.icons8.com/?size=100&id=V5cGWnc9R4xj&format=png&color=000000" alt="구글" style="height:20px;" class="me-2">
  					구글 로그인
				</button>
                </div>
                <div class="col-6">
                  <button type="button" class="btn w-100 btn-naver d-flex align-items-center justify-content-center">
                    <img src="https://mblogthumb-phinf.pstatic.net/MjAyMjEyMTVfMTE0/MDAxNjcxMDkwNjU3NTkw.KoGra3iQfkuqnbSFoQ7PA3YMqnExItsdfOLk960Rxnkg.umx5uLYTj2TEMhx7rMA5uNxvyJD2T42OSeSFsxNUQygg.PNG.y2kwooga/%EB%84%A4%EC%9D%B4%EB%B2%84_AI-04.png?type=w800"
                      alt="네이버" style="height:25px;" class="me-2">
                    네이버 로그인
                  </button>
                </div>
              </div>

              <div class="text-center login-options">
                <p class="mb-0">아직 회원이 아니신가요? <a href="#" class="fw-bold text-primary">회원가입</a></p>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </main>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>

