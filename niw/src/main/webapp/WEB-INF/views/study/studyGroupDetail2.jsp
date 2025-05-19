<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@include file="/WEB-INF/views/common/header.jsp" %>
 <style>

    .detail-container {
   min-width: 300px;
  max-width: 700px;
      margin: 0 auto;
      background-color: white;
      padding: 20px;
      box-shadow: 0 2px 6px rgba(0,0,0,0.1);
      border-radius: 10px;
    }



    .detail-header {
      border-bottom: 1px solid #ddd;
      padding-bottom: 10px;
      margin-bottom: 20px;
    }

    .title {
      font-size: 20px;
      font-weight: bold;
      margin-bottom: 5px;
    }

    .meta {
      color: gray;
      font-size: 14px;
    }


    .organizer {
      display: flex;
      align-items: center;
      margin: 20px 0;
    }

    .organizer img {
      width: 40px;
      height: 40px;
      border-radius: 50%;
      margin-right: 10px;
    }

    .members {
      display: flex;
      align-items: center;
      margin-bottom: 10px;
    }

    .members span {
      font-size: 16px;
      color: green;
      margin-right: 10px;
    }

    .avatars {
      display: flex;
      gap: 10px;
    }

    .avatar {
      width: 40px;
      height: 40px;
      background-color: #eee;
      border-radius: 50%;
      display: inline-block;
      line-height: 40px;
      text-align: center;
      color: #aaa;
      overflow: hidden;
    }

    .info {
      margin: 20px 0;
    }

    .info-item {
      margin-bottom: 10px;
      font-size: 14px;
    }

    .info-item span {
      font-weight: bold;
      margin-right: 8px;
    }

    .description {
      font-size: 14px;
      line-height: 1.6;
      white-space: pre-wrap;
    }

    .apply-button {
      margin-top: 30px;
      text-align: center;
    }

    .apply-button button {
      background-color: #76c043;
      border: none;
      padding: 12px 30px;
      font-size: 16px;
      color: white;
      border-radius: 25px;
      cursor: pointer;
    }

    .apply-button button:hover {
      background-color: #65a83c;
    }

   /* modal */
  .modal {
    display: none;
    position: fixed;
    z-index: 999;
    padding-top: 40px;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0,0,0,0.5);
  }

  .modal-content {
    background-color: #fff;
    margin: auto;
    padding: 30px;
    border-radius: 10px;
    width: 90%;
    max-width: 500px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.2);
  }

  .close {
    float: right;
    font-size: 28px;
    font-weight: bold;
    cursor: pointer;
  }

  form input, form textarea {
    width: 100%;
    padding: 10px;
    margin-top: 5px;
    box-sizing: border-box;
    border-radius: 5px;
    border: 1px solid #ccc;
  }

  form button[type="submit"] {
    background-color: #76c043;
    border: none;
    color: white;
    padding: 12px 20px;
    margin-top: 10px;
    border-radius: 25px;
    cursor: pointer;
  }

  form button[type="submit"]:hover {
    background-color: #5ea137;
  }
  /* modal end */
  </style>
   <section>
  <div class="detail-container">
    <div class="detail-header">
      <div class="title">같이 성장할 백엔드 스터디원 모집!(JAVA / Spring)</div>
      <div class="meta">NullisWell · 개설일자: 2025년 4월 24일</div>
    </div>

    <div class="members">
      <div class="avatars">
        <div class="avatar">NullisWell</div>
        <div class="avatar">대기</div>
        <div class="avatar">대기</div>
        <div class="avatar">대기</div>
        <div class="avatar">대기</div>
        <span>4명 남음 / 5명</span>
      </div>
    </div>

    <div class="info">
      <div class="info-item"><span>시작:</span>2025년 5월 11일 오후 5:00</div>
      <div class="info-item"><span>종료:</span>2025년 5월 11일 오후 7:00</div>
      <div class="info-item"><span>장소:</span>연산역 근처 커피숍</div>
      <div class="info-item"><span>비용:</span>개별 비용</div>
    </div>

    <div class="description">
      같이 성장할 백엔드 스터디원 모집합니다
      매주 자바 스프링을 토론하고 배우는 모임입니다.
      스터디장소 : 가디역 근처 커피숍
      인원 : 5명
      시간 : 일요일 오후 5시~7시 (2시간 이내)
      대상 : 자바 기반 스프링 관련 백엔드 직장인 스터디 참여
      필수사항 : 꼭 시간개념이 있는분만 신청해주세요.
    </div>

    <div class="apply-button">
        <button onclick="openModal()">참여하기</button>
    </div>
  </div>

  <div id="applyModal" class="modal">
  <div class="modal-content">
    <span class="close" onclick="closeModal()">&times;</span>
    <h2>스터디 신청</h2>
    <form id="applyForm">
      <label>이름 <input type="text" name="name" required /></label><br><br>
      <label>거주지<input type="text" name="location" placeholder="예: 가산동동" required /></label><br><br>
      <label>학교/전공<input type="text" name="school" placeholder="스터디 관련된 전공일 경우 작성" /></label><br><br>
      <label>직업<input type="text" name="job" required /></label><br><br>
      <label>연락처<input type="text" name="contact" required /></label><br><br>
      <label>신청하는 이유<textarea name="reason" rows="4" required></textarea></label><br><br>
      <button type="submit">신청하기</button>
    </form>
  </div>
</div>


<script>
  function openModal() {
    document.getElementById("applyModal").style.display = "block";
  }

  function closeModal() {
    document.getElementById("applyModal").style.display = "none";
  }

  // ESC 키로도 닫히게
  window.addEventListener("keydown", function (e) {
    if (e.key === "Escape") closeModal();
  });

  // 폼 제출 시 예시 처리 (백엔드 연동 전용)
  document.getElementById("applyForm").addEventListener("submit", function (e) {
    e.preventDefault();
    alert("신청이 완료되었습니다!");
    closeModal();
    this.reset();
  });
</script>
   </section>
   <%@include file="/WEB-INF/views/common/footer.jsp" %>