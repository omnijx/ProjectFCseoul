package dto;

public class EShopInsertActionDto {
	private String goodsImg;
	private String goodsName;
	private int inventory;
	private int price;
	public EShopInsertActionDto(String goodsImg, String goodsName, int inventory, int price) {
		super();
		this.goodsImg = goodsImg;
		this.goodsName = goodsName;
		this.inventory = inventory;
		this.price = price;
	}
	public String getGoodsImg() {
		return goodsImg;
	}
	public void setGoodsImg(String goodsImg) {
		this.goodsImg = goodsImg;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public int getInventory() {
		return inventory;
	}
	public void setInventory(int inventory) {
		this.inventory = inventory;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	
}
