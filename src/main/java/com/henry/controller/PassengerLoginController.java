package com.henry.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.henry.testEntity.Passenger;
import com.henry.testEntity.UniversalDAO;

@WebServlet("/PLogin")
public class PassengerLoginController extends HttpServlet {
	


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String p_id = request.getParameter("p_id");
		String p_pw = request.getParameter("p_pw");

		Passenger pVO = new Passenger();
		pVO.setP_id(p_id);
		pVO.setP_pw(p_pw);
		
		UniversalDAO dao = new UniversalDAO();
		Passenger resultVO = dao.pLogin(pVO);
		
		HttpSession sesh = request.getSession();
		sesh.setAttribute("whoLoggedIn", resultVO);
		
		response.sendRedirect("testSearch.jsp"); // 검색페이지
		
		
	
	}

}
