package jmt.mvc.model.service;

import java.sql.SQLException;

import java.util.List;
import java.util.Map;

import jmt.mvc.model.dao.MemberDAO;
import jmt.mvc.model.dao.MemberDAOImpl;
import jmt.mvc.model.dto.MemberDTO;

public class MemberServiceImpl implements MemberService {
	private MemberDAO dao = new MemberDAOImpl();
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

	public Map<String, String> selectBookmarkById(String id) throws SQLException{
		int [] resId = dao.selectBookmarkById(id);
		Map<String, String> map = dao.selectReviewByResName(resId);
		
		return map;
		
		
	}
	
}
