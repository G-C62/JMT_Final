package jmt.mvc.model.service;

import java.sql.SQLException;




import jmt.mvc.model.dto.MemberDTO;

public interface MemberService {
	/**
	 * 로그인
	 * */
	boolean selectByInfo(MemberDTO memberDTO) throws SQLException;
	
	/**
	 * 삭제하기
	 * */
	int delete(String id);
	
	/**
	 * 가입(등록)하기
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
}
