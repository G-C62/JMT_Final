package jmt.mvc.model.service;

import java.sql.SQLException;

import java.util.List;

import jmt.mvc.model.dao.MemberDAO;
import jmt.mvc.model.dao.MemberDAOImpl;
import jmt.mvc.model.dao.RestaurantDAO;
import jmt.mvc.model.dao.RestaurantDAOImpl;
import jmt.mvc.model.dao.ReviewDAO;
import jmt.mvc.model.dao.ReviewDAOImpl;
import jmt.mvc.model.dto.RestaurantDTO;
import jmt.mvc.model.dto.ReviewDTO;

public class RestaurantServiceImpl implements RestaurantService {
	MemberDAO memberDAO = new MemberDAOImpl();
	RestaurantDAO restaurantDAO = new RestaurantDAOImpl();
	ReviewDAO reviewDAO = new ReviewDAOImpl();
	@Override
	public List<RestaurantDTO> selectAll() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public RestaurantDTO selectById(int resId) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<RestaurantDTO> selectByCategory(String categroy) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<RestaurantDTO> selectBySubCategory(String subCategroy) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<RestaurantDTO> selectByName(String name) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<RestaurantDTO> selectByDong(String dong) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertBookMark(int resId, String memberId) throws SQLException {
		int result = restaurantDAO.insertBookMark(resId, memberId);
		if(result == 0)
			throw new SQLException("즐겨찾기 등록에 실패하였습니다.");
		
		return result;
	}

	@Override
	public int deleteBookMark(int resId, String memberId) throws SQLException {
		int result = restaurantDAO.deleteBookMark(resId, memberId);
		if(result == 0)
			throw new SQLException("즐겨찾기 해제에 실패하였습니다.");
		
		return result;
	}

	@Override
	public boolean bookMarkYesOrNo(int resId, String memberId) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<RestaurantDTO> autoCompleteRestaurant(String keyWord) throws SQLException {
		List<RestaurantDTO> list = restaurantDAO.autoCompleteRestaurant(keyWord);
		return list;
	}
	

	@Override
	public List<ReviewDTO> RestaurantFiveSelect(String category) throws SQLException {
		List<ReviewDTO> restaurantList = restaurantDAO.RestaurantFiveSelect(category);
		return restaurantList;
	}

	@Override
	public String getReviewImg(String restaurantsName) throws SQLException {
		String reviewImg = reviewDAO.getReviewImg(restaurantsName);
		return reviewImg;
	}
	
	@Override
	public List<ReviewDTO> RestaurantSelectAll(String category) throws SQLException {
		List<ReviewDTO> list = restaurantDAO.RestaurantSelectAll(category);
		return list;
	}

	public List<ReviewDTO> selectBookmarkById(String id) throws SQLException{
		List<String> list = restaurantDAO.selectBookmarkById(id);
		List<ReviewDTO> lists = restaurantDAO.selectReviewByResName(list);
		
		return lists;
	}

	@Override
	public List<ReviewDTO> likeOrderSelectAll(String category) throws SQLException {
		List<ReviewDTO> list = restaurantDAO.likeOrderSelectAll(category);
		return list;
	}

	@Override
	public List<ReviewDTO> restaurantNameOrderReview(String category) throws SQLException {
		List<ReviewDTO> list = restaurantDAO.restaurantNameOrderReview(category);
		return list;
	}
	
}
