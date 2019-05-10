package chapter16;
import java.sql.*;
import java.util.*;


public class MemberMgr {
	private DBConnectionMgr pool = null;

	public MemberMgr() {
		try {
			pool = DBConnectionMgr.getInstance();

		} catch (Exception e) {
			System.out.println("Error:Ŀ�ؼ� ������ ����");

		}
	}

	public boolean checkId(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean checkCon = false;
		try {
			con = pool.getConnection();
			String strQuery = "select id from member where id = ?";
			pstmt = con.prepareStatement(strQuery);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			checkCon=rs.next();
			
		} catch (Exception ex) {
			System.out.println(ex);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return checkCon;
	
	}
	
	public Vector zipcodeRead(String area3) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector vecList = new Vector();
		try {
			con = pool.getConnection();
			String strQuery = "select * from zipcode where area3 like'"+area3+"%'";
			pstmt = con.prepareStatement(strQuery);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ZipcodeBean tempZipcode = new ZipcodeBean();
				tempZipcode.setZipcode(rs.getString("zipcode"));
				tempZipcode.setArea1(rs.getString("area1"));
				tempZipcode.setArea2(rs.getString("area2"));
				tempZipcode.setArea3(rs.getString("area3"));
				tempZipcode.setArea4(rs.getString("area4"));
				vecList.addElement(tempZipcode);
				
			}
			
		} catch (Exception ex) {
			System.out.println(ex);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vecList;
		
	}
	
	public boolean memberInsert(RegisterBean regBean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			String strQuery = "insert into member values(?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(strQuery);
			pstmt.setString(1, regBean.getMem_id());
			pstmt.setString(2, regBean.getMem_passwd());
			pstmt.setString(3, regBean.getMem_name());
			pstmt.setString(4, regBean.getMem_num1());
			pstmt.setString(5, regBean.getMem_email());
			pstmt.setString(6, regBean.getMem_phone());
			pstmt.setString(7, regBean.getMem_zipcode());
			pstmt.setString(8, regBean.getMem_address());
			pstmt.setString(9, regBean.getMem_job());
			int count = pstmt.executeUpdate();
			
			if(count>0) {
				flag=true;
			}
			
		
		
			
		} catch (Exception ex) {
			System.out.println(ex);
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
		
	}
	
	
	
	public boolean loginCheck(String id, String passwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean loginCon = false;
		try {
			con = pool.getConnection();
			String strQuery = "select id, passwd from member where id =? and passwd =?";
			pstmt = con.prepareStatement(strQuery);
			pstmt.setString(1,id);
			pstmt.setString(2,passwd);
			rs=pstmt.executeQuery();
			loginCon=rs.next();
		} catch (Exception ex) {
			System.out.println(ex);
		} finally {
			pool.freeConnection(con, pstmt,rs);
		}
		return loginCon;
		
	}
	
	
	
	
	public Vector View(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector vecList = new Vector();
		RegisterBean tempRegister = new RegisterBean();
		
		try {
			con = pool.getConnection();
			String strQuery ="SELECT * FROM member WHERE id ='"+id+"'";
			pstmt = con.prepareStatement(strQuery);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				tempRegister.setMem_id(rs.getString("id"));
				tempRegister.setMem_passwd(rs.getString("passwd"));
				tempRegister.setMem_name(rs.getString("name"));
				tempRegister.setMem_num1(rs.getString("mem_num1"));
				tempRegister.setMem_email(rs.getString("e_mail"));
				tempRegister.setMem_phone(rs.getString("phone"));
				tempRegister.setMem_zipcode(rs.getString("zipcode"));
				tempRegister.setMem_address(rs.getString("address"));
				tempRegister.setMem_job(rs.getString("job"));
				vecList.addElement(tempRegister);
			}
		} catch (Exception ex) {
			System.out.println(ex);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vecList;
		
	}
	

}
