package jmt.mvc.model.dao;

import java.sql.SQLException;




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
}
