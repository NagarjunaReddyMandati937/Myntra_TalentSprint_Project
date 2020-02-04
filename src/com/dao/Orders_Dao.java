package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.dto.Orders;
import com.dto.User;

public class Orders_Dao {
	public static boolean generateOrder(Orders o) throws ClassNotFoundException, SQLException {
		Connection conn = ConnectionUtility.getConnection();
		PreparedStatement ps = conn
				.prepareStatement("insert into orders(user_id,total_amount,order_date) values(?,?,?)");
		ps.setInt(1, o.getUser_id().getId());
		ps.setInt(2, o.getTotal_amount());
		ps.setDate(3, o.getOrder_date());
		int val = ps.executeUpdate();
		if (val != 0)
			return true;
		return false;
	}

	public static Orders getIdByUserId(Orders o) throws ClassNotFoundException, SQLException {
		Connection c = ConnectionUtility.getConnection();
		PreparedStatement ps = c.prepareStatement("select * from orders where user_id=?");
		ps.setInt(1, o.getUser_id().getId());
		ResultSet rs = ps.executeQuery();
		Orders or = null;
		while (rs.next()) {
			or = new Orders();
			or.setId(rs.getInt(1));
			or.setTotal_amount(rs.getInt(3));
		}
		return or;

	}

}
