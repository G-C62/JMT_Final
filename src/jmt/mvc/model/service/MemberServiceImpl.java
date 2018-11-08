package jmt.mvc.model.service;

import java.sql.SQLException;

import java.util.List;
import java.util.Map;

import jmt.mvc.model.dao.MemberDAO;
import jmt.mvc.model.dao.MemberDAOImpl;
import jmt.mvc.model.dto.MemberDTO;
import jmt.mvc.model.dto.RestaurantDTO;
import jmt.mvc.model.dto.ReviewDTO;

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

	public List<ReviewDTO> selectBookmarkById(String id) throws SQLException{
		List<String> list = dao.selectBookmarkById(id);
		List<ReviewDTO> lists = dao.selectReviewByResName(list);
		
		return lists;
		
		
	}

	@Override
	public List<RestaurantDTO> selectCategoryService(String category) throws SQLException {
		List<RestaurantDTO> list = dao.selectCategoryDAO(category);
		return list;
	}
	
}
