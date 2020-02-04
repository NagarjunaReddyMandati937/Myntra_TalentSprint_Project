package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dto.Product;

public class ProductDao {

	public static List<String> getAllcategory() throws ClassNotFoundException, SQLException {
		Connection c = ConnectionUtility.getConnection();
		PreparedStatement ps = c.prepareStatement("select distinct(category) from product");
		ResultSet rs = ps.executeQuery();
		System.out.println(rs);
		List<String> ilist = new ArrayList<>();
		
		while (rs.next()) {
			String s = rs.getString(1);
			ilist.add(s);
		}
		System.out.println(ilist+"In Dao");
		return ilist;
	}

	public static List<Product> getAllProducts() throws ClassNotFoundException, SQLException {
		Connection c = ConnectionUtility.getConnection();
		PreparedStatement ps = c.prepareStatement("Select * from product");
		ResultSet rs = ps.executeQuery();
		List<Product> list = new ArrayList<>();
		Product p = null;
		while (rs.next()) {
			p = new Product();
			p.setId(rs.getInt(1));
			p.setName(rs.getString(2));
			p.setPrice(rs.getInt(3));
			p.setImage_url(rs.getString(4));
			p.setCategory(rs.getString(5));
			list.add(p);

		}
		return list;

	}
	public static List<Product> getProductsWithCategory(String ct) throws ClassNotFoundException, SQLException {
		Connection c = ConnectionUtility.getConnection();
		PreparedStatement ps = c.prepareStatement("Select * from product where category=?");
		ps.setString(1, ct);
		ResultSet rs = ps.executeQuery();
		List<Product> list = new ArrayList<Product>();
		Product p = null;
		while (rs.next()) {
			p = new Product();
			p.setId(rs.getInt(1));
			p.setName(rs.getString(2));
			p.setPrice(rs.getInt(3));
			p.setImage_url(rs.getString(4));
			p.setCategory(rs.getString(5));
			list.add(p);

		}
		System.out.println(list);
		return list;

	}
	public static Product getProductWithId(int id) throws ClassNotFoundException, SQLException {
		Connection c = ConnectionUtility.getConnection();
		PreparedStatement ps = c.prepareStatement("Select * from product where id=?");
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();
		
		Product p = null;
		while (rs.next()) {
			p = new Product();
			p.setId(rs.getInt(1));
			p.setName(rs.getString(2));
			p.setPrice(rs.getInt(3));
			p.setImage_url(rs.getString(4));
			p.setCategory(rs.getString(5));	

		}
		return p;

	}
	 
	

}
