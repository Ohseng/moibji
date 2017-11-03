package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import common.DBManager;
import dto.MemberDTO;
import dto.ProductDTO;

public class MemberDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
	MemberDTO mDto;
	
	public ArrayList<MemberDTO> memSearch(String id) {
		try {
			conn = DBManager.getConnection();
			String sql = "SELECT * FROM shopmember "
						+ "WHERE shopid = ? ";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			
			while(rs.next()){
				String shopid = rs.getString("shopid");
				String shoppw = rs.getString("shoppw");
				String shopname = rs.getString("shopname");
				String shopzipcode = rs.getString("shopzipcode");
				String shopaddr1 = rs.getString("shopaddr1");
				String shopaddr2 = rs.getString("shopaddr2");
				String shopphone = rs.getString("shopphone");
				String shopemail = rs.getString("shopemail");
				
				
			    
				MemberDTO mDto = new MemberDTO(shopid, shoppw, shopname, shopzipcode, shopaddr1, shopaddr2, shopphone, shopemail);
				list.add(mDto);
			}
			
			for (MemberDTO memberDTO : list) {
				System.out.println("shopid =" + memberDTO.getShopid());
				System.out.println("shoppw =" + memberDTO.getShoppw());
				System.out.println("shopname =" + memberDTO.getShopname());
				System.out.println("shopzipcode =" + memberDTO.getShopzipcode());
				System.out.println("shopaddr1 =" + memberDTO.getShopaddr1());
				System.out.println("shopaddr2 =" + memberDTO.getShopaddr2());
				System.out.println("shopphone =" + memberDTO.getShopphone());
				System.out.println("shopemail =" + memberDTO.getShopemail());
				System.out.println("regdate =" + memberDTO.getRegdate());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return list;
	}
	
	public int memCkid(String ckid){
		int result = 0;
		try {
			conn = DBManager.getConnection();
			String sql = "SELECT * FROM shopmember "
					+ "WHERE shopid = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ckid);
			
			rs = pstmt.executeQuery();
			
			if(rs.next() == true) {
				result = 1;
			} else {
				result = 0;
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return result;
	}
	
	public List<MemberDTO> memUpdate(String id){
		try {
			conn = DBManager.getConnection();
			String sql = "UPDATE shopmember "
					+ "SET shoppw = ? , "
					+ "shopname = ? , "
					+ "shopzipcode = ? , "
					+ "shopaddr1 = ?, "
					+ "shopaddr2 = ?, "
					+ "shopphone = ? , "
					+ "shopemail = ? "
					+ "WHERE shopid = ? ";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, "shoppw");
			pstmt.setString(2, "shopname");
			pstmt.setString(3, "shopzipcode");
			pstmt.setString(4, "shopaddr1");
			pstmt.setString(5, "shopaddr2");
			pstmt.setString(6, "shopphone");
			pstmt.setString(7, "shopemail");
			pstmt.setString(8, "shopid");
		
			int result = pstmt.executeUpdate();
			
			if(result > 0){
				System.out.println("수정되었습니다.");
			} else {
				System.out.println("수정에 실패하였습니다.");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		return list;
	}
	
	public MemberDTO ckLogin(String id, String pw) {
		try {
			conn = DBManager.getConnection();
			String sql = "SELECT * FROM shopmember "
				     	+ "where shopid = ? and "
						+ "shoppw = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String shopid = rs.getString("shopid");
				String shoppw = rs.getString("shoppw");
				String shopname = rs.getString("shopname");
				String shopzipcode = rs.getString("shopzipcode");
				String shopaddr1 = rs.getString("shopaddr1");
				String shopaddr2 = rs.getString("shopaddr2");
				String shopphone = rs.getString("shopphone");
				String shopemail = rs.getString("shopemail");
				Date regdate = rs.getDate("regdate");
				
				mDto = new MemberDTO(shopid, shoppw, shopname, shopzipcode, shopaddr1, shopaddr2, shopphone, shopemail, regdate);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return mDto;
	}
	
	public void memInsert(MemberDTO mDto){
		try {
			conn = DBManager.getConnection();
			String sql = "INSERT INTO "
					+ "shopmember(shopid, shoppw, shopname, shopzipcode, shopaddr1, shopaddr2, shopphone, shopemail)" 
					+ "VALUES(?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, mDto.getShopid());
			pstmt.setString(2, mDto.getShoppw());
			pstmt.setString(3, mDto.getShopname());
			pstmt.setString(4, mDto.getShopzipcode());
			pstmt.setString(5, mDto.getShopaddr1());
			pstmt.setString(6, mDto.getShopaddr2());
			pstmt.setString(7, mDto.getShopphone());
			pstmt.setString(8, mDto.getShopemail());

			int result = pstmt.executeUpdate();
			
			if(result > 0) {
				System.out.println("등록에 성공하였습니다.");
			} else {
				System.out.println("등록에 실패하였습니다.");				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		
		
	}
}
