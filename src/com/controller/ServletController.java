package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import com.dao.Order_DetailsDao;
import com.dao.Orders_Dao;
import com.dao.ProductDao;
import com.dto.Order_details;
import com.dto.Orders;
import com.dto.Product;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.dto.User;

public class ServletController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession session;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		session = request.getSession();
		PrintWriter out = response.getWriter();
		String button = request.getParameter("action");
		if (button == null) {
			try {
				List<String> cList = ProductDao.getAllcategory();
				session.setAttribute("cl", cList);
				System.out.println(cList + " in controller");
				List<Product> iList = ProductDao.getAllProducts();
				session.setAttribute("il", iList);
				System.out.println(iList + " in controller");
				request.getRequestDispatcher("Login.jsp").forward(request, response);

			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String button = request.getParameter("action");
		if (button.equals("Register")) {

			String name = request.getParameter("name");
			String email = request.getParameter("mail");
			String password = request.getParameter("pwd");

			User u = new User();

			u.setName(name);
			u.setEmail(email);
			u.setPassword(password);

			try {
				boolean isAdminExists = UserDao.checkAdminExistedOrNot(email);
				if (isAdminExists) {
					out.print("Already exist");
				} else {
					boolean res = UserDao.register(u);
					if (res) {
						request.getRequestDispatcher("pageRegistred.html").forward(request, response);
					} else {
						out.print("not registred");
					}
				}

			} catch (ClassNotFoundException | SQLException e1) {
				e1.printStackTrace();
			}

		}

		else if (button.equals("Login")) {

			String email = request.getParameter("mail");
			String password = request.getParameter("pwd");

			try {
				boolean isAdminExists = UserDao.verifyUserPwd(email, password);
				User user = UserDao.getUserByEmail(email);
				if (isAdminExists) {
					session.setAttribute("user", user);
					request.getRequestDispatcher("welcome.jsp").forward(request, response);
				} else {
					out.print("Wrong password");
				}
			} catch (ClassNotFoundException | SQLException e1) {
				e1.printStackTrace();
			}

		} else if (button.equals("Go")) {
			String ct = request.getParameter("category");
			try {
				List<Product> iList = ProductDao.getProductsWithCategory(ct);
				session.setAttribute("il", iList);
				request.getRequestDispatcher("Login.jsp").forward(request, response);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (button.equals("Search")) {
			String ct = request.getParameter("category");
			try {
				List<Product> iList = ProductDao.getProductsWithCategory(ct);
				session.setAttribute("il", iList);
				request.getRequestDispatcher("welcome.jsp").forward(request, response);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (button.equals("Add to Cart")) {
			String quantity[] = request.getParameterValues("quantity");
			String ids[] = request.getParameterValues("itemid");
			HashMap<Integer, Integer> cartItems;
			List<Product> itemList;

			List<Integer> qList = new ArrayList<Integer>();
			List<Integer> idList = new ArrayList<Integer>();
			int totalprice = 0;
			if (session.getAttribute("items") == null && session.getAttribute("qlist") == null) {

				for (int i = 0; i < quantity.length && i < ids.length; i++) {
					if (Integer.parseInt(quantity[i]) > 0) {
						qList.add(Integer.parseInt(quantity[i]));
						idList.add(Integer.parseInt(ids[i]));

					}
				}
				System.out.println(qList);
				System.out.println(idList);
				cartItems = new HashMap<Integer, Integer>();
				for (int j = 0; j < qList.size() && j < idList.size(); j++) {
					cartItems.put(idList.get(j), qList.get(j));
				}
				System.out.println(cartItems);
				itemList = new ArrayList<>();

				for (int i = 0; i < idList.size(); i++) {
					try {
						Product product = (ProductDao.getProductWithId(idList.get(i)));
						totalprice += product.getPrice() * qList.get(i);
						itemList.add(product);
					} catch (ClassNotFoundException | SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

				}
			} else {
				List<Product> previousList = (List<Product>) session.getAttribute("items");
				itemList = previousList;
				List previousQunt = (List) session.getAttribute("qlist");
				idList = (List<Integer>) session.getAttribute("idList");
				int psize = previousQunt.size();
				qList = previousQunt;
				int ptp = (int) session.getAttribute("tp");
				totalprice = ptp;

				for (int i = 0; i < quantity.length && i < ids.length; i++) {
					if (Integer.parseInt(quantity[i]) > 0) {
						qList.add(Integer.parseInt(quantity[i]));
						idList.add(Integer.parseInt(ids[i]));

					}
				}
				System.out.println(qList);
				System.out.println(idList);
				cartItems = new HashMap<Integer, Integer>();
				for (int j = 0; j < qList.size() && j < idList.size(); j++) {
					cartItems.put(idList.get(j), qList.get(j));
				}
				System.out.println(cartItems);
				itemList = previousList;

				for (int i = psize; i < idList.size(); i++) {
					try {
						Product product = (ProductDao.getProductWithId(idList.get(i)));
						totalprice += product.getPrice() * qList.get(i);
						itemList.add(product);

					} catch (ClassNotFoundException | SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

				}
			}
			System.out.println(itemList);
			System.out.println(totalprice);
			session.setAttribute("items", itemList);
			session.setAttribute("qlist", qList);
			session.setAttribute("idList", idList);
			session.setAttribute("tp", totalprice);
			request.getRequestDispatcher("Cart.jsp").forward(request, response);

		} else if (button.equals("Continue")) {
			int totalAmount = (int) session.getAttribute("tp");
			Date d = new Date();
			User username = (User) session.getAttribute("user");
			System.out.println("Username : " + username);
			try {
				User user = UserDao.getUserByName(username.getName());
				System.out.println("User : " + user);
				Orders o = new Orders();
				o.setUser_id(user);
				o.setTotal_amount(totalAmount);
				o.setOrder_date(new java.sql.Date(d.getTime()));
				System.out.println("Orders Object : " + o);
				if (Orders_Dao.generateOrder(o)) {
					Order_details od = new Order_details();
					Orders u = Orders_Dao.getIdByUserId(o);
					List<Product> itemList = (List<Product>) session.getAttribute("items");
					List<Integer> qList = (List<Integer>) session.getAttribute("qlist");
					System.out.println("itemList : " + itemList);
					System.out.println("Quantity : " + qList);
					System.out.println(" User Table Id : " + u.getId());
					System.out.println(itemList.get(0).getId());
					System.out.println(qList.get(0));
					for (int i = 0; i < itemList.size() && i < qList.size(); i++) {
						od.setOrder_id(u);
						od.setProduct_id(itemList.get(i));
						od.setQuantity(qList.get(i));
						System.out.println(i + " : " + Order_DetailsDao.generatedOrderDetails(od));
					}
					request.getRequestDispatcher("thankYou.jsp").forward(request, response);
				} else {
					out.println("Bill NOT generated");
				}

			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else if (button.equals("Yes")) {
			request.getRequestDispatcher("pageLoggedout.html").forward(request, response);
		}else if (button.equals("Cart")) {
			request.getRequestDispatcher("Cart.jsp").forward(request, response);
		}
	}
}