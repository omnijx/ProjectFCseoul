package dto;

public class EShopMainDto {
	private int goodsId;
	private String goodsImg;
	private String goodsName;
	private int price;
	public EShopMainDto(int goodsId, String goodsImg, String goodsName, int price) {
		super();
		this.goodsId = goodsId;
		this.goodsImg = goodsImg;
		this.goodsName = goodsName;
		this.price = price;
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	
	
	
}
