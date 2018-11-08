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
	RestaurantDTO selectById(int resId) throws SQLException;
	
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
	 * */
	int insertBookMark(int resId, String memberId);
	
	/**
	 * ����˻�
	 * */
	ReviewDTO selectReview(int resId);
	
	
}
