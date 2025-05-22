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
    input[type="text"] {
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
    <input type="text" readonly id="amount" name="amount" oninput="updatePaymentInfo()">

    <div class="calculated-info" id="paymentInfo">
      결제할 금액: 0원
    </div>


   <div class="amount-buttons">
    <button type="button" onclick="setAmount(5000)">5000P (5,500원)</button>
    <button type="button" onclick="setAmount(10000)">10000P (11,000원)</button>
    <button type="button" onclick="setAmount(20000)">20000P (22,000원)</button>
    <button type="button" onclick="setAmount(30000)">30000P (33,000원)</button>
    <button type="button" onclick="setAmount(50000)">50000P (55,000원)</button>
</div>

    <button type="button" class="charge-btn" onclick ="requestPay();">충전하기</button>

  <div class="notice">
    충전 금액은 포인트의 10%가 추가된 금액입니다.<br>
    예: 10,000P → 11,000원 결제
  </div>
</div>

<script>



/* 
 function requestPay() {
		const amount = parseInt(document.getElementById('amount').value);
	    if (isNaN(amount)) {
	       alert("충전할 포인트를 선택해주세요.");
	      return; 
	    }
	    const payAmount = Math.floor(amount * 1.1);
	
		const userCode = "imp38113060";
		IMP.init(userCode);
		IMP.request_pay(
				  {
				    channelKey: "channel-key-0444714e-72d4-48cc-a56d-8cf57cdd64db",  // 내가 발급한 채널키
				    pay_method: "card", // 결재 방법
				    merchant_uid: "order_id_1667634130160", // 주문 고유 번호
				    name: "포인트 : " + amount + "P" , // 출력할 상품정보 이름,
				    amount: payAmount,
				    buyer_email: "gildong@gmail.com", // DB연결 되면 수정
				    buyer_name: "홍길동", // DB연결 되면 수정
				    buyer_tel: "010-4242-4242", // DB연결 되면 수정
				    buyer_addr: "서울특별시 강남구 신사동", // DB연결 되면 수정
				    buyer_postcode: "01181", // DB연결 되면 수정	 
				    
				    // m_redirect_url: `${BASE_URL}/payment-redirect`--> 모바일 리디렉션 주소
				    	
				  },
				  async (response) => {
					    if (response.error_code != null) {
					      return alert('결제에 실패하였습니다.');
					    }

					    // 고객사 서버에서 /payment/complete 엔드포인트를 구현해야 합니다.
					    // (다음 목차에서 설명합니다)
					    const notified = await fetch(`${SERVER_BASE_URL}/payment/complete`, {
					      method: "POST",
					      headers: { "Content-Type": "application/json" },
					      // imp_uid와 merchant_uid, 주문 정보를 서버에 전달합니다
					      body: JSON.stringify({
					        imp_uid: response.imp_uid,
					        merchant_uid: response.merchant_uid,
					        // 주문 정보...
					    	// JSON 요청을 처리하기 위해 body-parser 미들웨어 세팅
					        app.use(bodyParser.json());

					        // POST 요청을 받는 /payments/complete
					        app.post("/payment/complete", async (req, res) => {
					          try {
					            // 요청의 body로 imp_uid와 merchant_uid가 전달되기를 기대합니다.
					            const { imp_uid, merchant_uid } = req.body;

					            // 1. 포트원 API 엑세스 토큰 발급
					            const tokenResponse = await fetch("https://api.iamport.kr/users/getToken", {
					              method: "POST",
					              headers: { "Content-Type": "application/json" },
					              body: JSON.stringify({
					                imp_key: "imp_apikey", // REST API 키
					                imp_secret: "ekKoeW8RyKuT0zgaZsUtXXTLQ4AhPFW", // REST API Secret
					              }),
					            });
					            if (!tokenResponse.ok)
					              throw new Error(`tokenResponse: \${await tokenResponse.json()}`);
					            const { response } = await tokenResponse.json();
					            const { access_token } = response;

					            // 2. 포트원 결제내역 단건조회 API 호출
					            const paymentResponse = await fetch(
					              `https://api.iamport.kr/payments/${imp_uid}`,
					              { headers: { Authorization: access_token } },
					            );
					            if (!paymentResponse.ok)
					              throw new Error(`paymentResponse: \${paymentResponse.json()}`);
					            const payment = await paymentResponse.json();

					            // 3. 고객사 내부 주문 데이터의 가격과 실제 지불된 금액을 비교합니다.
					            const order = await OrderService.findById(merchant_uid);
					            if (order.amount === payment.amount) {
					              switch (payment.status) {
					                case "ready": {
					                  // 가상 계좌가 발급된 상태입니다.
					                  // 계좌 정보를 이용해 원하는 로직을 구성하세요.
					                  break;
					                }
					                case "paid": {
					                  // 모든 금액을 지불했습니다! 완료 시 원하는 로직을 구성하세요.
					                  break;
					                }
					              }
					            } else {
					              // 결제 금액이 불일치하여 위/변조 시도가 의심됩니다.
					            }
					          } catch (e) {
					            // 결제 검증에 실패했습니다.
					            res.status(400).send(e);
					          }
					        });
					      }),
					    });
					  },
					);
				}  */
	
  /* const userCode = "iamporttest_3"; // 포트원 테스트용 MID
  IMP.init(userCode);
 */
 
  function requestPay() {
    const amount = parseInt(document.getElementById('amount').value);
    if (isNaN(amount)) {
       alert("충전할 포인트를 선택해주세요.");
      return; 
    }

    const payAmount = Math.floor(amount * 1.1);

    const userCode = "imp38113060";
    IMP.init(userCode); 
    
    IMP.request_pay(
      {
        channelKey: "channel-key-0444714e-72d4-48cc-a56d-8cf57cdd64db", // 내가 발급한 채널키
        merchant_uid: "order_id_1667341316092",
        name: "포인트 : " + amount + "P" , // 출력할 상품정보 이름
        pay_method: "card", 
        escrow: false,
        amount: amount*1.1,
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
    		 console.log(response);
    	  if(!response.error_msg){
    		  sendToServer(response.imp_uid); 
    	 }else{
    		 alert(response.error_msg);
    	 } 
      },
    );
  } 
 
  function sendToServer(imp_uid) {
    fetch("<%=request.getContextPath()%>/point/verifyPayment", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ imp_uid: imp_uid })
    });
  }

  function setAmount(value) {
  	document.getElementById('amount').value = value;
    updatePaymentInfo(); 
  }
  
 

  function updatePaymentInfo() {
    const amount = parseInt(document.getElementById('amount').value);
    
    const display = document.getElementById('paymentInfo');

    if (!isNaN(amount)) {
      const realPrice = Math.floor(amount * 1.1);
      console.log("실제결제금액",realPrice);
      display.textContent = "실제결제금액 : " + realPrice.toLocaleString() + "원";
      
    } else {
      
    }
  }
  
  
  const display = document.getElementById('paymentInfo');
  display.textContent = '결제할 금액: 0원';
</script>



</body>
</html>