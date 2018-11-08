package jmt.mvc.model.service;

import java.sql.SQLException;

import jmt.mvc.model.dao.MemberDAO;
import jmt.mvc.model.dao.MemberDAOImpl;
import jmt.mvc.model.dto.MemberDTO;

public class MemberServiceImpl implements MemberService {
	
	MemberDAO memberDAO  = new MemberDAOImpl();
	
	@Override
	public boolean selectByInfo(MemberDTO memberDTO) throws SQLException {
		boolean result = memberDAO.selectByInfo(memberDTO);
		if(!result) throw new SQLException("������ ��ġ���� �ʽ��ϴ�.");
		return result;
	}

	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(MemberDTO memberDTO) throws SQLException {
		int result = memberDAO.insert(memberDTO);
		if (result == 0)
			throw new SQLException("��ϵ��� �ʾҽ��ϴ�.");
		return result;
	}

	@Override
	public boolean idCheck(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int update(MemberDTO memberDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

}
