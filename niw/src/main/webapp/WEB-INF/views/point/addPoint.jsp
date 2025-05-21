<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- jQuery넣어주기 -->
 <!-- <script src="https://cdn.portone.io/v2/browser-sdk.js"></script> -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<!--  <script>
  document.addEventListener("DOMContentLoaded", function () {
    IMP.init("iamporttest"); // ⚠️ 여기에 본인 MID 넣기 (테스트용: iamporttest_3)
  });
</script> -->
<meta charset="UTF-8">
  <title>포인트 충전</title>
  <style>
    body {
      background-color: #f7f9fc;
      font-family: 'Noto Sans KR', sans-serif;
      padding: 40px 20px;
    }
    .charge-container {
      max-width: 500px;
      margin: 0 auto;
      background: #fff;
      padding: 30px;
      border-radius: 12px;
      box-shadow: 0 0 10px rgba(0,0,0,0.05);
    }
    h2 {
      text-align: center;
      margin-bottom: 30px;
    }
    .point-display {
      font-size: 18px;
      margin-bottom: 20px;
      background: #eaf4ff;
      padding: 15px;
      border-radius: 8px;
      text-align: center;
    }
    label {
      display: block;
      margin-bottom: 8px;
      font-weight: bold;
    }
    input[type="number"] {
      width: 100%;
      padding: 12px;
      font-size: 16px;
      margin-bottom: 10px;
      border-radius: 8px;
      border: 1px solid #ccc;
    }
    .calculated-info {
      text-align: center;
      font-size: 15px;
      margin-bottom: 15px;
      color: #333;
      background-color: #f1f1f1;
      padding: 10px;
      border-radius: 6px;
    }
    .amount-buttons {
    display: flex;
    flex-direction: column; 
    gap: 10px;
    margin-bottom: 20px;
    }
    .amount-buttons button {
    width: 100%;
    padding: 12px;
    background-color: #ddd;
    border: none;
    border-radius: 8px;
    font-weight: bold;
    cursor: pointer;
    font-size: 14px;
    }
    .amount-buttons button:hover {
      background-color: #c9c1c1;
    }
    .charge-btn {
      width: 100%;
      padding: 14px;
      background-color: #24b1b5;
      border: none;
      color: white;
      font-size: 16px;
      font-weight: bold;
      border-radius: 8px;
      cursor: pointer;
    }
    .charge-btn:hover {
      background-color: #1a8588;
    }
    .notice {
      margin-top: 15px;
      font-size: 13px;
      color: #777;
      text-align: center;
    }
  </style>
</head>
<body>

<div class="charge-container">
  <h2>포인트 충전</h2>

  <div class="point-display">
    현재 보유 포인트: <strong>2,500P</strong>
  </div>

  
    <label for="amount">충전할 포인트 (P)</label>
    <input type="number" id="amount" name="amount" placeholder="예: 10000" min="1000" step="1000" oninput="updatePaymentInfo()" readonly>

    <div class="calculated-info" id="paymentInfo">
      결제할 금액: 0원
    </div>


   <div class="amount-buttons">
    <button type="button" onclick="setAmount(5000)">5,000P (5,500원)</button>
    <button type="button" onclick="setAmount(10000)">10,000P (11,000원)</button>
    <button type="button" onclick="setAmount(20000)">20,000P (22,000원)</button>
    <button type="button" onclick="setAmount(30000)">30,000P (33,000원)</button>
    <button type="button" onclick="setAmount(50000)">50,000P (55,000원)</button>
</div>

    <button type="button" class="charge-btn" onclick ="requestPay();">충전하기</button>

  <div class="notice">
    충전 금액은 포인트의 10%가 추가된 금액입니다.<br>
    예: 10,000P → 11,000원 결제
  </div>
</div>

<script>
  const userCode = "iamporttest_3"; // 포트원 테스트용 MID
  IMP.init(userCode);

  function requestPay() {
    const amount = parseInt(document.getElementById('amount').value);
    if (isNaN(amount)) {
    /*   alert("충전할 포인트를 선택해주세요.");
      return; */
    }

    const payAmount = Math.floor(amount * 1.1); // 실제 결제 금액 (10% 추가)

    const userCode = "imp38113060";
    IMP.init(userCode); // 고객사 식별 코드를 넣어 모듈을 초기화해주세요.

    IMP.request_pay(
      {
        channelKey: "channel-key-0444714e-72d4-48cc-a56d-8cf57cdd64db",
        merchant_uid: "order_id_1667634130160",
        name: "나이키 와플 트레이너 2 SD",
        pay_method: "card",
        escrow: false,
        amount: "109000",
        tax_free: 3000,
        buyer_name: "홍길동",
        buyer_email: "buyer@example.com",
        buyer_tel: "02-1670-5176",
        buyer_addr: "성수이로 20길 16",
        buyer_postcode: "04783",
        m_redirect_url: "https://helloworld.com/payments/result", // 모바일 환경에서 필수 입력
        notice_url: "https://helloworld.com/api/v1/payments/notice",
        confirm_url: "https://helloworld.com/api/v1/payments/confirm",
        currency: "KRW",
        locale: "ko",
        custom_data: { userId: 30930 },
        display: { card_quota: [0, 6] },
        appCard: false,
        useCardPoint: false,
        bypass: {
          tosspayments: {
            useInternationalCardOnly: false, // 영어 결제창 활성화
          },
        },
      },
      (response) => {
        alert(response.imp_uid);
      },
    );
  }

  function sendToServer(imp_uid) {
    fetch("/verifyPayment", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ imp_uid: imp_uid })
    });
  }

  function setAmount(value) {
 /*    document.getElementById('amount').value = value;
    updatePaymentInfo(); */
  }

  function updatePaymentInfo() {
    const amount = parseInt(document.getElementById('amount').value);
    const display = document.getElementById('paymentInfo');

    if (!isNaN(amount) && amount >= 1000) {
      const realPrice = Math.floor(amount * 1.1);
      display.textContent = `결제할 금액: ${realPrice.toLocaleString()}원`;
    } else {
      display.textContent = '결제할 금액: 0원';
    }
  }
</script>



</body>
</html>