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
import model.Bean.Manufacture;

/**
 * Servlet implementation class ManufactureServlet
 */
@WebServlet("/ManufactureServlet")
public class ManufactureServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManufactureServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String mode = request.getParameter("mode");
		if (mode == null) {
			ArrayList<Manufacture> listManufactures = ManufactureBO.getListManufactures();
			request.setAttribute("listManufactures", listManufactures);
			String destination = "/managerManufacture.jsp";
			RequestDispatcher rq = getServletContext().getRequestDispatcher(destination);
			rq.forward(request, response);
		}
		else if (mode.equals("delete")) {
			int id = Integer.parseInt(request.getParameter("id"));
			ManufactureBO.delete(id);
			response.sendRedirect("ManufactureServlet");
		}else if (mode.equals("add")) {
			String name = request.getParameter("name");
			int id_ncc = Integer.parseInt(request.getParameter("id"));
			ManufactureBO.add(new Manufacture(id_ncc, name));
			response.sendRedirect("ManufactureServlet");
		}
		else if (mode.equals("update")) {
			int id_ncc= Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("name");
			ManufactureBO.update(new Manufacture(id_ncc, name));
			response.sendRedirect("ManufactureServlet");
			}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
