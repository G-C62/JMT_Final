package jmt.mvc.model.dao;

import java.sql.SQLException;
import java.util.List;

import jmt.mvc.model.dto.ReviewDTO;

public interface ReviewDAO {
	
	/**
	 * ���� �� ���� �˻� ���� ����
	 * @throws SQLException 
	 * */
	List<ReviewDTO> myReviewSelectAll(String id) throws SQLException;
	
	
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

	
	/**
	 * ȣ�� - ������ �̸����� �ش��ϴ� ������ ���� ��������
	 * */
	String getReviewImg(String restaurantsName) throws SQLException;
	
	
	
}
