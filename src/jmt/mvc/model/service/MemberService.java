package jmt.mvc.model.service;

import java.sql.SQLException;

import java.util.List;

import jmt.mvc.model.dto.MemberDTO;

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
}
