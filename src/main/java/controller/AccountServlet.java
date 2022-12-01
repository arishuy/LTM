package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BO.AccountBO;
import model.Bean.Account;

/**
 * Servlet implementation class AccountServlet
 */
@WebServlet("/AccountServlet")
public class AccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AccountServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String mode = request.getParameter("mode");
		if (mode == null) {
			ArrayList<Account> listAccounts = AccountBO.getListAccounts();
			request.setAttribute("listAccounts", listAccounts);
			String destination = "/managerAccount.jsp";
			RequestDispatcher rq = getServletContext().getRequestDispatcher(destination);
			rq.forward(request, response);
		}
		else if (mode.equals("1"))
		{
			response.sendRedirect("info.jsp");
		}
		else if (mode.equals("delete")) {
			int id = Integer.parseInt(request.getParameter("id"));
			AccountBO.delete(id);
			response.sendRedirect("AccountServlet");
		}
		else if (mode.equals("updateForm")) {
			int id = Integer.parseInt(request.getParameter("id"));
			Account user = AccountBO.getAccountById(id);
			request.setAttribute("user", user);
			String destination = "/updateAccount.jsp";
			RequestDispatcher rq = getServletContext().getRequestDispatcher(destination);
			rq.forward(request, response);
		}
		else if (mode.equals("update")) {
			int id = Integer.parseInt(request.getParameter("id"));
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String role = request.getParameter("role");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			
			Account user = new Account(id, username, password, role, name, email, phone);
			AccountBO.update(user);
			
			response.sendRedirect("AccountServlet");
		} 
		else if (mode.equals("view")) {
			int id = Integer.parseInt(request.getParameter("id"));
			Account user = AccountBO.getAccountById(id);
			request.setAttribute("user", user);
			String destination = "/viewAccount.jsp";
			RequestDispatcher rq = getServletContext().getRequestDispatcher(destination);
			rq.forward(request, response);

		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
