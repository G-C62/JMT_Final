package jmt.mvc.model.dao;

import java.util.List;


import jmt.mvc.model.dto.MemberDTO;


public interface MemberDAO {

	
	/**
	 * �α���
	 * */
	List<MemberDTO>selectByInfo(String memberId, String memberPwd);
	
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
}
