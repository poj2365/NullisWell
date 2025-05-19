<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@include file="/WEB-INF/views/common/header.jsp" %>
<section>
          <!-- 메인 콘텐츠 -->
        <div class="container mt-4">
                <div class="col-md-12 board-menu">
                    <h5 class="border-bottom pb-2 mt-3 mb-3">
                        <a href="<%=request.getContextPath()%>/study/mystudygroup.do">내 스터디 그룹 </a>
                    </h5>
                    <div class="accordion" id="accordionExample">
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingOne">
                                <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                    [Kotlin + Spring] 코프링 스터디원 모집
                                </button>
                            </h2>
                            <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne"
                                data-bs-parent="#accordionExample">
                                    <a href="<%=request.getContextPath()%>/study/groupdetail.do">
                                <div class="accordion-body">
        								장소: 온라인(ZOOM)<br>
       									시간: 평일 저녁 9시<br>
        								인원: 6명
                                </div>
                                    </a>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingTwo">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                    팀네이버 신입공채 Tech 최종면접 스터디원 모집 (Data 분야)
                                </button>
                            </h2>
                            <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo"
                                data-bs-parent="#accordionExample">
                                <a href="./groupdetail.html">
                                <div class="accordion-body">
                                        장소: 서면 스터디룸<br>
       					 				시간: 토요일 3시 ~ 6시<br>
        								인원: 4명
                                </div>
                                </a>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingThree">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                    같이 성장할 백엔드 스터디원 모집!(JAVA / Spring)
                                </button>
                            </h2>
                            <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree"
                                data-bs-parent="#accordionExample">
                                    <a href="./groupdetail.html">
                                <div class="accordion-body">
                                        장소: 가디역 근처 스터디룸<br>
       					 				시간: 평일 9시<br>
        								인원: 6명
                                </div>
                                    </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </div>
   </section>
   <%@include file="/WEB-INF/views/common/footer.jsp" %>