<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp" %>
	<section>
		<img src="<%=request.getContextPath()%>/resources/images/logo.png"
		width="80%" alt="천재it교육센터로고">
		<h1>FileUpload 테스트</h1>
        <form action="FileUploadTest" method="post" enctype="multipart/form-data">
            작성자<input type="text" name="fileWriter"><br>
            파일<input type="file" name="fileName"><br>
            파일설명<br/><textarea name="fileDescription" rows="5" cols="30"></textarea><br/><br/>
            <input type="submit" value="업로드">
        </form>
		
	</section>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>

