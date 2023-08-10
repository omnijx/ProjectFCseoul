package dto;

public class EShopWishListDto {
	private int goodsId;
	private String goodsImg;
	private String goodsName;
	private int price;
	private String wDate;
	private int count;
	public EShopWishListDto(int goodsId, String goodsImg, String goodsName, int price, String wDate, int count) {
		super();
		this.goodsId = goodsId;
		this.goodsImg = goodsImg;
		this.goodsName = goodsName;
		this.price = price;
		this.wDate = wDate;
		this.count = count;
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
	public String getwDate() {
		return wDate;
	}
	public void setwDate(String wDate) {
		this.wDate = wDate;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	
	
}
