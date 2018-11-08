package jmt.mvc.model.service;

import java.sql.SQLException;

import java.util.List;

import jmt.mvc.model.dto.MemberDTO;

public class MemberServiceImpl implements MemberService {

	@Override
	public List<MemberDTO> selectByInfo(String memberId, String memberPwd) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(MemberDTO memberDTO) {
		// TODO Auto-generated method stub
		return 0;
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
