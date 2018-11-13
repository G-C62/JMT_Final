package jmt.mvc.model.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jmt.mvc.model.dto.ReviewDTO;
import jmt.mvc.model.util.DbUtil;



public class ReviewDAOImpl implements ReviewDAO {
	
	/*
	 * 
	private int reviewId;
	private String reviewTitle;
	private String reviewContents;
	private String memberId;
	private int resId;
	private String resName;*/
	
	@Override
	public List<ReviewDTO> myReviewSelectAll(String id) throws SQLException{
		Connection con = DbUtil.getConnection();
		PreparedStatement ps =null;
		ResultSet rs =null;
		List<ReviewDTO> list = new ArrayList<ReviewDTO>();
		try{
			con=DbUtil.getConnection();
			 ps = con.prepareStatement("select * from review where member_Id=?");
			 ps.setString(1, id);
			 
			 rs = ps.executeQuery();
			 while(rs.next()){
				 ReviewDTO dto = new ReviewDTO(
						
						 rs.getInt(1),
						 rs.getString(2),
						 rs.getString(3),
						 rs.getString(4),
						 rs.getString(5), 
						 rs.getInt(6),
						 rs.getString(7)
						 , rs.getString(8)
						 , rs.getString(9)
						 , rs.getString(10)
						 , rs.getString(11)  //reviewLike
						 
						);
	
			   list.add(dto);
			  
			 }
		}finally{
			DbUtil.dbClose(rs, ps, con);
		}
		return list;
	}
	
	@Override
	public int reviewLikeAmount(int reviewId) throws SQLException
	{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		int result = 0;

		String sql = "select * from recommend where review_id=?";

		try
		{
			// 로드 연결 실행 닫기
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);

			ps.setInt(1, reviewId);
			rs = ps.executeQuery();
			
			while(rs.next())
			{
				result++;
			}

		} finally
		{
			DbUtil.dbClose(ps, con);
		}

		return result;
	}
	
	
	@Override
	public ReviewDTO selectByReviewId(int reviewId) throws SQLException{
		 Connection con = DbUtil.getConnection();
			PreparedStatement ps =null;
			ResultSet rs =null;
			ReviewDTO reviewDTO =null;
			try{
				 ps = con.prepareStatement( "select * from review where review_id=?");
				 ps.setInt(1, reviewId);
				 rs = ps.executeQuery();
				 if(rs.next()){
					 reviewDTO =new ReviewDTO(rs.getInt(1), rs.getString(2), rs.getString(3), 
							 rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7), 
							 rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11));
				 }
			}finally{
				DbUtil.dbClose(rs, ps, con);
			}
			return reviewDTO;
	 }

	@Override
	public int reviewInsert(ReviewDTO reviewDTO) throws SQLException {
		/*Connection con =DbUtil.getConnection();
		PreparedStatement ps =null;
		int result =0;
		try{
			ps = con.prepareStatement("insert into Electronics values(?,?,?,?,?,sysdate,0,?,?)");
			ps.setString(1, electronics.getModelNum());
			ps.setString(2, electronics.getModelName());
			ps.setInt(3, electronics.getPrice());
			ps.setString(4, electronics.getDescription());
			ps.setString(5, electronics.getPassword());
			ps.setString(6, electronics.getfName());
			ps.setInt(7, electronics.getfSize());
			
			result = ps.executeUpdate();
		}finally{
			DbUtil.dbClose( ps, con);
		}
		return result;*/
		return 0 ;
	}

	@Override
	public int reivewUpdate(ReviewDTO reviewDTO) throws SQLException {
		
			Connection con =DbUtil.getConnection();
			PreparedStatement ps =null;
			int result =0;
			try{
				ps = con.prepareStatement("update review\r\n" + 
						"set review_Title=?,review_Contents=?,review_Img1=?,review_Img2=?,review_Img3=? \r\n" + 
						"where review_id=?");
				
				ps.setString(1, reviewDTO.getReviewTitle());
				ps.setString(2, reviewDTO.getReviewContents());
				ps.setString(3, reviewDTO.getReviewImg1());
				ps.setString(4, reviewDTO.getReviewImg2());
				ps.setString(5, reviewDTO.getReviewImg3());
				ps.setInt(6, reviewDTO.getReviewId());
				
				result = ps.executeUpdate();
				System.out.println("result = " + result);
			}finally{
				DbUtil.dbClose( ps, con);
			}
			return result;
	
	}

	@Override
	public int reviewDelete(int reviewId) throws SQLException {
		Connection con =DbUtil.getConnection();
		PreparedStatement ps =null;
		int result =0;
		try{
			ps = con.prepareStatement("delete from review where review_Id=?");
			ps.setInt(1, reviewId);
			result = ps.executeUpdate();
			
		}finally{
			DbUtil.dbClose( ps, con);
		}
		return result;
	}

	@Override
	public String getReviewImg(String restaurantsName) throws SQLException {
		Connection con = DbUtil.getConnection();
		PreparedStatement ps =null;
		ResultSet rs =null;
		String reviewImg = null;
		try {
			con=DbUtil.getConnection();
			ps=con.prepareStatement("SELECT REVIEW_IMG1 FROM REVIEW WHERE RES_NAME=?");
			ps.setString(1, restaurantsName);
			rs=ps.executeQuery();
			while(rs.next()) {
				reviewImg = rs.getString(1);
			}
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return reviewImg;
	}

}
