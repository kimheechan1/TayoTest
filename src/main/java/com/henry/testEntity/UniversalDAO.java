package com.henry.testEntity;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class UniversalDAO {

	private static SqlSessionFactory seshFac;

	static {
		try {

			String resource = "com/henry/testDbManager/config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			seshFac = new SqlSessionFactoryBuilder().build(inputStream);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("GET CONN FAILED!!!!!!!!!!!!!!!!!!!!!!");
		}
	}
	
	// 기사 로그인용
	public Driver login(Driver vo) {
		SqlSession sesh = null;
		Driver result = null;
		try {
			sesh = seshFac.openSession();
			result = sesh.selectOne("dLogin", vo);
		}finally {
			sesh.close();
		}
		return result;
	}
	
	// 버스 등록번호 조회용
	public Bus busCheck(Bus vo) {
		
		SqlSession sesh = null;
		Bus result = null;
		
		try {
			sesh = seshFac.openSession();
			result = sesh.selectOne("busCheck", vo);
		}finally {
			sesh.close();
		}
		
		return result;
	}

	// 승객 로그인
	public Passenger pLogin(Passenger pVO) {
		
		SqlSession sesh = null;
		Passenger result = null;
		
		try {
			
			sesh = seshFac.openSession();
			result = sesh.selectOne("pLogin", pVO);
			
		}finally {
			sesh.close();
		}
		
		return result;
	}
	
	// 정류장 찾기
	public List<B_Stop> search(B_Stop stop) {
		
		SqlSession sesh = null;
		List<B_Stop> result = null;
		
		try {
			
			sesh = seshFac.openSession();
			result = sesh.selectList("getStops", stop);
			
		}finally {
			sesh.close();
		}
		
		return result;
	}
	
	// 정류장 찾기 2 (양방향 조회)
	public List<B_Stop> search2(B_Stop node){
		
		List<B_Stop> resultList = null;
		SqlSession sesh = null;
		
		try {
			
			sesh = seshFac.openSession();
			resultList = sesh.selectList("getStops2", node);
			
		}finally {
			sesh.close();
		}
		
		return resultList;
	}
	
	// 노선 크롤링용 !
	public int crawlAndInsert(R_Info route) {
		
		SqlSession sesh = null;
		int result = 0;
		
		try {
			
			sesh = seshFac.openSession();
			result = sesh.insert("crawlAndInsert", route);
			sesh.commit();
		}finally {
			sesh.close();
		}
		
		return result;
	}

}
