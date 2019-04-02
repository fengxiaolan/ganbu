/*package com.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.dao.DB;

public class Test {
	public static void main(String[] args) throws SQLException {
		DB db = new DB();
		Connection con = db.getCon();
		String sql = "select * from dbo.t_admin"; //补一下表名
		PreparedStatement statement = con.prepareStatement(sql);
		ResultSet executeQuery = statement.executeQuery();
		while(executeQuery.next()) {
			System.out.println(executeQuery.getString(0));
		}
		statement.close();
	}
}*/
