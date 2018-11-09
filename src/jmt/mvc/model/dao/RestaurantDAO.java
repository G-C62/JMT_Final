package jmt.mvc.model.dao;

import java.sql.SQLException;
import java.util.List;

import org.eclipse.jdt.internal.compiler.ast.ThrowStatement;

import jmt.mvc.model.dto.RestaurantDTO;
import jmt.mvc.model.dto.ReviewDTO;

public interface RestaurantDAO {
	
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
	 * 호수 - 메인 검색바에서 음식점 검색할 때 자동완성기능
	 * */
	List<String> autoCompleteRestaurant(String keyWord) throws SQLException;

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
	List<String> selectImgFromReview (int resId) throws SQLException;


	
	
}
