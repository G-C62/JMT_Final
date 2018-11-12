package jmt.mvc.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jmt.mvc.model.dto.MemberDTO;
import jmt.mvc.model.util.DbUtil;

public class MemberDAOImpl implements MemberDAO {

	@Override
	public boolean selectByInfo(MemberDTO memberDTO) throws SQLException{
		//로그인시 필요한 DAO
		Connection con=null;
		PreparedStatement ps =null;
		ResultSet rs=null;
		boolean result = false;
		try {
			//로드 연결 실행 닫기
			con=DbUtil.getConnection();
			ps = con.prepareStatement("select * from member where MEMBER_ID=? and MEMBER_PWD=?");
			ps.setString(1, memberDTO.getMemberId());
			ps.setString(2, memberDTO.getMemberPwd());
			rs = ps.executeQuery();
			if(rs.next()) {
				result = true;
			}
			
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return result;
	}

	

	@Override
	public int delete(String id) throws SQLException {
		Connection con = DbUtil.getConnection();
		PreparedStatement ps =null;
		int result =0;
		try{
			ps = con.prepareStatement("delete member where member_id=?");
			ps.setString(1, id);
			result = ps.executeUpdate();
		}finally{
			DbUtil.dbClose( ps, con);
		}
		return result;
	}

	   @Override
	   public int insert(MemberDTO memberDTO) throws SQLException {
		   //회원가입
		  Connection con = DbUtil.getConnection();
	      PreparedStatement ps =null;
	      int result = 0;
	      try{
	         
	         ps = con.prepareStatement("insert into member values(?,?,?,?,?,?)");
	         ps.setString(1, memberDTO.getMemberId());
	         ps.setString(2, memberDTO.getMemberPwd());
	         ps.setString(3, memberDTO.getMemberName());
	         ps.setString(4, memberDTO.getMemberPhone());
	         ps.setString(5, memberDTO.getMemberGender());
	         ps.setString(6, memberDTO.getMemberEmail());
	         
	         result = ps.executeUpdate();
	      }
	      finally{
	         DbUtil.dbClose(ps, con);
	      }
	      return result;
	   }

	@Override
	public boolean idCheck(String id) {
		PreparedStatement ps = null;
		  ResultSet rs = null;
		  Connection con = null;
		  boolean result=false;
		  try {
		   con=DbUtil.getConnection();
		   ps = con.prepareStatement("select id from member where id=?");
		   ps.setString(1, id);
		   rs = ps.executeQuery();
		   if(rs.next()){
		    result=true;
		   }
		  } catch (SQLException e) {
		   e.printStackTrace();
		  }finally {
		   DbUtil.dbClose(rs, ps, con);
		  }
		  return result;
		 
	}

	@Override
	public int update(MemberDTO memberDTO) throws SQLException{
		//수정하기
		Connection con =DbUtil.getConnection();
		PreparedStatement ps =null;
		int result = 0;
		try{
			//쿼리문
			ps = con.prepareStatement(
					"update member set member_pwd=?,member_name=?,member_phone=?,member_gender=?,member_email=? where member_id=?");
			
			ps.setString(1, memberDTO.getMemberPwd());
			ps.setString(2, memberDTO.getMemberName());
			ps.setString(3, memberDTO.getMemberPhone());
			ps.setString(4, memberDTO.getMemberGender());
			ps.setString(5, memberDTO.getMemberEmail());
			ps.setString(6, memberDTO.getMemberId());
			result = ps.executeUpdate(); //수정 성공 갯수
		}finally{
			DbUtil.dbClose( ps, con);
		}
		return result;
	}



	@Override
	public MemberDTO selectById(String id) throws SQLException {
		//수정하기 시 아이디 불러오기
		Connection con =DbUtil.getConnection();
		PreparedStatement ps =null;
		ResultSet rs=null;
		MemberDTO memberDTO = null;
		try {
			//아이디를 이용해서 그아이디에 해당하는 컬럼들을 불러온다
			con=DbUtil.getConnection();
			ps=con.prepareStatement("SELECT * FROM MEMBER WHERE MEMBER_ID=?");
			//수정시 아이디 불러오기 쿼리
			ps.setString(1, id);
			rs=ps.executeQuery(); //아이디 불러오기 성공 여부???
			while(rs.next()) {
				//해당 아이디에 들어있는 데이터 불러오기
				memberDTO = new MemberDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6));
			}
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return memberDTO;
	}



	@Override
	public String PassCheckDAO(String id) throws SQLException {
		PreparedStatement ps = null;
		ResultSet rs = null;
		Connection con = null;
		String result=null;
		try {
			con = DbUtil.getConnection();
			ps=con.prepareStatement("select MEMBER_PWD from member where MEMBER_ID=?");
			ps.setString(1, id);
			rs=ps.executeQuery();
			while(rs.next()) {
				result=rs.getString(1);
			}
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return result;
	}

}
