package com.henry.controller;

import java.io.BufferedReader;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.henry.testEntity.R_Info;
import com.henry.testEntity.UniversalDAO;

@WebServlet("/Crawl")
public class Crawler extends HttpServlet {

	public void init() throws ServletException{
		super.init();
		System.setProperty("file.encoding", "UTF-8");
	}
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(request.getInputStream(), "UTF-8"));
		
		Gson gson = new Gson();
		
		Map<String, Object> jsonMap = gson.fromJson(reader, Map.class);
		
	//	System.out.println(jsonMap);
	//	System.out.println(jsonMap.get("response"));
		Map<String, Object> resp = (Map<String, Object>) jsonMap.get("response");
	//	System.out.println(resp);
		Map<String, Object> body = (Map<String, Object>) resp.get("body");
	//	System.out.println(body);
		Map<String, Object> items = (Map<String, Object>) body.get("items");
	//	System.out.println(items);
		ArrayList<Object> item = (ArrayList<Object>) items.get("item");
	//	System.out.println(item.get(0));
		
		// PREREQ FOR INSERT
		response.setContentType("text/html;charset=UTF-8");
		UniversalDAO dao = new UniversalDAO();
//		PrintWriter out = response.getWriter();
		
//		System.out.println(item.get(1));
		int rowsInserted = 0;
		// ITERATING THROUGH THE ROUTE JSON ITEM
			for(int i = 0 ; i < item.size() ; i++) {
				
				// THE ELEMENT TO LOOP THROUGH
				Map<String, Object> prop = (Map<String, Object>) item.get(i);
				R_Info routeVO = new R_Info();
				routeVO.setRouteid(prop.get("routeid").toString());
				System.out.println(prop.get("routeid").toString() + " was inserted");
				routeVO.setRouteno(prop.get("routeno").toString());
				routeVO.setEndnodenm(prop.get("endnodenm").toString());
				routeVO.setStartnodenm(prop.get("startnodenm").toString());
			//	System.out.println(prop.get("endnodenm"));
				
				// INSERT
				rowsInserted += dao.crawlAndInsert(routeVO);
				System.out.println(rowsInserted + "row inserted.");
			//	out.print(result);
			}
		
		// FOR DEBUG TESTS ON 'forCrawling.jsp' PAGE
		// MAKE SURE TO TIDY UP THE RESPONSE IN THE AJAX PART UPON DELETION!!
		//	out.print(prop.get("endnodenm"));
	}

}
