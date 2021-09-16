package com.global.turnin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class memcontentsDAO {

		private static memcontentsDAO dao = new memcontentsDAO(); //Dao 객체 생성
		private memcontentsDAO() {}
		public static memcontentsDAO getInstance() {
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
			public List<MemContents>selectAll(){ //회원 전체의 정보를 목록에 담아 반환
				List<MemContents>cList = new ArrayList<MemContents>();
				Connection conn = null;
				PreparedStatement pstmt = null;
				String sql = "select * from MemContents";
				ResultSet rs = null;
				MemContents mc = null;
				try {
					conn = getConnection();
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					
					while(rs.next()) { //가져올 행이 남아 있는 경우 참
					
					mc = new MemContents(sql);
					mc.setNum(rs.getInt("num"));
					mc.setCheckbox(rs.getString("checkbox"));
					mc.setContents(rs.getString("contents"));
					mc.setPicName(rs.getString("picname"));
					mc.setRegDate(rs.getString("regdate"));
					mc.setUserId(rs.getString("userId"));
					
					System.out.println();  //콘솔에 출력
					cList.add(mc);
					}
					
					this.close(conn, pstmt);
					
				}catch (Exception e) { 
					e.printStackTrace();
				}
				
				return cList;
			}
			
			public MemContents selectBoard(String userId) {
				
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = "select * from MemContents where userid=?";
				MemContents mc = null;
				
				try {
					conn = getConnection();
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, userId);
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						mc = new MemContents();
						mc.setNum(rs.getInt("num"));
						mc.setCheckbox(rs.getString("checkbox"));
						mc.setContents(rs.getString("contents"));
						mc.setPicName(rs.getString("picname"));
						mc.setRegDate(rs.getString("regdate"));
						mc.setUserId(rs.getString("userId"));
					}
					this.close(conn, pstmt, rs);
				}catch (Exception e) { 
					e.printStackTrace();
				} 
				return mc;
			}
			
			public int insert(MemContents mc) {
				Connection conn = null;
				PreparedStatement pstmt = null;
				String sql = "insert into memcontents(num, contents, regdate) values(mem_seq.nextval,?,sysdate)";
				int result = 0;
				
				try {
					conn = getConnection();
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, mc.getContents());
					result = pstmt.executeUpdate();
					
					this.close(conn, pstmt);
				}catch (Exception e) { 
					e.printStackTrace();
				}
				return result;
				
			}
			
			//게시글 수정
			public int update(MemContents mc) {
				Connection conn = null;
				PreparedStatement pstmt = null;
				String sql = "update MemContents set checkbox=?, picname=? where num = ?)";
				int result = 0;
				try {
					conn = getConnection();
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, mc.getCheckbox());
					pstmt.setString(2, mc.getPicName());
					pstmt.setInt(3, mc.getNum());
					result = pstmt.executeUpdate();
					
					this.close(conn, pstmt);
				}catch (Exception e) { 
					e.printStackTrace();
				} 
				return result;
			}
			
			
}
