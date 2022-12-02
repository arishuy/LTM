package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BO.AccountBO;
import model.Bean.Account;

/**
 * Servlet implementation class SignupServlet
 */
@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SignupServlet() {
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
		request.setCharacterEncoding("UTF-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String confirm_password = request.getParameter("confirm_password");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		Account account = new Account(username, password, "user", name, email, phone);

		if (AccountBO.isExistUsername(username)) {
			request.setAttribute("account", account);
			request.setAttribute("error", "Username đã tồn tại");
			String destination = "/signup.jsp";
			RequestDispatcher rq = getServletContext().getRequestDispatcher(destination);
			rq.forward(request, response);
			return;
		}
		if (!password.equals(confirm_password)) {
			request.setAttribute("account", account);
			request.setAttribute("error", "Mật khẩu không khớp");
			String destination = "/signup.jsp";
			RequestDispatcher rq = getServletContext().getRequestDispatcher(destination);
			rq.forward(request, response);
			return;
		}
		if (!AccountBO.isValidEmail(email)) {
			request.setAttribute("account", account);
			request.setAttribute("error", "Email không hợp lệ");
			String destination = "/signup.jsp";
			RequestDispatcher rq = getServletContext().getRequestDispatcher(destination);
			rq.forward(request, response);
			return;
		}
		if (!AccountBO.isValidPhoneNumber(phone)) {
			request.setAttribute("account", account);
			request.setAttribute("error", "Số điện thoại không hợp lệ");
			String destination = "/signup.jsp";
			RequestDispatcher rq = getServletContext().getRequestDispatcher(destination);
			rq.forward(request, response);
			return;
		}

		AccountBO.add(account);
		response.sendRedirect("login.jsp");

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
