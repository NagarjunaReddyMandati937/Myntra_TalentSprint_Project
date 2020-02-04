package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.dto.User;

public class UserDao {
	public static boolean register(User c) throws ClassNotFoundException, SQLException {
		Connection con = ConnectionUtility.getConnection();
		PreparedStatement ps = con
				.prepareStatement("insert into user(name,email,password) values(?,?,aes_encrypt(?,'k1'))");
		ps.setString(1, c.getName());
		ps.setString(2, c.getEmail());
		ps.setString(3, c.getPassword());
		int res = ps.executeUpdate();
		if (res != 0)
			return true;
		return false;
	}

	public static boolean checkAdminExistedOrNot(String email) throws ClassNotFoundException, SQLException {

		Connection con = ConnectionUtility.getConnection();
		PreparedStatement ps = con.prepareStatement("select * from user where email=?");

		ps.setString(1, email);
		ResultSet rs = ps.executeQuery();

		while (rs.next()) {

			return true;
		}
		// System.out.println("checking");
		return false;

	}

	public static boolean verifyUserPwd(String email, String password) throws ClassNotFoundException, SQLException {
		Connection con = ConnectionUtility.getConnection();
		PreparedStatement ps = con.prepareStatement("select aes_decrypt(password,'k1') from user where email=?");
		ps.setString(1, email);
		String dpass = "";
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			dpass = rs.getString(1);
		}
		if (dpass.equals(password)) {

			return true;
		}
		return false;
	}

	public static User getUserByEmail(String email) throws ClassNotFoundException, SQLException {

		Connection c = ConnectionUtility.getConnection();
		PreparedStatement ps = c.prepareStatement("select * from user where email=?");
		ps.setString(1, email);
		ResultSet rs = ps.executeQuery();
		User allDetails = null;

		while (rs.next()) {
			allDetails = new User();
			allDetails.setId(rs.getInt(1));
			allDetails.setName(rs.getString(2));
			allDetails.setEmail(rs.getString(3));
		}
		System.out.println("Details are " + allDetails);
		return allDetails;
	}
	public static User getUserByName(String name) throws ClassNotFoundException, SQLException {
		Connection c = ConnectionUtility.getConnection();
		PreparedStatement ps = c.prepareStatement("select * from user where name=?");
		ps.setString(1, name);
		ResultSet rs = ps.executeQuery();
		User user = null;
		while (rs.next()) {
		user = new User();
		user.setId(rs.getInt(1));
		user.setName(rs.getString(2));
		user.setEmail(rs.getString(3));
		}
		return user;

		}

}
