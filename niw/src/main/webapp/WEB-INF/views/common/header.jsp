<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 첫 프로젝트</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.7.1.min.js"></script>
</head>
<body>
	<div id="header">
		<header>
			<h1>HelloMVC</h1>
			<div class="login-container">
				<form action="" method="">
					<table>
						<tr>
							<td>
								<input type="text" name="userId" id="userId"
								placeholder="아이디입력" 
								>
							</td>
							<td></td>
						</tr>
						<tr>
							<td>
								<input type="password" name="password" id="passwod"
								placeholder="패스워드입력">
							</td>
							<td>
								<input type="submit" value="로그인" >
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="checkbox" name="saveId" 
								id="saveId" >
								<label for="saveId">아이디저장</label>
								<input type="button" value="회원가입"
								onclick="enroll()">
							</td>
						</tr>
					</table>
				</form>
			</div>
			<nav>
				<ul class="main-nav">
					<li class="home">
						<a href="">Home</a>
					</li>
					<li id="notice">
						<a href="">공지사항</a>
					</li>
					<li>
						<a href="">게시판</a>
					</li>
				</ul>
			</nav>
		</header>
	</div>
<script>
 const enroll = ()=>{
	 location.assign("<%=request.getContextPath()%>/member/enrollmember.do");
 }
</script>





