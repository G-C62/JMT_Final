package jmt.mvc.model.service;

import java.sql.SQLException;
import java.util.List;

import jmt.mvc.model.dto.RestaurantDTO;
import jmt.mvc.model.dto.ReviewDTO;

public interface RestaurantService {
	/**
	 * 전체검색
	 * */
	List<RestaurantDTO>selectAll() throws SQLException;
	
	/**
	 * 상세보기(by resId)
	 * */
	RestaurantDTO selectById(int resId) throws SQLException;
	
	/**
	 * 조건검색(by category)
	 * */
	List<RestaurantDTO>selectByCategory(String categroy) throws SQLException;
	
	/**
	 * 조건검색(by subCategory)
	 * */
	List<RestaurantDTO>selectBySubCategory(String subCategroy) throws SQLException;
	
	/**
	 * 조건검색(by name)
	 * */
	List<RestaurantDTO>selectByName(String name) throws SQLException;
	
	/**
	 * 조건검색(by dong)
	 * */
	List<RestaurantDTO>selectByDong(String dong) throws SQLException;
	
	
	/**
	 * 즐겨찾기 등록
	 * */
	int insertBookMark(int resId, String memberId) throws SQLException;
	
	/**
	 * 즐겨찾기 삭제
	 * */
	int deleteBookMark(int resId, String memberId) throws SQLException;
	
	/**
	 * 즐겨찾기 여부
	 * */
	boolean bookMarkYesOrNo (int resId, String memberId) throws SQLException;

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
	 * 호수 - 음식점 이름으로 해당하는 음식점 사진 가져오기
	 * */
	String getReviewImg(String restaurantsName) throws SQLException;

	/**
	 * 호수 - 메인페이지에서 더보기 눌렀을 때 해당 카테고리 음식점 다 가져오기
	 * */
	List<ReviewDTO> RestaurantSelectAll(String category) throws SQLException;

	/**
	 * 호수 - 내가 즐겨찾기한 음식점(음식점이름, 사진) 가져오기
	 * */
	List<ReviewDTO> selectBookmarkById(String id) throws SQLException;

	/**
	 * 호수 - 좋아요 순으로 음식점 정렬하기 (셀렉트박스) 
	 * */
	List<ReviewDTO> likeOrderSelectAll(String category) throws SQLException;

	/**
	 * 호수 - 가나다 순으로 음식점 정렬하기 (셀렉트박스) 
	 * */
	List<ReviewDTO> restaurantNameOrderReview(String category) throws SQLException;

	
}
