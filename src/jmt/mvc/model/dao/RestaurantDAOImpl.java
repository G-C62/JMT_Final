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
	public int insertBookMark(int resId, String memberId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ReviewDTO selectReview(int resId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<String> autoCompleteRestaurant(String keyWord) throws SQLException {
		Connection con =null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<String> list = new ArrayList<>();
		try {
			con=DbUtil.getConnection();
			ps=con.prepareStatement("SELECT RES_NAME FROM RESTAURANT WHERE RES_NAME like ?");
			ps.setString(1, keyWord+"%");
			rs=ps.executeQuery();
			while(rs.next()) {
				list.add(rs.getString(1));
			}
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return list;
	}
}
