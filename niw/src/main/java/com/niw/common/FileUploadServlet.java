package com.niw.common;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(
        name = "FileUploadTest",
        urlPatterns = {"/FileUploadTest"}
)
@MultipartConfig(
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 50
)
public class FileUploadServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        // 파일 작성자
        String fileWriter = req.getParameter("fileWriter");
        // 파일 설명
        String fileDescription = req.getParameter("fileDescription");
        // 파일 이름
        Part part = req.getPart("fileName");
        String fileName = getFilename(part);
        if (!fileName.isEmpty()) {
            part.write("C:\\filetest\\"+fileName);
        }


        // 응답 작성
        resp.setContentType("text/html;charset=UTF-8");
        PrintWriter writer = resp.getWriter();

        writer.print("작성자: " + fileWriter + "<br>");
        writer.print("파일명:<a href='FileDownloadTest?fileName=" + fileName + "'> " + fileName + "</a href><br>"); 
        writer.print("파일설명: "+ fileDescription + "<br>"); // 다운로드 추가
        writer.print("파일크기: " + part.getSize() + " bytes" + "<br>");
    }

    private String getFilename(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] split = contentDisp.split(";");
        for (int i = 0; i < split.length; i++) {
            String temp = split[i];
            if (temp.trim().startsWith("filename")) {
                return temp.substring(temp.indexOf("=") + 2, temp.length() - 1);
            }
        }
        return "";
    }
}

