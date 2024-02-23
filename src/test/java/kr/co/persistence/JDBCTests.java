package kr.co.persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTests {
	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@Test
	public void testConnection() {
		try {
			Connection conn = DriverManager.getConnection("jdbc:mysql://springboot-database.cfqgkq8864m8.ap-northeast-2.rds.amazonaws.com/commu_db?characterEncoding=utf-8","admin","1q2w3e!!");
			log.info(conn);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
