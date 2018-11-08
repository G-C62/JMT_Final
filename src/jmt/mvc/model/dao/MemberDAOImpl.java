package jmt.mvc.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;


import jmt.mvc.model.dto.MemberDTO;
import jmt.mvc.model.util.DbUtil;

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

	public static void selectBookmarkById(String id) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;
		try {
			con= DbUtil.getConnection();
			ps = con.prepareStatement("SELECT RES_ID FROM BOOKMARK WHERE ID=?");
			ps.setString(1, id);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		
	}

}
