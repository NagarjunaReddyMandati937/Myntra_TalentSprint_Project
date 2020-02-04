
package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.dto.Order_details;
import com.dto.Orders;
import com.dto.User;

public class Order_DetailsDao {
	public static boolean generatedOrderDetails(Order_details od) throws ClassNotFoundException, SQLException {
		Connection conn = ConnectionUtility.getConnection();
		PreparedStatement ps = conn
				.prepareStatement("insert into order_details(order_id,product_id,quantity) values(?,?,?)");
		ps.setInt(1, od.getOrder_id().getId());
		ps.setInt(2, od.getProduct_id().getId());
		ps.setInt(3, od.getQuantity());
		int val = ps.executeUpdate();
		if (val != 0)
			return true;
		return false;
	}
}
