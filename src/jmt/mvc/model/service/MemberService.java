<<<<<<< HEAD
package jmt.mvc.model.service;

import java.sql.SQLException;


import java.util.List;
import java.util.Map;

import jmt.mvc.model.dto.MemberDTO;
import jmt.mvc.model.dto.RestaurantDTO;
import jmt.mvc.model.dto.ReviewDTO;

public interface MemberService {
	/**
	 * �α���
	 * */
	List<MemberDTO>selectByInfo(String memberId, String memberPwd) throws SQLException;
	
	/**
	 * �����ϱ�
	 * */
	int delete(String id);
	
	/**
	 * ����(���)�ϱ�
	 * */
	int insert(MemberDTO memberDTO);
	
	/**
	 * ����Ҷ� �ʿ��� id�ߺ�üũ
	 * @return true�̸� �ߺ�, false�̸� �ߺ��ƴ�
	 * */
	boolean idCheck(String id);
	
	/**
	 * ����
	 * */
	int update(MemberDTO memberDTO);
	
	public List<ReviewDTO> selectBookmarkById(String id) throws SQLException;

	public List<RestaurantDTO> selectCategoryService(String category) throws SQLException;
}
=======
package jmt.mvc.model.service;

import java.sql.SQLException;

import jmt.mvc.model.dto.MemberDTO;

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
}
>>>>>>> 27d52d9471aba303e8c9fcc91d48783721cf3b60
