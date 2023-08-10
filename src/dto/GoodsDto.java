package dto;

//GOODS_ID	NUMBER
//GOODS_IMG	VARCHAR2(1000 BYTE)
//GOODS_NAME	VARCHAR2(1000 BYTE)
//PRICE	NUMBER
//NEW	VARCHAR2(20 BYTE)
//BEST	VARCHAR2(20 BYTE)
//SALE	VARCHAR2(20 BYTE)
//TYPE	VARCHAR2(100 BYTE)
//RECOMMEND	VARCHAR2(20 BYTE)

public class GoodsDto {
	private int goods_id;
	private String goods_img;
	private String goods_name;
	private int price;
	private String new1;
	private String best;
	private String sale;
	private String type;
	private String recommend;
	
	
	public GoodsDto(int goods_id, String goods_img, String goods_name, int price, String new1, String best, String sale,
			String type, String recommend) {
		this.goods_id = goods_id;
		this.goods_img = goods_img;
		this.goods_name = goods_name;
		this.price = price;
		this.new1 = new1;
		this.best = best;
		this.sale = sale;
		this.type = type;
		this.recommend = recommend;
	}


	public int getGoods_id() {
		return goods_id;
	}


	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}


	public String getGoods_img() {
		return goods_img;
	}


	public void setGoods_img(String goods_img) {
		this.goods_img = goods_img;
	}


	public String getGoods_name() {
		return goods_name;
	}


	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public String getNew1() {
		return new1;
	}


	public void setNew1(String new1) {
		this.new1 = new1;
	}


	public String getBest() {
		return best;
	}


	public void setBest(String best) {
		this.best = best;
	}


	public String getSale() {
		return sale;
	}


	public void setSale(String sale) {
		this.sale = sale;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public String getRecommed() {
		return recommend;
	}


	public void setRecommed(String recommend) {
		this.recommend = recommend;
	}
	
	
	
	
}
