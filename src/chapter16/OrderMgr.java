package chapter16;
import java.sql.*;
import java.util.Vector;;

public class OrderMgr {
	
	private DBConnectionMgr pool = null;
	
	public OrderMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
			System.out.println("order 연결 성공");
		}catch(Exception e) {
			System.out.println("커넥션가져오기실패");
		}
	}
	
	public Vector getOrderList() {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs= null;
		Vector vResult = new Vector();
		try {
			con = pool.getConnection();
			String query = "select * from shop_order order by no desc";
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			while(rs.next()) {
				OrderBean order = new OrderBean();
				order.setId(rs.getString("id"));
				order.setQuantity(rs.getInt("quantity"));
				order.setDate(rs.getString("Date"));
				order.setNo(rs.getString("no"));
				order.setState(rs.getString("state"));
				order.setProduct_no(rs.getString("product_no"));
				vResult.add(order);
			}
					
			
		}catch(Exception ex) {
			System.out.println("오더리스트오류"+ex);
		}finally {
			pool.freeConnection(con,stmt,rs);
		}
		return vResult;
	}
	
	public OrderBean getOrderDetail(String no) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		OrderBean order=null;
		
		try {
			con=pool.getConnection();
			String query = "select * from shop_order where no = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, no);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				order.setId(rs.getString("id"));
				order.setQuantity(rs.getInt("quantity"));
				order.setDate(rs.getString("date"));
				order.setNo(rs.getString("no"));
				order.setState(rs.getString("state"));
				order.setProduct_no(rs.getString("product_no"));
			}
		}catch(Exception e) {
			System.out.println("오더디테일오류"+e);
		}
		finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return order;
	}
	
	public boolean updateOrder(String no, String state) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean result=false;
		try {
			con = pool.getConnection();
			String query="update shop_order set state= ? where no = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, state);
			pstmt.setString(2, no);
			int count = pstmt.executeUpdate();
			if(count==1) result = true;
		}
		catch(Exception ex) {
			System.out.println("업데이트오더 오류"+ex);
		}finally {
			pool.freeConnection(con,pstmt);
		}
		return result;
	}
	
	public boolean deleteOrder(String no) throws SQLException{
		
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean result=false;
		try {
			con = pool.getConnection();
			String query="delete form shop_order where no = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, no);
			int count = pstmt.executeUpdate();
			if(count==1) result = true;
		}
		catch(Exception e) {
			System.out.println("딜리트오더 오류"+e);
		}finally {
			pool.freeConnection(con,pstmt);
		}
		return result;
		
	}
	
	
	public void insertOrder(OrderBean order) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = pool.getConnection();
			String query="insert into shop_order(id, product_no, quantity, date, state)"+" values(?, ?, ?, now(), ?)";
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, order.getId());
			pstmt.setString(2, order.getProduct_no());
			pstmt.setInt(3, order.getQuantity());
			pstmt.setString(4, "1");
			pstmt.executeUpdate();
		}catch(Exception ex) {
			System.out.println("insertorder에러"+ex);
			
			
		}finally {
			pool.freeConnection(con,pstmt);
		}
		
	}
	
	public Vector getOrder(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		Vector vResult = new Vector();
		try {
			con = pool.getConnection();
			String query = "select * from shop_order where id = ? order by no desc";
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
		
			while(rs.next()) {
				OrderBean order = new OrderBean();
				order.setId(rs.getString("id"));
				order.setQuantity(rs.getInt("quantity"));
				order.setDate(rs.getString("Date"));
				order.setNo(rs.getString("no"));
				order.setState(rs.getString("state"));
				order.setProduct_no(rs.getString("product_no"));
				vResult.add(order);
			}
		
	}catch(Exception ex) {
		System.out.println("겟오더오류"+ex);
	}finally {
		pool.freeConnection(con,pstmt,rs);
	}
	return vResult;
		}
	

}
