package jmt.mvc.model.util;
/**
 * DB������ ���� �ε�, ����, �ݱ� ��� Ŭ����
 * */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DbUtil {
	static DataSource ds;
	/**
	 * �ε�
	 */
	// ���κ��� ����
	static {
		try {
		Context initContext = new InitialContext();	//conext.xml�� ������
		 ds = (DataSource)initContext.lookup("java:/comp/env/jdbc/myoracle");
		
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		//etc.
	}

	/**
	 * ����
	 * 
	 * @throws SQLException
	 */
	public static Connection getConnection() throws SQLException {
		return ds.getConnection();
	}

	/**
	 * �ݱ�(insert, update, delete)
	 */
	public static void dbClose(Statement st, Connection con) {
		try {
			if (st != null)
				st.close();
			if (con != null)
				con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * �ݱ�(select)
	 */
	public static void dbClose(ResultSet rs, Statement st, Connection con) {
		try {
			if (rs != null)
				rs.close();
			dbClose(st, con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
