package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import data.dto.CartDto;
import data.dto.MyshopDto;
import mysql.db.DbConnect;

public class MyshopDao {

	DbConnect db = new DbConnect();
	
	// insert
	public void insertShop(MyshopDto dto)
	{
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "insert into myshop values (null,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCategory());
			pstmt.setString(2, dto.getSangpum());
			pstmt.setString(3, dto.getPhoto());
			pstmt.setInt(4, dto.getPrice());
			pstmt.setString(5, dto.getIpgoday());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	// (상품목록)전체데이터 가져오기
	public List<MyshopDto> getAllSangpums()
	{
		// ArrayList vs Vector??
		List<MyshopDto> list = new ArrayList<MyshopDto>();
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from myshop order by shopnum desc";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				MyshopDto dto = new MyshopDto();
				dto.setShopnum(rs.getString("shopnum"));
				dto.setSangpum(rs.getString("sangpum"));
				dto.setPhoto(rs.getString("photo"));
				dto.setCategory(rs.getString("category"));
				dto.setIpgoday(rs.getString("ipgoday"));
				dto.setPrice(rs.getInt("price"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return list;
	}
	
	// shopnum에 해당하는 하나의 데이터 가져오기
	public MyshopDto getData(String shopnum) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		MyshopDto dto = new MyshopDto();
		
		String sql = "select * from myshop where shopnum=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, shopnum);
			
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				dto.setShopnum(rs.getString("shopnum"));
				dto.setPhoto(rs.getString("photo"));
				dto.setCategory(rs.getString("category"));
				dto.setSangpum(rs.getString("sangpum"));
				dto.setPrice(rs.getInt("price"));
				dto.setIpgoday(rs.getString("ipgoday"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return dto;
	}

	// 장바구니 추가_insert into cart
	public void insertCart(CartDto dto) {
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "insert into cart values (null,?,?,?,now())";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(dto.getShopnum()));
			pstmt.setInt(2, Integer.parseInt(dto.getNum()));
			pstmt.setInt(3, dto.getCnt());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	
	}
	
	//조인_HaspMap...장바구니 출력
	//idx, 상품명, 상품번호, 사진, 가격, 수량, 카트에 담은 날짜(id)
	public List<HashMap<String, String>> getCartList(String id)
	{
		List<HashMap<String, String>> list = new ArrayList<HashMap<String,String>>();
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select c.idx, s.sangpum, s.shopnum, s.photo, s.price, c.cnt, c.cartday "
				+ "from cart c, myshop s, member m "
				+ "where c.shopnum=s.shopnum and c.num=m.num and m.id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("idx", rs.getString("idx"));
				map.put("sangpum", rs.getString("sangpum"));
				map.put("shopnum", rs.getString("shopnum"));
				map.put("photo", rs.getString("photo"));
				map.put("price", rs.getString("price"));
				map.put("cnt", rs.getString("cnt"));
				map.put("cartday", rs.getString("cartday"));
				
				list.add(map);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return list;
	}
	
	// 장바구니에 담긴 상품삭제
	public void deleteCart(String idx)
	{
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "delete from cart where idx=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, idx);
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
}
