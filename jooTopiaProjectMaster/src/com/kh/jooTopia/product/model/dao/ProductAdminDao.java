package com.kh.jooTopia.product.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.jooTopia.board.model.vo.Attachment;
import com.kh.jooTopia.board.model.vo.PageInfo;
import com.kh.jooTopia.product.model.vo.Product;
import com.kh.jooTopia.product.model.vo.ProductregAdmin;

import static com.kh.jooTopia.common.JDBCTemplate.*;

public class ProductAdminDao {
	
	private Properties prop = new Properties();
	
	public ProductAdminDao() {
		String fileName = ProductAdminDao.class.getResource("/sql/product/productAdmin-query.properties").getPath();
		 
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int updateProduct(Connection con, Product p) {
		//미등록상품의 상품등록(내용수정)
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateProduct");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, p.getpName());
			pstmt.setInt(2, p.getpPrice());
			pstmt.setString(3, p.getpContent());
			pstmt.setInt(4, p.getcId());
			pstmt.setString(5, "판매미등록");
			pstmt.setInt(6, p.getpId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertAttachment(Connection con, ArrayList<Attachment> fileList) {
		//미등록상품의 상품등록(내용수정)시 사진 등록(대표, 상세)
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertAttachment");
		
		try {
			for(int i = 0; i < fileList.size(); i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, fileList.get(i).getOriginName());
				pstmt.setString(2, fileList.get(i).getChangeName());
				pstmt.setString(3, fileList.get(i).getFilePath());
				int level = 0;
				if(i == 0) level = 0;
				else level = 2;
				pstmt.setInt(4, level);
				pstmt.setInt(5, fileList.get(i).getpNo());
				
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<HashMap<String, Object>> selectAddList(Connection con, PageInfo pageInfo) {
		//상품등록 리스트 출력
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String,Object> hmap = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectAddList");
		
		int startRow = (pageInfo.getCurrentPage()-1)*pageInfo.getLimit()+1;
		int endRow = startRow + pageInfo.getLimit()-1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "미등록상품");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String,Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String,Object>();
				
				hmap.put("status", rset.getString("STATUS"));
				hmap.put("cGroup", rset.getString("CGROUP"));
				hmap.put("cName", rset.getString("NAME"));
				hmap.put("pId", rset.getInt("PID"));
				hmap.put("fId", rset.getInt("FID"));
				hmap.put("originName", rset.getString("ORIGIN_NAME"));
				hmap.put("changeName", rset.getString("CHANGE_NAME"));
				hmap.put("filePath", rset.getString("FILE_PATH"));
				hmap.put("pName", rset.getString("PNAME"));
				hmap.put("pPrice", rset.getInt("PPRICE"));
				
	            list.add(hmap);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public HashMap<String, Object> selectAddOne(Connection con, int pId) {
		//상품등록 수정 폼 조회
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		Product p = null;
		Attachment a = null;
		
		String query = prop.getProperty("selectAddOne");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pId);
			
			rset = pstmt.executeQuery();
			
			hmap = new HashMap<String, Object>();
			
			if(rset.next()) {
				hmap.put("cGroup", rset.getString("CGROUP"));
				hmap.put("cName", rset.getString("NAME"));
				hmap.put("pName", rset.getString("PNAME"));
				hmap.put("pId", rset.getInt("PID"));
				hmap.put("pcPrice", rset.getInt("PCPRICE"));
				hmap.put("pGrade", rset.getString("PGRADE"));
				hmap.put("pPrice", rset.getInt("PPRICE"));
				hmap.put("pContent", rset.getString("PCONTENT"));
				hmap.put("fId", rset.getInt("FID"));
				hmap.put("originName", rset.getString("ORIGIN_NAME"));
				hmap.put("changeName", rset.getString("CHANGE_NAME"));
				hmap.put("filePath", rset.getString("FILE_PATH"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return hmap;
	}

	public ArrayList<HashMap<String, Object>> selectList(Connection con, PageInfo pageInfo) {
		//상품등록 리스트 출력
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String,Object> hmap = null;
		ResultSet rset = null;
				
		String query = prop.getProperty("selectList");
		
		int startRow = (pageInfo.getCurrentPage()-1)*pageInfo.getLimit()+1;
		int endRow = startRow + pageInfo.getLimit()-1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "판매미등록");
			pstmt.setString(2, "판매중");
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			while(rset.next()) {
				hmap = new HashMap<String,Object>();
				
				hmap.put("status", rset.getString("STATUS"));
				hmap.put("cGroup", rset.getString("CGROUP"));
				hmap.put("cName", rset.getString("NAME"));
				hmap.put("pId", rset.getInt("PID"));
				hmap.put("fId", rset.getInt("FID"));
				hmap.put("originName", rset.getString("ORIGIN_NAME"));
				hmap.put("changeName", rset.getString("CHANGE_NAME"));
				hmap.put("filePath", rset.getString("FILE_PATH"));
				hmap.put("pName", rset.getString("PNAME"));
				hmap.put("pPrice", rset.getInt("PPRICE"));
				hmap.put("sale", rset.getInt("GRADESALES"));
				
				list.add(hmap);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<HashMap<String, Object>> selectDeleteList(Connection con, PageInfo pageInfo) {
		//삭제상품 리스트 출력
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String,Object> hmap = null;
		ResultSet rset = null;
				
		String query = prop.getProperty("selectDeleteList");
		
		int startRow = (pageInfo.getCurrentPage()-1)*pageInfo.getLimit()+1;
		int endRow = startRow + pageInfo.getLimit()-1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "삭제상품");
			pstmt.setString(2, "판매완료");
			pstmt.setString(3, "환불완료");
			pstmt.setInt(4, startRow);
			pstmt.setInt(5, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			while(rset.next()) {
				hmap = new HashMap<String,Object>();
				
				hmap.put("status", rset.getString("STATUS"));
				hmap.put("cGroup", rset.getString("CGROUP"));
				hmap.put("cName", rset.getString("NAME"));
				hmap.put("pId", rset.getInt("PID"));
				hmap.put("fId", rset.getInt("FID"));
				hmap.put("originName", rset.getString("ORIGIN_NAME"));
				hmap.put("changeName", rset.getString("CHANGE_NAME"));
				hmap.put("filePath", rset.getString("FILE_PATH"));
				hmap.put("pName", rset.getString("PNAME"));
				hmap.put("pPrice", rset.getInt("PPRICE"));
				hmap.put("sale", rset.getInt("GRADESALES"));
				
				list.add(hmap);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int addUpdateAttachment(Connection con, int fId) {
		//상품등록(UPDATE) 시 매입단계에 설정된 mainImg 레벨 조정
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("addUpdateAttachment");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, fId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public HashMap<String, Object> selectProOne(Connection con, int pId) {
		//상품상세의 상품정보 조회
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
				
		String query = prop.getProperty("selectProOne");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pId);
			rset = pstmt.executeQuery();
					
			hmap = new HashMap<String, Object>();
			
			while(rset.next()) {
				hmap.put("pName", rset.getString("PNAME"));
				hmap.put("pId", rset.getInt("PID"));
				hmap.put("status", rset.getString("STATUS"));
				hmap.put("cGroup", rset.getString("CGROUP"));
				hmap.put("cName", rset.getString("NAME"));
				hmap.put("pPrice", rset.getInt("PPRICE"));
				hmap.put("sale", rset.getInt("GRADESALES"));
				hmap.put("pContent", rset.getString("PCONTENT"));
				int salePrice = (int) hmap.get("pPrice") * (int) hmap.get("sale");
				hmap.put("salePrice", salePrice);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
			
		return hmap;
	}

	public ArrayList<Attachment> selectAttOne(Connection con, int pId) {
		//상품상세의 상품이미지들 조회
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Attachment> list = null;
		Attachment a = null;
		
		String query = prop.getProperty("selectAttOne");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pId);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Attachment>();
			while(rset.next()) {
				a = new Attachment();
				
				a.setfId(rset.getInt("FID"));
				a.setOriginName(rset.getString("ORIGIN_NAME"));
				a.setChangeName(rset.getString("CHANGE_NAME"));
				a.setFilePath(rset.getString("FILE_PATH"));
				a.setFileLevel(rset.getInt("FILE_LEVEL"));
				
				if(a.getFileLevel() == 0) {
					list.add(0, a);
				}else {
					list.add(1, a);
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		System.out.println("list 사이즈 : " + list.size());
		
		return list;
	}

	public int getProductListCount(Connection con, String query) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return listCount;
	}

	public int changeStatusProduct(Connection con, String status, int[] pId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("changeStatusProduct");
		
		try {
			pstmt = con.prepareStatement(query);
			
			for(int i = 0; i < pId.length; i++) {
				pstmt.setString(1, status);
				pstmt.setInt(2, pId[i]);
				
				result += pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Attachment selectAtt(Connection con, int fId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Attachment a = null;
		
		String query = prop.getProperty("selectAtt");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, fId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				a = new Attachment();
				//fId 추후 뺄 수도 있음
				a.setfId(fId);
				a.setOriginName(rset.getString("ORIGIN_NAME"));
				a.setChangeName(rset.getString("CHANGE_NAME"));
				a.setFilePath(rset.getString("FILE_PATH"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return a;
	}

	public ProductregAdmin selectOneAdminProductreg(Connection con, int num) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ProductregAdmin p = null;
		
		String query = prop.getProperty("selectOneProductregAdmin");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				p = new ProductregAdmin();
				
				p.setPcdId(rset.getInt("PCDID"));
				p.setBrand(rset.getString("BRAND"));
				p.setcGroup(rset.getString("CGROUP"));
				p.setName(rset.getString("NAME"));
				p.setModel(rset.getString("MODEL"));
				p.setuPeriod(rset.getString("USE_PERIOD"));
				p.setpCost(rset.getInt("PRIME_COST"));
				p.sethCost(rset.getInt("HOPE_COST"));
				p.setMemo(rset.getString("MEMO"));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return p;
	}

	public int updateCount(Connection con, int pcdId) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int insertAdminProductreg(Connection con, Product p) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertAdminProductreg");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, p.getpName());
			pstmt.setInt(2, p.getpPrice());
			pstmt.setString(3, p.getpContent());
			pstmt.setString(4, p.getpGrade());
			pstmt.setString(5, p.getpBrand());
			pstmt.setString(6, p.getpModelName());
			pstmt.setInt(7, p.getcId());
			pstmt.setInt(8, p.getPcDId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			close(pstmt);
		}
		
		
		
		
		return result;
	}
}
