package jmt.mvc.model.dao;

import java.sql.SQLException;
import java.util.List;

import jmt.mvc.model.dto.ReviewDTO;

public interface ReviewDAO {
	
	/**
	 * ³»°¡ ¾´ ¸®ºä °Ë»ö
	 * */
	List<ReviewDTO> myReviewSelectAll();
	
	
	/**
	 * ¸®ºä ÀÛ¼º
	 * */
	int reviewInsert(ReviewDTO reviewDTO) throws SQLException;
	
	/**
	 * ¸®ºä ¼öÁ¤
	 * */
	int reivewUpdate(ReviewDTO reviewDTO) throws SQLException;
	
	/**
	 * ¸®ºä »èÁ¦
	 * */
	int reviewDelete(int reviewID) throws SQLException;
	
	
	
}
