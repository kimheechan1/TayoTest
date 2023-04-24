package com.henry.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//*********************************************
// 기사 가입인지 승객 가입인지 판별함
//*********************************************

@WebServlet("/SignUp")
public class SignupController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String identifier = request.getParameter("ident");

		HttpSession sesh = request.getSession();

		sesh.setAttribute("userCategory", identifier);
		
		response.setCharacterEncoding("utf-8");

		response.getWriter().write("universalSignup.jsp"); // ajax의 response에 줄거
	}

}
