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
 * Servlet implementation class ProductManageServlet
 */
@WebServlet("/ProductManageServlet")
public class ProductManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductManageServlet() {
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
			ArrayList<Product> listProducts = ProductBO.getListProducts();
			request.setAttribute("listProducts", listProducts);
			String destination = "/productManagement.jsp";
			RequestDispatcher rq = getServletContext().getRequestDispatcher(destination);
			rq.forward(request, response);
		} else if (mode.equals("add")) {
			String name = request.getParameter("name");
			int id_ncc = Integer.parseInt(request.getParameter("id_ncc"));
			String type = request.getParameter("type");
			Double price = Double.parseDouble(request.getParameter("price"));
			int amount = Integer.parseInt(request.getParameter("amount"));

			ProductBO.add(new Product(0, id_ncc, name, price, type, amount));
			response.sendRedirect("ProductManageServlet");
		} else if (mode.equals("addform")) {
			ArrayList<Manufacture> listManufactures = ManufactureBO.getListManufactures();
			request.setAttribute("listManufactures", listManufactures);
			String destination = "/addProduct.jsp";
			RequestDispatcher rq = getServletContext().getRequestDispatcher(destination);
			rq.forward(request, response);
		} else if (mode.equals("updateform")) {
			ArrayList<Manufacture> listManufactures = ManufactureBO.getListManufactures();
			Product product = ProductBO.getProduct(Integer.parseInt(request.getParameter("id")));
			request.setAttribute("listManufactures", listManufactures);
			request.setAttribute("product", product);
			String destination = "/updateProduct.jsp";
			RequestDispatcher rq = getServletContext().getRequestDispatcher(destination);
			rq.forward(request, response);
		} else if (mode.equals("update")) {
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("name");
			int id_ncc = Integer.parseInt(request.getParameter("id_ncc"));
			String type = request.getParameter("type");
			Double price = Double.parseDouble(request.getParameter("price"));
			int amount = Integer.parseInt(request.getParameter("amount"));

			ProductBO.update(new Product(id, id_ncc, name, price, type, amount));
			response.sendRedirect("ProductManageServlet");
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
