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
						 , rs.getString(11)
						 
						);
	
			   list.add(dto);
			  
			 }
		}finally{
			DbUtil.dbClose(rs, ps, con);
		}
		return list;
	}

	@Override
	public int reviewInsert(ReviewDTO reviewDTO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int reivewUpdate(ReviewDTO reviewDTO) throws SQLException {
		
		/*	Connection con =DbUtil.getConnection();
			PreparedStatement ps =null;
			int result =0;
			try{
				ps = con.prepareStatement("update ReviewDTO set model_name=?,price=?,description=? where model_num=? and password=?");
				
				ps.setString(1, reviewDTO.getResName());
				ps.setInt(2, reviewDTO.getMemberId());
				ps.setString(3, reviewDTO.getReviewTitle());
				ps.setString(4, reviewDTO.getReviewContents());
				ps.setString(5, reviewDTO.);
				
				result = ps.executeUpdate();
			}finally{
				DbUtil.dbClose( ps, con);
			}
			return result;*/
		return 0;
	
	}

	@Override
	public int reviewDelete(int reviewID) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
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
