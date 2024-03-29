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
 * Servlet implementation class ProductServlet
 */
@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProductServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String type = request.getParameter("type");
		String id_ncc = request.getParameter("id_ncc");
		ArrayList<Product> listProducts = null;
			if (type != null && id_ncc != null) {
				listProducts = ProductBO.getListProductsByTypeAndManufacture(type, Integer.parseInt(id_ncc));
			} else if (type != null) {
				listProducts = ProductBO.getListProductsByType(type);
			} else if (id_ncc != null) {
				listProducts = ProductBO.getListProductsByManufacture(Integer.parseInt(id_ncc));
			} else {
				listProducts = ProductBO.getListProducts();
			}
			ArrayList<Manufacture> listManufactures = ManufactureBO.getListManufactures();
			request.setAttribute("listProducts", listProducts);
			request.setAttribute("listManufactures", listManufactures);
			String destination = "/index.jsp";
			RequestDispatcher rq = getServletContext().getRequestDispatcher(destination);
			rq.forward(request, response);
		
		
//		Product product = ProductBO.getProduct(0)
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
