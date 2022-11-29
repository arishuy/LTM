package model.BO;

import java.util.ArrayList;

import model.Bean.Manufacture;
import model.DAO.ManufactureDAO;

public class ManufactureBO {
	public static ArrayList<Manufacture> getListManufactures() {
		return ManufactureDAO.getListManufactures();
	}
}
