package jmt.mvc.model.service;

import java.sql.SQLException;
import java.util.List;

import jmt.mvc.model.dto.ReviewDTO;

public interface ReviewService {
	/**
	 * ���� �� ���� �˻� ���� ����
	 * */
	List<ReviewDTO> myReviewSelectAll(String id) throws SQLException;
	
	/**
	 * ���� ���ƿ� �� ��������
	 * */
	int reviewLikeAmount(int reviewId) throws SQLException;
	
	/**
	 * ���� �ۼ�
	 * */
	int reviewInsert(ReviewDTO reviewDTO) throws SQLException;
	
	/**
	 * ���� ����
	 * */
	int reivewUpdate(ReviewDTO reviewDTO) throws SQLException;
	
	/**
	 * ���� �ϳ� ��������
	 * */
	ReviewDTO selectByReviewId(int reviewId) throws SQLException;
	
	/**
	 * ���� ����
	 * */

	int reviewDelete(int reviewID) throws SQLException;
	
	

}
