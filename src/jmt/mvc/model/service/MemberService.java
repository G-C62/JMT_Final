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
	 * ��ȣ - throwsó�� �Ϸ�
	 * */
	int delete(String id) throws SQLException;
	
	/**
	 * ����(���)�ϱ�
	 * */
	int insert(MemberDTO memberDTO) throws SQLException;
	
	/**
	 * ��ȣ - ����Ҷ� �ʿ��� id�ߺ�üũ
	 * @return true�̸� �ߺ�, false�̸� �ߺ��ƴ�
	 * */
	boolean idCheck(String id) throws SQLException;
	
	/**
	 * ����
	 * */
	int update(MemberDTO memberDTO) throws SQLException;

	/**
	 * ��ȣ - ���̵�� ȸ������ �޾ƿ���
	 * */
	MemberDTO selectById(String id) throws SQLException;

	/**
	 * ��ȣ - ��й�ȣ üũ�ϱ� (ajax)
	 * */
	String PassCheckService(String id) throws SQLException;
}
