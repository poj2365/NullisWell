<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<%
String errorCode = (String)request.getAttribute("errorCode"); 
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>에러 발생</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #f5f5f5;
            color: #333;
        }

        .header {
            background-color: #1A8A8E;
            color: white;
            padding: 20px;
            text-align: center;
            font-size: 28px;
            font-weight: bold;
        }

        .container {
            max-width: 600px;
            margin: 60px auto;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            padding: 40px 30px;
            text-align: center;
        }

        .error-code {
            font-size: 72px;
            color: #1A8A8E;
            margin-bottom: 20px;
        }

        .error-message {
            font-size: 20px;
            margin-bottom: 30px;
        }

        .home-btn {
            background-color: #1A8A8E;
            color: white;
            border: none;
            padding: 12px 24px;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            text-decoration: none;
        }

        .home-btn:hover {
            background-color: #157477;
        }
    </style>
</head>
<body>
    <div class="header">에러 페이지</div>
    <div class="container">
        <div class="error-code"><%=errorCode %></div>
        <div class="error-message">
        <% if(errorCode.equals("404")){ %>
        	404 Not Found
            요청하신 페이지를 찾을 수 없습니다.<br>
            주소를 다시 확인하거나 홈으로 이동해주세요.
           <%}else if(errorCode.equals("500")){ %>
           500 Internal Server Error<br>
           내부 서버 오류가 발생했습니다.<br>
           관리자에게 문의 하거나 홈으로 이동해주세요.
           <%}else if(errorCode.equals("400")){%>
           400 Bad Request<br>
           잘못된 요청입니다.<br>
           관리자에게 문의 하거나 홈으로 이동해주세요.
           <%}else {%>
            예상하지 못한 오류가 발생했습니다.<br>
           관리자에게 문의 하거나 홈으로 이동해주세요.
           <%} %>
        </div>
        <a href="<%=request.getContextPath()%>/" class="home-btn">홈으로 이동</a>
    </div>
</body>
</html>