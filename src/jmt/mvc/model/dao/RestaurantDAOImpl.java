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

		} finally
		{
			DbUtil.dbClose(rs, ps, con);
		}

		return result;
	}
	
	@Override
	public int deleteBookMark(int resId, String memberId) throws SQLException
	{
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
	public boolean bookMarkYesOrNo (int resId, String memberId) throws SQLException
	{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		boolean result = false;
		
		String sql = "select * from bookmark where res_id=? and member_id =?";

		try
		{
			// 로드 연결 실행 닫기
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);

		
			ps.setInt(1, resId);
			ps.setString(2, memberId);
			rs = ps.executeQuery();

			if (rs.next())
			{
				result = true;
			}

		} finally
		{
			DbUtil.dbClose(rs, ps, con);
		}

		return result;
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
	public List<ReviewDTO> recommendOrderReview(int resId) throws SQLException
	{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		List<ReviewDTO> list = new ArrayList<>();

		String sql = "select review.review_id, count(*)\r\n" + 
					"from recommend join review on review.review_id = recommend.review_id\r\n" + 
					"where review.res_id=?\r\n" + 
					"group by review.review_id\r\n" + 
					"order by count(*) desc";

		try
		{
			// 로드 연결 실행 닫기
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);

			ps.setInt(1, resId);
			rs = ps.executeQuery();

			while (rs.next())
			{
				int reviewId = rs.getInt(1);
				ReviewDTO dto = null;
				
				dto = selectReviewById(reviewId);
				
				list.add(dto);
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

	@Override
	public int reviewLikeAmount(int reviewId) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertRecommend(int reviewId, String memberId) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteRecommend(int reviewId, String memberId) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean reviewLikeYesOrNo(int reviewId, String memberId) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public ReviewDTO selectReviewById(int reviewId) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteBookMark2(int resId, String memberId) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
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


	@Override
	public int reivewInsert(ReviewDTO reviewDTO) throws SQLException
	{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		int result = 0;
		String sql = "insert into review values (REVIEW_SEQ.NEXTVAL,?, ?, sysdate, ?, ?, ?, ?, ?, ?, ?)";
		
		try
		{
			// 로드 연결 실행 닫기
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);

			ps.setString(1, reviewDTO.getReviewTitle());
			ps.setString(2, reviewDTO.getReviewContents());
			ps.setString(3, reviewDTO.getMemberId());
			ps.setInt(4,reviewDTO.getResId());
			ps.setString(5, reviewDTO.getResName());
			ps.setString(6, reviewDTO.getReviewImg1());
			ps.setString(7, reviewDTO.getReviewImg2());
			ps.setString(8, reviewDTO.getReviewImg3());
			ps.setString(9, reviewDTO.getReviewIsLike());
			
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

}
