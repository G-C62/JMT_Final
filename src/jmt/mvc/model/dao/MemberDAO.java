package jmt.mvc.model.dao;

import java.sql.SQLException;

import java.util.List;


import jmt.mvc.model.dto.MemberDTO;
import jmt.mvc.model.dto.RestaurantDTO;
import jmt.mvc.model.dto.ReviewDTO;


public interface MemberDAO {

	
	/**
	 * �α��� 
	 * �ڼ�ȣ 
	 * - list->boolean���� ���� 
	 * - throwsó�� �Ϸ�
	 * */
	boolean selectByInfo(MemberDTO memberDTO) throws SQLException;
	//l
	
	/**
	 * �����ϱ�
	 * */
	int delete(String id);
	
	/**
	 * ����(���)�ϱ�
	 * - throwsó�� �Ϸ�
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
	public List<String> selectBookmarkById(String id) throws SQLException;
	public List<ReviewDTO> selectReviewByResName(List<String> list) throws SQLException;



}
