package jmt.mvc.model.dao;

import java.sql.SQLException;
import java.util.List;

import jmt.mvc.model.dto.ReviewDTO;

public interface ReviewDAO {
	
	/**
	 * ���� �� ���� �˻� ���� ����
	 * */
	List<ReviewDTO> myReviewSelectAll();
	
	
	/**
	 * ���� �ۼ�
	 * */
	int reviewInsert(ReviewDTO reviewDTO) throws SQLException;
	
	/**
	 * ���� ����
	 * */
	int reivewUpdate(ReviewDTO reviewDTO) throws SQLException;
	
	/**
	 * ���� ����
	 * */
	int reviewDelete(int reviewID) throws SQLException;
	
	
	
}
