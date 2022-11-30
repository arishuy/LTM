package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BO.ManufactureBO;
import model.BO.ProductBO;
import model.Bean.Manufacture;
import model.Bean.Product;

/**
 * Servlet implementation class AddProductServlet
 */
@WebServlet("/AddProductServlet")
public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddProductServlet() {
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
		String add = request.getParameter("add");
		if (add != null) {
			String name = request.getParameter("name");
			int id_ncc = Integer.parseInt(request.getParameter("id_ncc"));
			String type = request.getParameter("type");
			Double price = Double.parseDouble(request.getParameter("price"));
			int amount = Integer.parseInt(request.getParameter("amount"));

			ProductBO.add(new Product(0, id_ncc, name, price, type, amount));
			response.sendRedirect("ProductManageServlet");
		} else {
			ArrayList<Manufacture> listManufactures = ManufactureBO.getListManufactures();
			request.setAttribute("listManufactures", listManufactures);
			String destination = "/addProduct.jsp";
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
