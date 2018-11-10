package jmt.mvc.model.dao;

import java.sql.SQLException;
import java.util.List;


import jmt.mvc.model.dto.RestaurantDTO;
import jmt.mvc.model.dto.ReviewDTO;

public interface RestaurantDAO {
	
	/**
	 * 전체검색
	 * */
	List<RestaurantDTO>selectAll();
	
	/**
	 * 상세보기(by resId)
	 * */
	RestaurantDTO selectById(int resId);
	
	/**
	 * 조건검색(by category)
	 * */
	List<RestaurantDTO>selectByCategory(String categroy);
	
	/**
	 * 조건검색(by subCategory)
	 * */
	List<RestaurantDTO>selectBySubCategory(String subCategroy);
	
	/**
	 * 조건검색(by name)
	 * */
	List<RestaurantDTO>selectByName(String name);
	
	/**
	 * 조건검색(by dong)
	 * */
	List<RestaurantDTO>selectByDong(String dong);
	
	
	/**
	 * 즐겨찾기 등록
	 * */
	int insertBookMark(int resId, String memberId);
	
	/**
	 * 리뷰검색
	 * */
	ReviewDTO selectReview(int resId);

	/**
	 * 호수 - 메인 검색바에서 음식점 검색할 때 자동완성기능
	 * */
	List<String> autoCompleteRestaurant(String keyWord) throws SQLException;

	/**
	 * 호수 - 메인페이지에 띄워줄 카테고리별 음식점 5곳 찾아오기
	 * */
	List<ReviewDTO> RestaurantFiveSelect() throws SQLException;
	
	
}
