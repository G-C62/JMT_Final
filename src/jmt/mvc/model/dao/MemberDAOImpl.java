package jmt.mvc.model.dao;

import java.util.List;


import jmt.mvc.model.dto.MemberDTO;

public class MemberDAOImpl implements MemberDAO {

	@Override
	public List<MemberDTO> selectByInfo(String memberId, String memberPwd) {
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
