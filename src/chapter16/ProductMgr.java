package chapter16;
import com.oreilly.servlet.*;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import javax.servlet.http.HttpServletRequest;

import java.io.File;
import java.sql.*;
import java.util.Vector;

public class ProductMgr {
private DBConnectionMgr pool = null;
public ProductMgr() {
	try {
		pool = DBConnectionMgr .getInstance();		
	}catch (Exception e) {
		System.out.println("에러: 커넥션 가져오기 실패" );
	}
}

public boolean insertProduct(HttpServletRequest req) {
	
	Connection con = null;
	PreparedStatement pstmt=null;
	boolean result=false;
	
	try {
		String uploadDir="C:\\javabigdata2\\mywork_JSP\\chapter16\\WebContent\\data";
		MultipartRequest multi =
				new MultipartRequest(req, uploadDir, 5*1024*1024,"euc-kr",new DefaultFileRenamePolicy());

		con=pool.getConnection();
		String query= "insert into shop_product(name, price, detail, date, stock, image) " + "values(?, ?, ?, now(), ?, ?)";
		pstmt=con.prepareStatement(query);
		pstmt.setString(1, multi.getParameter("name"));
		pstmt.setString(2, multi.getParameter("price"));
		pstmt.setString(3, multi.getParameter("detail"));
		pstmt.setString(4, multi.getParameter("stock"));
		
		if(multi.getFilesystemName("image")==null) {
			pstmt.setString(5, "ready.gif");
		}else {
			pstmt.setString(5, multi.getFilesystemName("image"));
		}
		int count = pstmt.executeUpdate();
		if(count == 1) result = true;
	}catch(Exception ex) {
		System.out.println("insertProduct 오류"+ex);
	}
	finally {
		pool.freeConnection(con, pstmt);
	}
	return result;
}

public Vector getProductList() throws SQLException{
	Connection con=null;
	Statement stmt = null;
	ResultSet rs = null;
	Vector vProduct = new Vector();
	try {
		con = pool.getConnection();
		String sql = "select * from shop_product order by no desc";
		stmt=con.createStatement();
		rs=stmt.executeQuery(sql);
		while(rs.next()) {
		ProductBean product = new ProductBean();
		product.setNo(rs.getInt("no"));
		product.setName(rs.getString("name"));
		product.setPrice(rs.getString("price"));
		product.setDetail(rs.getString("detail"));
		product.setDate(rs.getString("date"));
		product.setStock(rs.getString("stock"));
		product.setImage(rs.getString("image"));
		vProduct.add(product);
		}
		
	}
	catch(Exception ex){
		System.out.println("ProductMgr.java getProductList에러"+ex);
	}finally {
		pool.freeConnection(con,stmt,rs);
	}
	
	return vProduct;
}

public ProductBean getProduct(String no) {
	Connection con= null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	ProductBean product = null;
	
	try {
		con = pool.getConnection();
		String query = "select * from shop_product where no=?";
		pstmt = con.prepareStatement(query);
		pstmt.setString(1, no);
		rs=pstmt.executeQuery();
		if(rs.next()) {
			product = new ProductBean();
			product.setNo(rs.getInt("no"));
			product.setName(rs.getString("name"));
			product.setPrice(rs.getString("price"));
			product.setDetail(rs.getString("detail"));
			product.setDate(rs.getString("date"));
			product.setStock(rs.getString("stock"));
			product.setImage(rs.getString("image"));
		}
	}
		catch(Exception ex) {
			System.out.println("getProduct오류"+ex);
		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return product;
	}
	

public boolean updateProduct(HttpServletRequest req) {
	

	Connection con = null;
	PreparedStatement pstmt=null;
	boolean result=false;
	String uploadDir="C:\\javabigdata2\\mywork_JSP\\chapter16\\WebContent\\data";
		try {
			con = pool.getConnection();
		
		MultipartRequest multi =
				new MultipartRequest(req, uploadDir, 5*1024*1024,"euc-kr",new DefaultFileRenamePolicy());
		
		if(multi.getFilesystemName("image")==null) {
	
			String query =  "update shop_product set name = ?, price = ?, detail = ?, stock = ? where no = ?";
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, multi.getParameter("name"));
			pstmt.setString(2, multi.getParameter("price"));
			pstmt.setString(3, multi.getParameter("detail"));
			pstmt.setString(4, multi.getParameter("stock"));
			pstmt.setString(5, multi.getParameter("no"));
		
			
		}else {
			
			
			deleteImage(multi.getParameter("no"));
			String query = "update shop_product set name = ?, price = ?, detail = ?, stock = ?, image = ? where no = ?";
		
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, multi.getParameter("name"));
			pstmt.setString(2, multi.getParameter("price"));
			pstmt.setString(3, multi.getParameter("detail"));
			pstmt.setString(4, multi.getParameter("stock"));
			pstmt.setString(5, multi.getFilesystemName("image"));
			pstmt.setString(6, multi.getParameter("no"));
			
		}
		int count = pstmt.executeUpdate();
		if(count == 1 ) result = true;
		
		}catch(Exception ex) {
			System.out.println("수정에러"+ex.toString());
		}
		finally {
			pool.freeConnection(con,pstmt);
		}
		return result;
		}



public boolean deleteProduct(String no) {
	Connection con = null;
	PreparedStatement pstmt=null;
	boolean result=false;
	
	try {
		con = pool.getConnection();
		String query = "delete from shop_product where no = ?";
		pstmt = con.prepareStatement(query);
		pstmt.setString(1, no);
		System.out.println("deleteProduct의 no"+no);

		int count = pstmt.executeUpdate();
		if(count==1) result=true;
		
		
	}catch(Exception ex){
		System.out.println("삭제오류"+ex);
		
	}
	finally {
		pool.freeConnection(con,pstmt);
	}
	return result;
}

public void deleteImage(String no) {
	Connection con = null;
	PreparedStatement pstmt=null;
	ResultSet rs = null;
	String uploadDir="C:\\javabigdata2\\mywork_JSP\\chapter16\\WebContent\\data";

	try {
		con = pool.getConnection();
		String query = "select image from shop_product where no=?";
		pstmt = con.prepareStatement(query);
		pstmt.setString(1, no);

		rs=pstmt.executeQuery();
		if(rs.next()) {			
	
			File f = new File(uploadDir+"\\"+rs.getString("image"));
			f.delete();
		}
	}
		catch(Exception ex) {
			System.out.println("delete이미지오류"+ex);
		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
	
}

public void reduceProduct(OrderBean order) {
	
	Connection con = null;
	PreparedStatement pstmt = null;
	try {
		con=pool.getConnection();
		String query="update shop_product set stock = (stock - ? ) where no = ? ";
		pstmt=con.prepareStatement(query);
		pstmt.setInt(1, order.getQuantity());
		pstmt.setString(2, order.getProduct_no());
		pstmt.executeUpdate();
		
		
	}catch(Exception ex) {
		System.out.println("reduce오류"+ex);
	}finally {
		pool.freeConnection(con,pstmt);
	}
	
	
}



}
