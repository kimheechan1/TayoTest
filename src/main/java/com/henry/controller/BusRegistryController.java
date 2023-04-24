package com.henry.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.henry.testEntity.Bus;
import com.henry.testEntity.UniversalDAO;

@WebServlet("/BusRegister")
public class BusRegistryController extends HttpServlet {

	// 버스 고유번호 입력 핸들할 서블릿
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String b_id = req.getParameter("b_id");

		// 해당 번호의 버스 등록 여부 체크 (기사가 버스 로그인시켜줌 졸귀? 응 아님)
		Bus busVO = new Bus();
		busVO.setB_id(b_id);

		UniversalDAO dao = new UniversalDAO();

		Bus resultVO = dao.busCheck(busVO);

		HttpSession sesh = req.getSession();

		sesh.setAttribute("bus", resultVO);

		resp.sendRedirect("driverBusRegistryResult.jsp");

		// null 은 jsp에서 판단

	}

}
