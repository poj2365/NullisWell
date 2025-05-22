package com.niw.common.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.niw.common.CommonTemplate;
import com.oreilly.servlet.MultipartRequest;
import com.niw.common.MyFileRenamePolicy;

/**
 * Servlet implementation class AjaxFileuploadServlet
 */
@WebServlet("/fileupload")
public class FileuploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileuploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = getServletContext().getRealPath(CommonTemplate.BASIC_UPLOAD_PATH);
		MultipartRequest mr = new MultipartRequest(request, 
				path,1024*1024*100,"utf-8",new MyFileRenamePolicy());
		System.out.println(mr.getOriginalFileName("upfile"));
		System.out.println(mr.getFilesystemName("upfile"));
		
		Enumeration<String> names = mr.getFileNames();
		
		while(names.hasMoreElements()) {
			String name = names.nextElement();
			System.out.println(name);
			System.out.println(mr.getOriginalFileName(name));
			System.out.println(mr.getFilesystemName(name));
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
