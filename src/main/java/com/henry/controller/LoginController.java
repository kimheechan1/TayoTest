package com.henry.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.henry.testEntity.Driver;
import com.henry.testEntity.UniversalDAO;

@WebServlet("/Login")
public class LoginController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String d_id = req.getParameter("d_id");
		String d_pw = req.getParameter("d_pw");

		Driver vo = new Driver();

		vo.setD_id(d_id);
		vo.setD_pw(d_pw);

		UniversalDAO dao = new UniversalDAO();

		Driver resultVO = dao.login(vo);

		if (resultVO != null) {
			HttpSession sesh = req.getSession();

			sesh.setAttribute("driver", resultVO);
			
			resp.sendRedirect("driverLogging.jsp");
		}else {
			
		}

	}

}