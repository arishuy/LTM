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
 * Servlet implementation class ManagerServlet
 */
@WebServlet("/ManagerServlet")
public class ManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
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
			String action = request.getParameter("action");
			System.out.print(action);
			try {
				switch (action) {
				case "update": {
						showNewForm(request, response);
						break;
				}
				case "updateProduct": {
					updateProduct(request, response);
					break;
				}
				default:
					throw new IllegalArgumentException("Unexpected value: " + action);
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			String destination = "/manager.jsp";
			RequestDispatcher rq = getServletContext().getRequestDispatcher(destination);
			rq.forward(request, response);
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	private void showNewForm(HttpServletRequest request, HttpServletResponse response)
		    throws ServletException, IOException {
				int id = Integer.parseInt(request.getParameter("id"));
				Product pd = ProductBO.getProduct(id);
				request.setAttribute("pd", pd);
		        RequestDispatcher dispatcher = request.getRequestDispatcher("pd_update.jsp");
		        dispatcher.forward(request, response);
		    }
	private void updateProduct(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		System.out.println(id);
		int amount = Integer.parseInt(request.getParameter("amount"));
		String name = request.getParameter("name");
		System.out.println(name);
		Double price = Double.parseDouble(request.getParameter("price"));
		
		ProductBO.updateProduct(id, name, price, amount);
		response.sendRedirect("ManagerServlet");
	}
}
