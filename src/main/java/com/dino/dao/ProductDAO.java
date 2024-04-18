package com.dino.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.dino.dto.ProductVO;
import util.DBManager;

public class ProductDAO {
	public ProductDAO() {
	}

	private static ProductDAO instance = new ProductDAO();

	public static ProductDAO getInstance() {
		return instance;

	}

	// Read
	public List<ProductVO> selectAllProducts() {
		// 최근 등록한 상품 먼저 출력하기
		String sql = "select * from product order by code desc";
		List<ProductVO> list = new ArrayList<ProductVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) { // 이동은 행(로우) 단위로
				ProductVO pVo = new ProductVO();
				pVo.setCode(rs.getInt("code"));
				pVo.setimgUrl(rs.getString("imgUrl"));
				pVo.setname(rs.getString("name"));
				pVo.setintro(rs.getString("intro"));
				pVo.setsaleLogo(rs.getString("saleLogo"));
				pVo.setoriginalPrice(rs.getInt("originalPrice"));
				pVo.setdiscountRate(rs.getString("discountRate"));
				pVo.setrealPrice(rs.getInt("realPrice"));
				
				list.add(pVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return list;
	}

	// 상품등록
	// Create

	public void insertProduct(ProductVO pVo) {
		String sql = "insert into product (imgUrl, name, intro, saleLogo, originalPrice, discountRate, realPrice) values(?,?,?,?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pVo.getimgUrl());
			pstmt.setString(2, pVo.getname());
			pstmt.setString(3, pVo.getintro());
			pstmt.setString(4, pVo.getsaleLogo());
			pstmt.setInt(5, pVo.getoriginalPrice());
			pstmt.setString(6, pVo.getdiscountRate());
			pstmt.setInt(7, pVo.getrealPrice());
			
			pstmt.executeUpdate(); // 실행
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}

	// Read
	public ProductVO selectProductByCode(String code) {
		//해당 코드의 상품만 가져오기
		String sql = "select * from product where code=?";
		ProductVO pVo = null;

		try {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, code);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					pVo = new ProductVO();
					pVo.setCode(rs.getInt("code"));
					pVo.setimgUrl(rs.getString("imgUrl"));
					pVo.setname(rs.getString("name"));
					pVo.setintro(rs.getString("intro"));
					pVo.setsaleLogo(rs.getString("saleLogo"));
					pVo.setoriginalPrice(rs.getInt("originalPrice"));
					pVo.setdiscountRate(rs.getString("discountRate"));
					pVo.setrealPrice(rs.getInt("realPrice"));

				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt, rs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pVo;
	}
	
	// Read
	public List<ProductVO> selectProductsByName(String name) {
	    // 해당 이름의 상품들만 가져오기
	    String sql = "SELECT * FROM product WHERE name = ?";
	    List<ProductVO> productList = new ArrayList<>();
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    try {
	        conn = DBManager.getConnection();
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, name);
	        rs = pstmt.executeQuery();
	        while (rs.next()) {
	            ProductVO pVo = new ProductVO();
	            pVo.setCode(rs.getInt("code"));
	            pVo.setimgUrl(rs.getString("imgUrl"));
	            pVo.setname(rs.getString("name"));
	            pVo.setintro(rs.getString("intro"));
	            pVo.setsaleLogo(rs.getString("saleLogo"));
	            pVo.setoriginalPrice(rs.getInt("originalPrice"));
	            pVo.setdiscountRate(rs.getString("discountRate"));
	            pVo.setrealPrice(rs.getInt("realPrice"));
	            productList.add(pVo);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        DBManager.close(conn, pstmt, rs);
	    }
	    return productList;
	}


	// update
	public void updateProduct(ProductVO pVo) {
		String sql = "UPDATE product SET name=?, intro=?, originalPrice=?, discountRate=?, realPrice=?, imgurl=? WHERE code=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pVo.getname());
			pstmt.setString(2, pVo.getintro());
			pstmt.setInt(3, pVo.getoriginalPrice());
			pstmt.setString(4, pVo.getdiscountRate());			
			pstmt.setInt(5, pVo.getrealPrice());
			pstmt.setString(6, pVo.getimgUrl());
			pstmt.setInt(7, pVo.getCode());
			pstmt.executeUpdate(); // 쿼리문 실행

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			DBManager.close(conn, pstmt);
		}
	}

	// delete
	public void deleteProduct(String code) {
		String sql = "DELETE FROM product WHERE code=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, code);
			pstmt.executeUpdate();// 쿼리문 실행
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}

}
