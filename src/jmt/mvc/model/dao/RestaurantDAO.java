package jmt.mvc.model.dao;

import java.sql.SQLException;
import java.util.List;


import jmt.mvc.model.dto.RestaurantDTO;
import jmt.mvc.model.dto.ReviewDTO;

public interface RestaurantDAO {
	
	/**
	 * ��ü�˻�
	 * */
	List<RestaurantDTO>selectAll();
	
	/**
	 * �󼼺���(by resId)
	 * */
	RestaurantDTO selectById(int resId);
	
	/**
	 * ���ǰ˻�(by category)
	 * */
	List<RestaurantDTO>selectByCategory(String categroy);
	
	/**
	 * ���ǰ˻�(by subCategory)
	 * */
	List<RestaurantDTO>selectBySubCategory(String subCategroy);
	
	/**
	 * ���ǰ˻�(by name)
	 * */
	List<RestaurantDTO>selectByName(String name);
	
	/**
	 * ���ǰ˻�(by dong)
	 * */
	List<RestaurantDTO>selectByDong(String dong);
	
	
	/**
	 * ���ã�� ���
	 * @throws SQLException 
	 * */
	int insertBookMark(int resId, String memberId) throws SQLException;
	
	/**
	 * ����˻�
	 * */
	ReviewDTO selectReview(int resId);

	/**
	 * ȣ�� - ���� �˻��ٿ��� ������ �˻��� �� �ڵ��ϼ����
	 * */
	List<RestaurantDTO> autoCompleteRestaurant(String keyWord) throws SQLException;

	/**
	 * ȣ�� - ������������ ����� ī�װ��� ������ 5�� ã�ƿ���
	 * @param category 
	 * */
	List<ReviewDTO> RestaurantFiveSelect(String category) throws SQLException;

	/**
	 * ȣ�� - �������������� ������ ������ �� �ش� ī�װ� ������ �� ��������
	 * */
	List<ReviewDTO> RestaurantSelectAll(String category) throws SQLException;

	/**
	 * ȣ�� - ���� ���ã���� ������(�������̸�, ����) ��������
	 * */
	public List<String> selectBookmarkById(String id) throws SQLException;
	public List<ReviewDTO> selectReviewByResName(List<String> list) throws SQLException;

	/**
	 * ȣ�� - ���ƿ� ������ ������ �����ϱ� (����Ʈ�ڽ�) 
	 * */
	List<ReviewDTO> likeOrderSelectAll(String category) throws SQLException;

	/**
	 * ȣ�� - ������ ������ ������ �����ϱ� (����Ʈ�ڽ�) 
	 * */
	List<ReviewDTO> restaurantNameOrderReview(String category) throws SQLException;

	
	int deleteBookMark(int resId, String memberId) throws SQLException;
	
}
