package jmt.mvc.model.dao;

import java.sql.SQLException;
import java.util.List;

import jmt.mvc.model.dto.ReviewDTO;

public interface ReviewDAO {
	
	/**
	 * 내가 쓴 리뷰 검색 지혜 수정
	 * @throws SQLException 
	 * */
	List<ReviewDTO> myReviewSelectAll(String id) throws SQLException;
	
	
	/**
	 * 리뷰 작성
	 * */
	int reviewInsert(ReviewDTO reviewDTO) throws SQLException;
	
	/**
	 * 리뷰 수정
	 * */
	int reivewUpdate(ReviewDTO reviewDTO) throws SQLException;
	
	/**
	 * 리뷰 삭제
	 * */
	int reviewDelete(int reviewID) throws SQLException;
	
	
	
}
