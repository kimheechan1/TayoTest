package com.henry.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.henry.testEntity.B_Stop;
import com.henry.testEntity.UniversalDAO;
// 정류장 4개 반환 (출발지 양방향, 도착지 양방향)
@WebServlet("/Search2")
public class Search2Controller extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse rsps) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		
		String dprtName = req.getParameter("dprtnm");
		String arrvName = req.getParameter("arrvnm");
		
		B_Stop dprtVO = new B_Stop();
		dprtVO.setNodenm(dprtName);
		B_Stop arrvVO = new B_Stop();
		arrvVO.setNodenm(arrvName);
		
		// 쿼리
		UniversalDAO dao = new UniversalDAO();
		List<B_Stop> resultDprtList = dao.search2(dprtVO);
		List<B_Stop> resultArrvList = dao.search2(arrvVO);
		
		List<String> finalList = new ArrayList<String>();
		for(int i = 0 ; i < resultDprtList.size(); i++) {
			finalList.add(resultDprtList.get(i).getNodeid());
		}
		for(int i = 0 ; i < resultArrvList.size(); i++){
			finalList.add(resultArrvList.get(i).getNodeid());
		}
		
	//	rsps.setContentType("application/json");
		
		PrintWriter out = rsps.getWriter();
		
		out.print(finalList);
		
		out.flush();
		
	}

}
