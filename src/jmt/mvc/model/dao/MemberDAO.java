package jmt.mvc.model.dao;

import java.sql.SQLException;
import java.util.List;

import jmt.mvc.model.dto.MemberDTO;

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
	int delete(String id) throws SQLException;
	
	/**
	 * 가입(등록)하기
	 * - throws처리 완료
	 * */
	int insert(MemberDTO memberDTO) throws SQLException;
	
	/**
	 * 성호 - 등록할때 필요한 id중복체크
	 * @return true이면 중복, false이면 중복아님
	 * */
	boolean idCheck(String id) throws SQLException;
	
	/**
	 * 회원 정보 수정
	 * 박성호
	 * - throws처리 완료
	 * */
	int update(MemberDTO memberDTO) throws SQLException;

	/**
	 * 성호 - 아이디로 회원정보 받아오기
	 * */
	MemberDTO selectById(String id) throws SQLException;

	/**
	 * 성호 - 비밀번호 체크하기 (ajax)
	 * */
	String PassCheckDAO(String id) throws SQLException;
}
