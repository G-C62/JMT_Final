package jmt.mvc.model.service;

import java.sql.SQLException;


import java.util.List;
import jmt.mvc.model.dao.MemberDAO;
import jmt.mvc.model.dao.MemberDAOImpl;
import jmt.mvc.model.dao.RestaurantDAO;
import jmt.mvc.model.dao.RestaurantDAOImpl;
import jmt.mvc.model.dao.ReviewDAO;
import jmt.mvc.model.dao.ReviewDAOImpl;
import jmt.mvc.model.dto.MemberDTO;
import jmt.mvc.model.dto.RestaurantDTO;
import jmt.mvc.model.dto.ReviewDTO;

public class MemberServiceImpl implements MemberService {

	MemberDAO memberDAO  = new MemberDAOImpl();
	RestaurantDAO resDao = new RestaurantDAOImpl();
	ReviewDAO reviewDAO = new ReviewDAOImpl();
	
	@Override
	public boolean selectByInfo(MemberDTO memberDTO) throws SQLException {
		boolean result = memberDAO.selectByInfo(memberDTO);
		if(!result) throw new SQLException("정보가 일치하지 않습니다.");
		return result;
	}

	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(MemberDTO memberDTO) throws SQLException {
		int result = memberDAO.insert(memberDTO);
		if (result == 0)
			throw new SQLException("등록되지 않았습니다.");
		return result;
	}

	@Override
	public boolean idCheck(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int update(MemberDTO memberDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<ReviewDTO> selectBookmarkById(String id) throws SQLException{
		List<String> list = memberDAO.selectBookmarkById(id);
		List<ReviewDTO> lists = memberDAO.selectReviewByResName(list);
		
		return lists;
	}

	
	@Override
	public List<String> autoCompleteRestaurant(String keyWord) throws SQLException {
		List<String> list = resDao.autoCompleteRestaurant(keyWord);
		return list;
	}
	
	@Override
	public List<ReviewDTO> RestaurantFiveSelect() throws SQLException {
		List<ReviewDTO> restaurantList = resDao.RestaurantFiveSelect();
		return restaurantList;
	}
	
	@Override
	public String getReviewImg(String restaurantsName) throws SQLException {
		String reviewImg = reviewDAO.getReviewImg(restaurantsName);
		return reviewImg;
	}
}
