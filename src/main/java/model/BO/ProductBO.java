package model.BO;

import java.util.ArrayList;

import model.Bean.Product;
import model.DAO.ProductDAO;

public class ProductBO {
	public static Product getProduct(int id) {
		return ProductDAO.getProduct(id);
	}
	public static ArrayList<Product> getListProducts(){
		return ProductDAO.getListProducts();
	}
}
