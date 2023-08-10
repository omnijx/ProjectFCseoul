package dto;

public class EShopCatePageDto {
	private int goodsId;
	private String goodsImg;
	private String goodsName;
	private String bestP;
	private String newP;
	private int price;
	private int count;
	public EShopCatePageDto(int goodsId, String goodsImg, String goodsName, String bestP, String newP, int price,
			int count) {
		this.goodsId = goodsId;
		this.goodsImg = goodsImg;
		this.goodsName = goodsName;
		this.bestP = bestP;
		this.newP = newP;
		this.price = price;
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
	public String getBestP() {
		return bestP;
	}
	public void setBestP(String bestP) {
		this.bestP = bestP;
	}
	public String getNewP() {
		return newP;
	}
	public void setNewP(String newP) {
		this.newP = newP;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}

	
	
	
}
