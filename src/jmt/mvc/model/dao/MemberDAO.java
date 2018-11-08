package jmt.mvc.model.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import jmt.mvc.model.dto.MemberDTO;
import jmt.mvc.model.dto.RestaurantDTO;
import jmt.mvc.model.dto.ReviewDTO;


public interface MemberDAO {

	
	/**
	 * 로그인
	 * */
	List<MemberDTO>selectByInfo(String memberId, String memberPwd);
	
	/**
	 * 삭제하기
	 * */
	int delete(String id);
	
	/**
	 * 가입(등록)하기
	 * */
	int insert(MemberDTO memberDTO);
	
	/**
	 * 등록할때 필요한 id중복체크
	 * @return true이면 중복, false이면 중복아님
	 * */
	boolean idCheck(String id);
	
	/**
	 * 수정
	 * */
	int update(MemberDTO memberDTO);
	
	public List<String> selectBookmarkById(String id) throws SQLException;

	public List<ReviewDTO> selectReviewByResName(List<String> list) throws SQLException;

	List<RestaurantDTO> selectCategoryDAO(String category) throws SQLException;
}
