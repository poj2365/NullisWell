<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@include file="/WEB-INF/views/common/header.jsp" %>
   <!-- Chart.js CDN -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<style>
  .detail-container {
    position: relative;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 600px;
  }

  .arrow-button {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    width: 40px;
    height: 40px;
    /* border: 2px solid black; */
    background-color: white;
    font-size: 20px;
    cursor: pointer;
    z-index: 10;
  }

  .arrow-left {
    left: 20px;
  }

  .arrow-right {
    right: 20px;
  }

  .content-card {
    width: 700px;
    background-color: white;
    border-radius: 12px;
    box-shadow: 0 0 8px rgba(0, 0, 0, 0.1);
    padding: 30px;
    margin-top: 30px;
    margin-bottom: 30px
  }

  #chartSection {
    display: none;
  }

  .chart-container {
    width: 100%;
    height: 400px;
  }
</style>
<section>
<div class="detail-container">
  <!-- 화살표 버튼 -->
  <button class="arrow-button arrow-left btn btn-outline-secondary" onclick="toggleSection()">
<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8"/>
</svg>
</button>
  <button class="arrow-button arrow-right btn btn-outline-secondary" onclick="toggleSection()">
  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8"/>
</svg>
  </button>



  <!-- 상세 정보 -->
  <div class="content-card" id="detailSection">
    <h2>같이 성장할 백엔드 스터디원 모집!(JAVA / Spring)</h2>
    <p><strong>NullisWell</strong> · 개설일자: 2025년 4월 24일</p>
    <hr/>
    <p>👥 4명 남음 / 5명</p>
    <p><strong>시작:</strong> 2025년 5월 11일 오후 5:00</p>
    <p><strong>종료:</strong> 2025년 5월 11일 오후 7:00</p>
    <p><strong>장소:</strong> 연산역 근처 커피숍</p>
    <p><strong>비용:</strong> 개별 비용</p>
    <br/>
    <p>같이 성장할 백엔드 스터디원 모집합니다<br/>
    매주 자바 스프링을 토론하고 배우는 모임입니다.<br/>
    스터디장소 : 가디역 근처 커피숍<br/>
    인원 : 5명<br/>
    시간 : 일요일 오후 5시~7시 (2시간 이내)<br/>
    대상 : 자바 기반 스프링 관련 백엔드 직장인 스터디 참여<br/>
    필수사항 : 꼭 시간개념이 있는분만 신청해주세요.</p>
  </div>

  <!-- 차트 섹션 -->
  <div class="content-card" id="chartSection">
    <h3>스터디그룹별 공부 시간</h3>
    <div class="chart-container">
      <canvas id="studyChart"></canvas>
    </div>
  </div>
</div>

<script>
  let showingDetail = true;

  function toggleSection() {
    showingDetail = !showingDetail;
    document.getElementById("detailSection").style.display = showingDetail ? "block" : "none";
    document.getElementById("chartSection").style.display = showingDetail ? "none" : "block";

    if (!showingDetail) {
      drawChart();
    }
  }

  const studyData = [
    { name: "홍길동", time: 120 },
    { name: "김민지", time: 95 },
    { name: "이영희", time: 75 },
    { name: "사용자1", time: 60 },
    { name: "사용자2", time: 50 }
  ];

  function drawChart() {
    const ctx = document.getElementById('studyChart').getContext('2d');

    if (window.studyChartInstance) {
      window.studyChartInstance.destroy();
    }

    window.studyChartInstance = new Chart(ctx, {
      type: 'bar',
      data: {
        labels: studyData.map(item => item.name),
        datasets: [{
          label: '공부 시간 (분)',
          data: studyData.map(item => item.time),
          backgroundColor: '#74b9ff'
        }]
      },
      options: {
        responsive: true,
        scales: {
          y: {
            beginAtZero: true,
            ticks: {
              stepSize: 30
            }
          }
        }
      }
    });
  }
</script>
</section>
   <%@include file="/WEB-INF/views/common/footer.jsp" %>