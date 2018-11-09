package jmt.mvc.model.service;

import java.sql.SQLException;

import java.util.List;
import java.util.Map;

import jmt.mvc.model.dto.MemberDTO;
import jmt.mvc.model.dto.RestaurantDTO;
import jmt.mvc.model.dto.ReviewDTO;

public interface MemberService {
	/**
	 * 로그인
	 * */
	List<MemberDTO>selectByInfo(String memberId, String memberPwd) throws SQLException;
	
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
	
	/**
	 * 호수 - 내가 즐겨찾기한 음식점(음식점이름, 사진) 가져오기
	 * */
	List<ReviewDTO> selectBookmarkById(String id) throws SQLException;

	/**
	 * 호수 - 메인 검색바에서 음식점 검색할 때 자동완성기능
	 * */
	List<String> autoCompleteRestaurant(String keyWord) throws SQLException ;

}
