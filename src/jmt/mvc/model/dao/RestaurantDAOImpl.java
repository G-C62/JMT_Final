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

public class RestaurantDAOImpl implements RestaurantDAO {

	@Override
	public List<RestaurantDTO> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public RestaurantDTO selectById(int resId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<RestaurantDTO> selectByCategory(String categroy) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<RestaurantDTO> selectBySubCategory(String subCategroy) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<RestaurantDTO> selectByName(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<RestaurantDTO> selectByDong(String dong) {
		// TODO Auto-generated method stub
		return null;
	}

	

	@Override
	public int insertBookMark(int resId, String memberId) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		int result = 0;
		String sql = "insert into BOOKMARK values(BOOKMARK_SEQ.NEXTVAL, ?, ?)";

		
		try
		{
			// 로드 연결 실행 닫기
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);

			ps.setString(1, memberId);
			ps.setInt(2, resId);
			rs = ps.executeQuery();

			if (rs.next())
			{
				result++;
			}

		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return result;
	}
	
	@Override
	public int deleteBookMark(int resId, String memberId) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		int result = 0;
		String sql = "delete from bookmark where member_id =? and res_id=? ";

		
		try
		{
			// 로드 연결 실행 닫기
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);

			ps.setString(1, memberId);
			ps.setInt(2, resId);
			rs = ps.executeQuery();

			if (rs.next())
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
	public ReviewDTO selectReview(int resId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<RestaurantDTO> autoCompleteRestaurant(String keyWord) throws SQLException {
		Connection con =null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<RestaurantDTO> list = new ArrayList<>();
		try {
			con=DbUtil.getConnection();
			ps=con.prepareStatement("SELECT * FROM RESTAURANT WHERE RES_NAME like ?");
			ps.setString(1, keyWord+"%");
			rs=ps.executeQuery();
			while(rs.next()) {//int resId, String resName, String resChainName, String resCategory, String resSubCategory,
				//String resDong, String resAddr, String resFloor, String resHo, double resLong, double resLat
				list.add(new RestaurantDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getDouble(10), rs.getDouble(11)));
			}
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return list;
	}

	@Override
	public List<ReviewDTO> RestaurantFiveSelect(String category) throws SQLException {
		Connection con =null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<ReviewDTO> list = new ArrayList<>();
		try {
			con=DbUtil.getConnection();
			
				ps=con.prepareStatement("select res_id, res_name, review_img1\n" + 
						"from\n" + 
						"(select RESTAURANT.RES_ID ,RESTAURANT.RES_NAME, REVIEW.REVIEW_IMG1\n" + 
						"from RESTAURANT LEFT join REVIEW on review.res_name = RESTAURANT.res_name\n" + 
						"WHERE RESTAURANT.RES_CATEGORY=? and review.review_islike='true'\n" + 
						"GROUP BY RESTAURANT.RES_ID, RESTAURANT.RES_NAME, REVIEW.REVIEW_IMG1\n" + 
						"ORDER BY count(*) desc)\n" + 
						"where rownum<=5");
				ps.setString(1, category);
				
				rs=ps.executeQuery();
				while(rs.next()) {
					list.add(new ReviewDTO(rs.getInt(1), rs.getString(2), rs.getString(3)));
				}
			
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		
		return list;
	}

	@Override
	public List<ReviewDTO> RestaurantSelectAll(String category) throws SQLException {
		Connection con =null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<ReviewDTO> list = new ArrayList<>();
		try {
			con=DbUtil.getConnection();
			ps=con.prepareStatement("select RESTAURANT.RES_ID, RESTAURANT.RES_NAME, REVIEW.REVIEW_IMG1\n" + 
					"from review RIGHT join RESTAURANT on review.res_name = RESTAURANT.res_name\n" + 
					"WHERE RESTAURANT.RES_CATEGORY like ?\n" + 
					"GROUP BY RESTAURANT.RES_ID, RESTAURANT.RES_NAME, REVIEW.REVIEW_IMG1");
			ps.setString(1, category+"%");
			rs=ps.executeQuery();
			while(rs.next()) {
				list.add(new ReviewDTO(rs.getInt(1), rs.getString(2), rs.getString(3)));
			}
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return list;
	}
	
	public List<String> selectBookmarkById(String id) throws SQLException {
		Connection con =null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<String> list = new ArrayList<>();
		try {
			con= DbUtil.getConnection();
			ps = con.prepareStatement("SELECT RES_ID FROM BOOKMARK WHERE MEMBER_ID=?");
			ps.setString(1, id);
			rs=ps.executeQuery();
			
			while(rs.next()) {
				System.out.println(rs.getInt(1));
				list.add(Integer.toString(rs.getInt(1)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return list;
	}
	

	@Override
	public List<ReviewDTO> selectReviewByResName(List<String> list) throws SQLException {
		Connection con =null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<ReviewDTO> lists=new ArrayList<>();
		
		try {
			con=DbUtil.getConnection();
			ps=con.prepareStatement("SELECT RES_ID, RES_NAME,REVIEW_IMG1 FROM REVIEW WHERE RES_ID=?");
			for(int i=0;i<list.size();i++) {
				ps.setInt(1, Integer.parseInt(list.get(i)));
				rs=ps.executeQuery();
				while(rs.next()) {
					lists.add(new ReviewDTO(rs.getInt(1), rs.getString(2), rs.getString(3)));
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return lists;
	}

	@Override
	public List<ReviewDTO> likeOrderSelectAll(String category) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<ReviewDTO> list = new ArrayList<>();
		try {
			con=DbUtil.getConnection();
			ps=con.prepareStatement("select REVIEW.RES_ID, REVIEW.RES_NAME, REVIEW.REVIEW_IMG1, count(*)\n" + 
					"from review join RESTAURANT on review.res_name = RESTAURANT.res_name\n" + 
					"WHERE RESTAURANT.RES_CATEGORY=? AND REVIEW.REVIEW_ISLIKE='true'\n" + 
					"GROUP BY REVIEW.RES_ID, REVIEW.RES_NAME, REVIEW.REVIEW_IMG1\n" + 
					"ORDER BY COUNT(*) DESC\n");
			ps.setString(1, category);
			rs=ps.executeQuery();
			while(rs.next()) {
				list.add(new ReviewDTO(rs.getInt(1), rs.getString(2), rs.getString(3)));
			}
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return list;
	}

	@Override
	public List<ReviewDTO> restaurantNameOrderReview(String category) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<ReviewDTO> list = new ArrayList<>();
		try {
			con=DbUtil.getConnection();
			ps=con.prepareStatement("select RESTAURANT.RES_ID, RESTAURANT.RES_NAME, REVIEW.REVIEW_IMG1\n" + 
					"from RESTAURANT LEFT join REVIEW on review.res_name = RESTAURANT.res_name\n" + 
					"WHERE RESTAURANT.RES_CATEGORY=?\n" + 
					"GROUP BY RESTAURANT.RES_ID, RESTAURANT.RES_NAME, REVIEW.REVIEW_IMG1\n" + 
					"ORDER BY RESTAURANT.RES_NAME ASC");
			ps.setString(1, category);
			rs=ps.executeQuery();
			while(rs.next()) {
				list.add(new ReviewDTO(rs.getInt(1), rs.getString(2), rs.getString(3)));
			}
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return list;
	}

	

}
