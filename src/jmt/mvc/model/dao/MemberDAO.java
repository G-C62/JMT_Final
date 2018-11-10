package jmt.mvc.model.dao;

import java.sql.SQLException;

import java.util.List;


import jmt.mvc.model.dto.MemberDTO;
import jmt.mvc.model.dto.RestaurantDTO;
import jmt.mvc.model.dto.ReviewDTO;


public interface MemberDAO {

	
	/**
	 * 로그인 
	 * 박성호 
	 * - list->boolean으로 변경 
	 * - throws처리 완료
	 * */
	boolean selectByInfo(MemberDTO memberDTO) throws SQLException;
	//l
	
	/**
	 * 삭제하기
	 * */
	int delete(String id);
	
	/**
	 * 가입(등록)하기
	 * - throws처리 완료
	 * */
	int insert(MemberDTO memberDTO) throws SQLException;
	
	/**
	 * 등록할때 필요한 id중복체크
	 * @return true이면 중복, false이면 중복아님
	 * */
	boolean idCheck(String id);
	
	/**
	 * 수정
	 * */
	int update(MemberDTO memberDTO);
	
	/**
	 * 호수 - 내가 즐겨찾기한 음식점(음식점이름, 사진) 가져오기
	 * */
	public List<String> selectBookmarkById(String id) throws SQLException;
	public List<ReviewDTO> selectReviewByResName(List<String> list) throws SQLException;



}
