package dto;

public class EShopCartDto {
	private int goodsId;
	private String goodsImg;
	private String goodsName;
	private String goodsSize;
	private int inventory;
	private int qty;
	private int price;
	private String cDate;
	public EShopCartDto(int goodsId, String goodsImg, String goodsName, String goodsSize, int inventory, int qty,
			int price, String cDate) {
		super();
		this.goodsId = goodsId;
		this.goodsImg = goodsImg;
		this.goodsName = goodsName;
		this.goodsSize = goodsSize;
		this.inventory = inventory;
		this.qty = qty;
		this.price = price;
		this.cDate = cDate;
	}
	
	public int getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
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
	public String getGoodsSize() {
		return goodsSize;
	}
	public void setGoodsSize(String goodsSize) {
		this.goodsSize = goodsSize;
	}
	public int getInventory() {
		return inventory;
	}
	public void setInventory(int inventory) {
		this.inventory = inventory;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getcDate() {
		return cDate;
	}
	public void setcDate(String cDate) {
		this.cDate = cDate;
	}
	
	
}
