package jmt.mvc.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jmt.mvc.model.dto.MemberDTO;
import jmt.mvc.model.dto.ReviewDTO;
import jmt.mvc.model.util.DbUtil;

public class MemberDAOImpl implements MemberDAO {
	

	@Override
	public boolean selectByInfo(MemberDTO memberDTO) throws SQLException{
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
	public int delete(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	   @Override
	   public int insert(MemberDTO memberDTO) throws SQLException {
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
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int update(MemberDTO memberDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<String> selectBookmarkById(String id) throws SQLException {
		Connection con =null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<String> list = new ArrayList<>();
		try {
			con= DbUtil.getConnection();
			ps = con.prepareStatement("SELECT RES_ID FROM BOOKMARK WHERE MEMBER_ID=?");
			ps.setString(1, id);
			rs=ps.executeQuery();
			
			while(rs.next()) {
				System.out.println(rs.getInt(1));
				list.add(Integer.toString(rs.getInt(1)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return list;
	}

	@Override
	public List<ReviewDTO> selectReviewByResName(List<String> list) throws SQLException {
		Connection con =null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<ReviewDTO> lists=new ArrayList<>();
		
		try {
			con=DbUtil.getConnection();
			ps=con.prepareStatement("SELECT RES_NAME,REVIEW_IMG1 FROM REVIEW WHERE RES_ID=?");
			for(int i=0;i<list.size();i++) {
				ps.setInt(1, Integer.parseInt(list.get(i)));
				rs=ps.executeQuery();
				while(rs.next()) {
					lists.add(new ReviewDTO(rs.getString(1), rs.getString(2)));
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return lists;
	}

	
}