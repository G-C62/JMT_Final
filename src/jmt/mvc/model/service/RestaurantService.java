package jmt.mvc.model.service;

import java.sql.SQLException;
import java.util.List;

import jmt.mvc.model.dto.RestaurantDTO;
import jmt.mvc.model.dto.ReviewDTO;

public interface RestaurantService
{
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
	List<String> selectImgFromReview(int resId) throws SQLException;

	/**
	 * ���� ���ƿ� �� ��������
	 * */
	int reviewLoveAmount(int reviewId) throws SQLException;

	
}
