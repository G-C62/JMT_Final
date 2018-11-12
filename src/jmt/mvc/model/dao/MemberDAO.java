package jmt.mvc.model.dao;

import java.sql.SQLException;
import java.util.List;

import jmt.mvc.model.dto.MemberDTO;


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
	int delete(String id) throws SQLException;
	
	/**
	 * ����(���)�ϱ�
	 * - throwsó�� �Ϸ�
	 * */
	int insert(MemberDTO memberDTO) throws SQLException;
	
	/**
	 * ��ȣ - ����Ҷ� �ʿ��� id�ߺ�üũ
	 * @return true�̸� �ߺ�, false�̸� �ߺ��ƴ�
	 * */
	boolean idCheck(String id) throws SQLException;
	
	/**
	 * ȸ�� ���� ����
	 * �ڼ�ȣ
	 * - throwsó�� �Ϸ�
	 * */
	int update(MemberDTO memberDTO) throws SQLException;

	/**
	 * ��ȣ - ���̵�� ȸ������ �޾ƿ���
	 * */
	MemberDTO selectById(String id) throws SQLException;

	/**
	 * ��ȣ - ��й�ȣ üũ�ϱ� (ajax)
	 * */
	String PassCheckDAO(String id) throws SQLException;
}
