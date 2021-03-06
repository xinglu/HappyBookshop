package com.chinasofti.etc.happybookshop.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.chinasofti.etc.happybookshop.vo.CartItem;

public class DeleteBookCart extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public DeleteBookCart() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//System.out.println(">>>><<<**HUHU");
		HttpSession session = request.getSession();
		String strCartBookId = request.getParameter("cartBookId");
		//System.out.println("**********" + strCartBookId);
		
		int cartBookId = Integer.parseInt(strCartBookId);
		//System.out.println("**********" + cartBookId);
		
		Map<String,CartItem> cart = (HashMap<String, CartItem>)session.getAttribute("cart");
		Iterator<CartItem> iterator = cart.values().iterator();
		while (iterator.hasNext()){
			CartItem cartItem = iterator.next();
			if (cartItem.getBook().getBookId() == cartBookId){
				iterator.remove();
			}
		}
		session.setAttribute("cart", cart);
		
		response.sendRedirect("bookcart.jsp");
		
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		   this.doGet(request, response);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
