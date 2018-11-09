package jmt.mvc.model.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jmt.mvc.model.dto.RestaurantDTO;
import jmt.mvc.model.dto.ReviewDTO;
import jmt.mvc.model.util.DbUtil;

public class RestaurantDAOImpl implements RestaurantDAO
{

	@Override
	public List<RestaurantDTO> selectAll() throws SQLException
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
			// 로드 연결 실행 닫기
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
	public List<RestaurantDTO> selectByCategory(String categroy) throws SQLException
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<RestaurantDTO> selectBySubCategory(String subCategroy) throws SQLException
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<RestaurantDTO> selectByName(String name) throws SQLException
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<RestaurantDTO> selectByDong(String dong) throws SQLException
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertBookMark(int resId, String memberId) throws SQLException
	{
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ReviewDTO> recentOrderReview(int resId) throws SQLException
	{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		List<ReviewDTO> list = new ArrayList<>();

		String sql = "select * from review where res_id=? order by review_id desc";

		try
		{
			// 로드 연결 실행 닫기
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);

			ps.setInt(1, resId);
			rs = ps.executeQuery();

			while (rs.next())
			{
				ReviewDTO dto = null;
				dto = new ReviewDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getInt(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
						rs.getString(11));

				boolean re = list.add(dto);
			}

		} finally
		{
			DbUtil.dbClose(rs, ps, con);
		}

		return list;
	}

	@Override

	public List<String> autoCompleteRestaurant(String keyWord) throws SQLException
	{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<String> list = new ArrayList<>();
		try
		{
			con = DbUtil.getConnection();
			ps = con.prepareStatement("SELECT RES_NAME FROM RESTAURANT WHERE RES_NAME like ?");
			ps.setString(1, keyWord + "%");
			rs = ps.executeQuery();
			while (rs.next())
			{
				list.add(rs.getString(1));
			}
		} finally
		{
			DbUtil.dbClose(rs, ps, con);
		}
		return list;
	}

	public List<ReviewDTO> recommendOrderReview(int resId) throws SQLException
	{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		List<ReviewDTO> list = new ArrayList<>();

		String sql = "";
		// String sql = "select * from review where res_id=? order by desc";

		try
		{
			// 로드 연결 실행 닫기
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);

			ps.setInt(1, resId);
			rs = ps.executeQuery();

			while (rs.next())
			{
				ReviewDTO dto = null;
				dto = new ReviewDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getInt(6), rs.getString(7), rs.getString(7), rs.getString(7), rs.getString(7),
						rs.getString(7));

				boolean re = list.add(dto);
			}

		} finally
		{
			DbUtil.dbClose(rs, ps, con);
		}

		return list;
	}

	@Override
	public int resLikeAcc(int resId) throws SQLException
	{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		int result = 0;

		String sql = "select review_islike from review where res_id=? and review_islike='true'";

		try
		{
			// 로드 연결 실행 닫기
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);

			ps.setInt(1, resId);
			rs = ps.executeQuery();

			while (rs.next())
			{
				result++;
			}

		} finally
		{
			DbUtil.dbClose(rs, ps, con);
		}

		return result;
	}

	@Override
	public List<String> selectImgFromReview(int resId) throws SQLException
	{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<String> list = new ArrayList<>();
		
		try
		{
			con = DbUtil.getConnection();
			ps = con.prepareStatement("select review_img1, review_img2, review_img3 from review where res_id=?");
			ps.setInt(1, resId);
			
			rs = ps.executeQuery();
			while (rs.next())
			{
				if(rs.getString(1) != null)
					list.add(rs.getString(1));
				if(rs.getString(2) != null)
					list.add(rs.getString(2));
				if(rs.getString(3) != null)
					list.add(rs.getString(3));
			}
		} finally
		{
			DbUtil.dbClose(rs, ps, con);
		}
		return list;
	}

}
