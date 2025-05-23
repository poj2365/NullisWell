<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@include file="/WEB-INF/views/common/header.jsp" %>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.17/index.global.min.js'></script>
    <style>
    .cal-container{
    	margin: 15px;
    	max-width: 1000px;
    	justify-content: center;
    	align-content: center;
    }
    </style>
    <script>

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
            headerToolbar: {
                left: 'prev',
                center: 'title,dayGridMonth,timeGridWeek,timeGridDay,listMonth',
                right: 'next'
              },
              footerToolbar: {
            	  right:'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
              },
              titleFormat: function (date) {
                  return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
              },
              selectable: true,
              select : function(arg){
            	  console.log(arg);
              }

        }); 
        calendar.render();
      });

    </script>
<section>
<div class="cal-container">
    <div id='calendar'></div>
    </div>
   </section>
   <%@include file="/WEB-INF/views/common/footer.jsp" %>