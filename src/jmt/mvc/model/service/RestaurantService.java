package jmt.mvc.model.service;

import java.sql.SQLException;
import java.util.List;

import jmt.mvc.model.dto.RestaurantDTO;
import jmt.mvc.model.dto.ReviewDTO;

public interface RestaurantService {
	/**
	 * ��ü�˻�
	 * */
	List<RestaurantDTO>selectAll() throws SQLException;
	
	/**
	 * �󼼺���(by resId)
	 * */
	RestaurantDTO selectById(int resId) throws SQLException;
	
	/**
	 * ���ǰ˻�(by category)
	 * */
	List<RestaurantDTO>selectByCategory(String categroy) throws SQLException;
	
	/**
	 * ���ǰ˻�(by subCategory)
	 * */
	List<RestaurantDTO>selectBySubCategory(String subCategroy) throws SQLException;
	
	/**
	 * ���ǰ˻�(by name)
	 * */
	List<RestaurantDTO>selectByName(String name) throws SQLException;
	
	/**
	 * ���ǰ˻�(by dong)
	 * */
	List<RestaurantDTO>selectByDong(String dong) throws SQLException;
	
	
	/**
	 * ���ã�� ���
	 * */
	int insertBookMark(int resId, String memberId) throws SQLException;
	
	/**
	 * ���ã�� ����
	 * */
	int deleteBookMark(int resId, String memberId) throws SQLException;
	
	/**
	 * ���ã�� ����
	 * */
	boolean bookMarkYesOrNo (int resId, String memberId) throws SQLException;

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
	 * ȣ�� - ������ �̸����� �ش��ϴ� ������ ���� ��������
	 * */
	String getReviewImg(String restaurantsName) throws SQLException;

	/**
	 * ȣ�� - �������������� ������ ������ �� �ش� ī�װ� ������ �� ��������
	 * */
	List<ReviewDTO> RestaurantSelectAll(String category) throws SQLException;

	/**
	 * ȣ�� - ���� ���ã���� ������(�������̸�, ����) ��������
	 * */
	List<ReviewDTO> selectBookmarkById(String id) throws SQLException;

	/**
	 * ȣ�� - ���ƿ� ������ ������ �����ϱ� (����Ʈ�ڽ�) 
	 * */
	List<ReviewDTO> likeOrderSelectAll(String category) throws SQLException;

	/**
	 * ȣ�� - ������ ������ ������ �����ϱ� (����Ʈ�ڽ�) 
	 * */
	List<ReviewDTO> restaurantNameOrderReview(String category) throws SQLException;

	
}
