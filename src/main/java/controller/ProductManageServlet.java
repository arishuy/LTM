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
			String destination = "/manager.jsp";
			RequestDispatcher rq = getServletContext().getRequestDispatcher(destination);
			rq.forward(request, response);

		} else if (mode.equals("add")) {
			String name = request.getParameter("name");
			int id_ncc = Integer.parseInt(request.getParameter("id_ncc"));
			String type = request.getParameter("type");
			Double price = Double.parseDouble(request.getParameter("price"));
			int amount = Integer.parseInt(request.getParameter("amount"));
			String url = request.getParameter("url");
			Product product = new Product(0, id_ncc, name, price, type, amount, url);

			if (ProductBO.isExistName(name, 0)) {
				ArrayList<Manufacture> listManufactures = ManufactureBO.getListManufactures();
				request.setAttribute("listManufactures", listManufactures);
				request.setAttribute("product", product);
				request.setAttribute("error", "Tên sản phẩm đã tồn tại");
				String destination = "/pd_add.jsp";
				RequestDispatcher rq = getServletContext().getRequestDispatcher(destination);
				rq.forward(request, response);
				return;
			}

			ProductBO.add(product);
			response.sendRedirect("ProductManageServlet");

		} else if (mode.equals("addform")) {
			ArrayList<Manufacture> listManufactures = ManufactureBO.getListManufactures();
			request.setAttribute("listManufactures", listManufactures);
			String destination = "/pd_add.jsp";
			RequestDispatcher rq = getServletContext().getRequestDispatcher(destination);
			rq.forward(request, response);

		} else if (mode.equals("updateform")) {
			ArrayList<Manufacture> listManufactures = ManufactureBO.getListManufactures();
			Product product = ProductBO.getProduct(Integer.parseInt(request.getParameter("id")));
			request.setAttribute("listManufactures", listManufactures);
			request.setAttribute("product", product);
			String destination = "/pd_update.jsp";
			RequestDispatcher rq = getServletContext().getRequestDispatcher(destination);
			rq.forward(request, response);

		} else if (mode.equals("update")) {
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("name");
			int id_ncc = Integer.parseInt(request.getParameter("id_ncc"));
			String type = request.getParameter("type");
			Double price = Double.parseDouble(request.getParameter("price").replace(".", ""));

			int amount = Integer.parseInt(request.getParameter("amount"));
			String url = request.getParameter("url");
			Product product_update = new Product(id, id_ncc, name, price, type, amount, url);

			if (ProductBO.isExistName(name, id)) {
				ArrayList<Manufacture> listManufactures = ManufactureBO.getListManufactures();
				Product product = ProductBO.getProduct(Integer.parseInt(request.getParameter("id")));
				request.setAttribute("listManufactures", listManufactures);
				request.setAttribute("product", product);
				request.setAttribute("error", "Tên sản phẩm đã tồn tại");
				String destination = "/pd_update.jsp";
				RequestDispatcher rq = getServletContext().getRequestDispatcher(destination);
				rq.forward(request, response);
				return;
			}

			ProductBO.update(product_update);
			response.sendRedirect("ProductManageServlet");

		} else if (mode.equals("view")) {
			int id = Integer.parseInt(request.getParameter("id"));
			Product product = ProductBO.getProduct(id);
			Manufacture manufacture = ManufactureBO.getById(product.getId_ncc());
			request.setAttribute("product", product);
			request.setAttribute("manufacture", manufacture);
			String destination = "/pd_view.jsp";
			RequestDispatcher rq = getServletContext().getRequestDispatcher(destination);
			rq.forward(request, response);

		} else if (mode.equals("deleteform")) {
			int id = Integer.parseInt(request.getParameter("id"));
			Product product = ProductBO.getProduct(id);
			request.setAttribute("product", product);
			String destination = "/deleteProduct.jsp";
			RequestDispatcher rq = getServletContext().getRequestDispatcher(destination);
			rq.forward(request, response);

		} else if (mode.equals("delete")) {
			int id = Integer.parseInt(request.getParameter("id"));
			ProductBO.delete(id);
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
