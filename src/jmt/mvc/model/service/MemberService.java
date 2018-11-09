package jmt.mvc.model.service;

import java.sql.SQLException;


import java.util.List;
import jmt.mvc.model.dto.MemberDTO;
import jmt.mvc.model.dto.RestaurantDTO;
import jmt.mvc.model.dto.ReviewDTO;

public interface MemberService {
	/**
	 * �α���
	 * */
	boolean selectByInfo(MemberDTO memberDTO) throws SQLException;
	
	/**
	 * �����ϱ�
	 * */
	int delete(String id);
	
	/**
	 * ����(���)�ϱ�
	 * */
	int insert(MemberDTO memberDTO) throws SQLException;
	
	/**
	 * ����Ҷ� �ʿ��� id�ߺ�üũ
	 * @return true�̸� �ߺ�, false�̸� �ߺ��ƴ�
	 * */
	boolean idCheck(String id);
	
	/**
	 * ����
	 * */
	int update(MemberDTO memberDTO);
	
	/**
	 * ȣ�� - ���� ���ã���� ������(�������̸�, ����) ��������
	 * */
	List<ReviewDTO> selectBookmarkById(String id) throws SQLException;

	/**
	 * ȣ�� - ���� �˻��ٿ��� ������ �˻��� �� �ڵ��ϼ����
	 * */
	List<String> autoCompleteRestaurant(String keyWord) throws SQLException ;

}
