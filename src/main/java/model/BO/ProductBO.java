package model.BO;

import java.util.ArrayList;

import model.Bean.Product;
import model.DAO.ProductDAO;

public class ProductBO {
	public static Product getProduct(int id) {
		return ProductDAO.getProduct(id);
	}

	public static ArrayList<Product> getListProducts() {
		return ProductDAO.getListProducts();
	}

	public static ArrayList<Product> getListProductsByManufacture(int id_ncc) {
		return ProductDAO.getListProductsByManufacture(id_ncc);
	}

	public static ArrayList<Product> getListProductsByType(String type) {
		ArrayList<Product> list = new ArrayList<>();
		for (Product p : ProductDAO.getListProducts()) {
			if (p.getType().equals(type)) {
				list.add(p);
			}
		}
		return list;
	}

	public static ArrayList<Product> getListProductsByTypeAndManufacture(String type, int id_ncc) {
		ArrayList<Product> list = new ArrayList<>();
		for (Product p : ProductDAO.getListProductsByManufacture(id_ncc)) {
			if (p.getType().equals(type)) {
				list.add(p);
			}
		}
		return list;
	}
}
