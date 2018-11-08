package jmt.mvc.model.dao;

import java.util.List;


import jmt.mvc.model.dto.RestaurantDTO;
import jmt.mvc.model.dto.ReviewDTO;

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

}
