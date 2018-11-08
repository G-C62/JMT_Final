package jmt.mvc.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import jmt.mvc.model.dto.RestaurantDTO;
import jmt.mvc.model.dto.ReviewDTO;
import jmt.mvc.model.util.DbUtil;

public class RestaurantDAOImpl implements RestaurantDAO
{

	@Override
	public List<RestaurantDTO> selectAll()
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public RestaurantDTO selectById(int resId) throws SQLException
	{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		RestaurantDTO dto = null;

		String sql = "select * from restaurant where res_id=?";		
		
		try
		{
			//로드 연결 실행 닫기	
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, resId);		
			rs = ps.executeQuery();
			
			if (rs.next())
			{
				dto = new RestaurantDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), 
						rs.getDouble(10), rs.getDouble(11));
			}
			
		} finally 
		{
			DbUtil.dbClose(rs, ps, con);
		}
		
		return dto;
	}

	@Override
	public List<RestaurantDTO> selectByCategory(String categroy)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<RestaurantDTO> selectBySubCategory(String subCategroy)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<RestaurantDTO> selectByName(String name)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<RestaurantDTO> selectByDong(String dong)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertBookMark(int resId, String memberId)
	{
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ReviewDTO selectReview(int resId)
	{
		/*Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
	
		ReviewDTO dto = null;

		String sql = "select * from review where res_id=?";		
		
		try
		{
			//로드 연결 실행 닫기	
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, resId);		
			rs = ps.executeQuery();
			
			if (rs.next())
			{
				dto = new ReviewDTO(reviewId, reviewTitle, reviewContents, memberId, resId, resName); 
						
			}
			
		} finally 
		{
			DbUtil.dbClose(rs, ps, con);
		}*/
		
		return null;
	}

}
