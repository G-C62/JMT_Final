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
	 * @throws SQLException 
	 * */
	int insertBookMark(int resId, String memberId) throws SQLException;
	
	/**
	 * 리뷰검색
	 * */
	ReviewDTO selectReview(int resId);

	/**
	 * 호수 - 메인 검색바에서 음식점 검색할 때 자동완성기능
	 * */
	List<RestaurantDTO> autoCompleteRestaurant(String keyWord) throws SQLException;

	/**
	 * 호수 - 메인페이지에 띄워줄 카테고리별 음식점 5곳 찾아오기
	 * @param category 
	 * */
	List<ReviewDTO> RestaurantFiveSelect(String category) throws SQLException;

	/**
	 * 호수 - 메인페이지에서 더보기 눌렀을 때 해당 카테고리 음식점 다 가져오기
	 * */
	List<ReviewDTO> RestaurantSelectAll(String category) throws SQLException;

	/**
	 * 호수 - 내가 즐겨찾기한 음식점(음식점이름, 사진) 가져오기
	 * */
	public List<String> selectBookmarkById(String id) throws SQLException;
	public List<ReviewDTO> selectReviewByResName(List<String> list) throws SQLException;

	/**
	 * 호수 - 좋아요 순으로 음식점 정렬하기 (셀렉트박스) 
	 * */
	List<ReviewDTO> likeOrderSelectAll(String category) throws SQLException;

	/**
	 * 호수 - 가나다 순으로 음식점 정렬하기 (셀렉트박스) 
	 * */
	List<ReviewDTO> restaurantNameOrderReview(String category) throws SQLException;

	
	int deleteBookMark(int resId, String memberId) throws SQLException;
	
}
