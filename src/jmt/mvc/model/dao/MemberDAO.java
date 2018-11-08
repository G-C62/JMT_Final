package jmt.mvc.model.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

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
	
	public int[] selectBookmarkById(String id) throws SQLException;

	Map<String, String> selectReviewByResName(int[] resName);
}
