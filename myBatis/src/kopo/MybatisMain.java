package kopo;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kopo.dao.BoardDAO;


public class MybatisMain {
	
	public static void main(String[] args) {
		
		
//		String resource = "mybatis-config.xml";
//		
//		try {
//		InputStream inputStream = Resources.getResourceAsStream(resource);
//		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
//		SqlSession session = sqlSessionFactory.openSession();
//		System.out.println(sqlSessionFactory);
//		}catch (Exception e) {
//			// TODO: handle exception
//			e.printStackTrace();
//		}
//		
//	}
		
		BoardDAO dao = new BoardDAO();
		dao.work();
		
	}
		
}
