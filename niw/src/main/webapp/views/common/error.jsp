<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러페이지</title>
</head>
<body>
	<h2>에러발생발생</h2>
	<p style="color:red;background-color:yellow">
	서버에서 에러가 발생했습니다</p>
	<%-- <p><%=exception.getMessage() %></p> --%>
	<h4>3초후 메인화면으로 이동합니다.</h4>
	<script>
		setTimeout(()=>{
			location.replace("<%=request.getContextPath()%>");
		},3000);
	</script>
</body>
</html>









