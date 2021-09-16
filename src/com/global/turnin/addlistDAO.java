package com.global.turnin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class addlistDAO {

	private static addlistDAO dao = new addlistDAO(); //Dao 객체 생성
	private addlistDAO() {}
	public static addlistDAO getInstance() {
		return dao;
	}

	public Connection getConnection() {
		Connection conn = null; //생성자
		try { //드라이버로딩 
			Class.forName("oracle.jdbc.driver.OracleDriver"); //접속할 DB정보 
			String url="jdbc:oracle:thin:@localhost:1521:xe";  //접속하고 Connection 객체의 참조값 얻어오기(DB 연동의 핵심 객체) 
			conn = DriverManager.getConnection(url, "scott", "tiger"); //getConnection(url, "계정아이디", "계정비번") 

		}catch (Exception e) { 
			e.printStackTrace();
			return null;
		}
		return conn; 
	} //메소드 


	//연결닫기
	public void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {

		try {
			conn.close();
			pstmt.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	//연결닫기
	public void close(Connection conn, PreparedStatement pstmt) {

		try {
			conn.close();
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//모든 멤버 조회
	public List<addlist>selectAll(){ //회원 전체의 정보를 목록에 담아 반환
		List<addlist>aList = new ArrayList<addlist>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "select * from addlist";
		ResultSet rs = null;
		addlist al = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while(rs.next()) { //가져올 행이 남아 있는 경우 참

				al = new addlist(sql);
				al.setNum(rs.getInt("num"));
				al.setUserId(rs.getString("userId"));
				al.setContents(rs.getString("contents"));
				al.setRegDate(rs.getString("regDate"));
				al.setCheckbox(rs.getString("checkbox"));
				al.setPicName(rs.getString("picName"));

				System.out.println();  //콘솔에 출력
				aList.add(al);
			}

			this.close(conn, pstmt);

		}catch (Exception e) { 
			e.printStackTrace();
		}

		return aList;
	}

	public addlist select(String userId) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select num,contents from addlist where userid=?";
		addlist al = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				al = new addlist();
				al.setNum(rs.getInt("num"));
				al.setContents(rs.getString("contents"));
				al.setUserId(rs.getString("userId"));
			}
			this.close(conn, pstmt, rs);
		}catch (Exception e) { 
			e.printStackTrace();
		} 
		return al;
	}
	public addlist selectDate(String userId, String regDate) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select contents, regDate, checkbox, picName from addlist where userid=? and regDate = ?";
		addlist al = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				al = new addlist();
				al.setContents(rs.getString("contents"));
				al.setCheckbox(rs.getString("checkbox"));
				al.setPicName(rs.getString("picName"));
				al.setUserId(rs.getString("userId"));
				al.setRegDate(rs.getString("regDate"));
			}
			this.close(conn, pstmt, rs);
		}catch (Exception e) { 
			e.printStackTrace();
		} 
		return al;
	}


}
