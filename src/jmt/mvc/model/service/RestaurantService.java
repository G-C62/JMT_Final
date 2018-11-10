package jmt.mvc.model.service;

import java.sql.SQLException;
import java.util.List;

import jmt.mvc.model.dto.RestaurantDTO;
import jmt.mvc.model.dto.ReviewDTO;

public interface RestaurantService
{
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
	 * 상세보기에서 리뷰보기 - 최신순
	 * */
	List<ReviewDTO> recentOrderReview(int resId) throws SQLException;
	
	/**
	 * 상세보기에서 리뷰보기 - 추천순
	 * */
	List<ReviewDTO> recommendOrderReview(int resId) throws SQLException;
	
	/**
	 * 상세보기에서 누적추천수 보기
	 * */
	int resLikeAcc (int resId) throws SQLException;

	/**
	 * 상세보기에서 음식점 사진들 보기
	 * */
	List<String> selectImgFromReview(int resId) throws SQLException;

	/**
	 * 리뷰 좋아요 수 가져오기
	 * */
	int reviewLoveAmount(int reviewId) throws SQLException;

	
}
