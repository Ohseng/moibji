package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import common.DBManager;
import dto.ProductDTO;

public class ProductDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	List<ProductDTO> bestlist = new ArrayList<ProductDTO>();
	List<ProductDTO> newlist = new ArrayList<ProductDTO>();
	ArrayList<ProductDTO> detailBest = new ArrayList<ProductDTO>();
	ArrayList<ProductDTO> detailNew = new ArrayList<ProductDTO>();
	
	public List<ProductDTO> listNewProduct(){
		try {
			conn = DBManager.getConnection();
			String sql = "SELECT * FROM new_pro_view";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			newlist.clear();
			
			while(rs.next()){
				String p_code = rs.getString("p_code");
				String p_name = rs.getString("p_name");
				int p_price2 = rs.getInt("p_price2");
				String p_img = rs.getString("p_img");
					
				ProductDTO bPDto = new ProductDTO(p_code, p_name, p_price2, p_img);
				newlist.add(bPDto);
			}
					for (ProductDTO productDTO : newlist) {
						System.out.print("p_code = " + productDTO.getP_code());
						System.out.print("p_name = " + productDTO.getP_name());
						System.out.print("p_price2 = " + productDTO.getP_price2());
						System.out.println("p_img = " + productDTO.getP_img());
				}
			
			
					
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return newlist;
	}
	
	public List<ProductDTO> listBestProduct(){
		try {
			conn = DBManager.getConnection();
			String sql = "SELECT * FROM best_pro_view";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			bestlist.clear();
			
			while(rs.next()){
				String p_code = rs.getString("p_code");
				String p_name = rs.getString("p_name");
				int p_price2 = rs.getInt("p_price2");
				String p_img = rs.getString("p_img");
					
				ProductDTO pDto = new ProductDTO(p_code, p_name, p_price2, p_img);
				bestlist.add(pDto);
				
					/*for (ProductDTO productDTO : bestlist) {
						System.out.print("p_code = " + p_code);
						System.out.print("p_name = " + p_name);
						System.out.print("p_price2 = " + p_price2);
						System.out.println("p_img = " + p_img);
				}*/
			}
			
					
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return bestlist;
	}
	
	public ArrayList<ProductDTO> detailBest(String p_code){
		try {
			conn = DBManager.getConnection();
			String sql = "SELECT * FROM new_pro_view WHERE p_code = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p_code);
			
			rs = pstmt.executeQuery();
			
			
			detailBest.clear();
			
			
			while(rs.next()){
				p_code = rs.getString("p_code");
				String p_name = rs.getString("p_name");
				int p_price2 = rs.getInt("p_price2");
				String p_img = rs.getString("p_img");
					
				ProductDTO bPDto = new ProductDTO(p_code, p_name, p_price2, p_img);
				detailBest.add(bPDto);
				
				
			}
			
					
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return detailBest;
	}
	
	
	public ArrayList<ProductDTO> detailNew(String p_code){
		try {
			conn = DBManager.getConnection();
			String sql = "SELECT * FROM best_pro_view WHERE p_code = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p_code);
			
			rs = pstmt.executeQuery();
			
			
			detailNew.clear();
			
			
			while(rs.next()){
				p_code = rs.getString("p_code");
				String p_name = rs.getString("p_name");
				int p_price2 = rs.getInt("p_price2");
				String p_img = rs.getString("p_img");
					
				ProductDTO nPDto = new ProductDTO(p_code, p_name, p_price2, p_img);
				detailNew.add(nPDto);
				
				
			}
			
					
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return detailNew;
	}
}

