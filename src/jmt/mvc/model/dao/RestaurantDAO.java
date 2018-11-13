package jmt.mvc.model.dao;

import java.sql.SQLException;


import java.util.List;

import jmt.mvc.model.dto.RestaurantDTO;
import jmt.mvc.model.dto.ReviewDTO;

public interface RestaurantDAO {
	
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
	 * �󼼺��⿡�� ���亸�� - �ֽż�
	 * */
	List<ReviewDTO> recentOrderReview(int resId) throws SQLException;
	
	/**
	 * �󼼺��⿡�� ���亸�� - ��õ��
	 * */
	List<ReviewDTO> recommendOrderReview(int resId) throws SQLException;
	
	/**
	 * �󼼺��⿡�� ������õ�� ����
	 * */
	int resLikeAcc (int resId) throws SQLException;
	
	/**
	 * �󼼺��⿡�� ������ ������ ����
	 * */
	List<String> selectImgFromReview (int resId) throws SQLException;

	/**
	 * ���� ���ƿ� �� ��������
	 * */
	int reviewLikeAmount(int reviewId) throws SQLException;

	/**
	 * ���� ���ƿ� �ϱ�
	 * */
	int insertRecommend(int reviewId, String memberId) throws SQLException;
	
	/**
	 * ���� ���ƿ� ���
	 * */
	int deleteRecommend(int reviewId, String memberId) throws SQLException;

	/**
	 * ���� ���ƿ� ����
	 * */
	boolean reviewLikeYesOrNo(int reviewId, String memberId) throws SQLException;
	
	/**
	 * ����id�� ���� �ϳ� ��������
	 * */
	ReviewDTO selectReviewById(int reviewId) throws SQLException;
	
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
	
	int deleteBookMark2(int resId, String memberId) throws SQLException;
}