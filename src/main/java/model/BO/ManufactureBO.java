package model.BO;

import java.util.ArrayList;

import model.Bean.Manufacture;
import model.DAO.ManufactureDAO;

public class ManufactureBO {
	public static ArrayList<Manufacture> getListManufactures() {
		return ManufactureDAO.getListManufactures();
	}

	public static Manufacture getById(int id) {
		for (Manufacture m : getListManufactures()) {
			if (m.getId() == id) {
				return m;
			}
		}
		return null;
	}

	public static int add(Manufacture manufacture) {
		return ManufactureDAO.add(manufacture);
	}

	public static int update(Manufacture manufacture) {
		return ManufactureDAO.update(manufacture);
	}

	public static int delete(int id) {
		return ManufactureDAO.delete(id);
	}
}
