package jmt.mvc.model.dao;

import java.sql.SQLException;
import java.util.List;

import org.eclipse.jdt.internal.compiler.ast.ThrowStatement;

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
	 * ȣ�� - ���� �˻��ٿ��� ������ �˻��� �� �ڵ��ϼ����
	 * */
	List<String> autoCompleteRestaurant(String keyWord) throws SQLException;

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
	 * ���ο� ���� �ۼ�
	 * */
	int reivewInsert(ReviewDTO reviewDTO) throws SQLException;
	
	
}
