package model.Bean;

public class Product {
	private int id, id_ncc, amount;

	private String name, type, url;
	private Double price;

	public Product() {
	}

	public Product(int id, int id_ncc, String name, Double price, String type, int amount) {
		this.id = id;
		this.id_ncc = id_ncc;
		this.amount = amount;
		this.name = name;
		this.type = type;
		this.price = price;

	}

	public Product(int id, int id_ncc, String name, Double price, String type, int amount, String url) {
		this.id = id;
		this.id_ncc = id_ncc;
		this.amount = amount;
		this.name = name;
		this.type = type;
		this.url = url;
		this.price = price;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getId_ncc() {
		return id_ncc;
	}

	public void setId_ncc(int id_ncc) {
		this.id_ncc = id_ncc;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

}
