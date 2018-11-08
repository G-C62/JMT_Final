package jmt.mvc.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jmt.mvc.model.dto.MemberDTO;
import jmt.mvc.model.util.DbUtil;

public class MemberDAOImpl implements MemberDAO {
	
	private static final int HashMap = 0;

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

	public int[] selectBookmarkById(String id) throws SQLException {
		Connection con =null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int [] resId = null;
		int count = 0;
		try {
			con= DbUtil.getConnection();
			ps = con.prepareStatement("SELECT RES_ID FROM BOOKMARK WHERE ID=?");
			ps.setString(1, id);
			rs=ps.executeQuery();
			while(rs.next()) {
				resId[count] = rs.getInt(1);
				count++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return resId;
	}

	@Override
	public Map<String, String> selectReviewByResName(int[] resId) {
		Connection con =null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Map<String, String> map = new HashMap<>();
		
		try {
			con=DbUtil.getConnection();
			for(int i=0;i<resId.length; i++) {
				ps = con.prepareStatement("SELECT RES_NAME,REVIEW_IMG1 FROM REVIEW WHERE RES_ID=?");
				ps.setInt(1, resId[i]);
				rs=ps.executeQuery();
				while(rs.next()) {
					if(rs.getString(2)!=null) {
						map.put(rs.getString(1), rs.getString(2));
					}else {
						map.put(rs.getString(1), null);
					}
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return map;
	}
}
