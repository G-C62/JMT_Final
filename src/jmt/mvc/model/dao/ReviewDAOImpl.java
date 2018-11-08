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
	
			    boolean res = list.add(dto);
			    System.out.println("���Գ�? " + res);
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
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int reviewDelete(int reviewID) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

}
