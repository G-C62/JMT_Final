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
