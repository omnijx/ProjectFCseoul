package dto;

public class EShopMyPageDto {
	private int goodsId;
	private String goodsImg;
	private String goodsName;
	private String payDate;
	private int oNum;
	private String payWay;
	private String dState;
	private String id;
	private String wDate;
	private int price;
	
	public EShopMyPageDto(int goodsId, String goodsImg, String goodsName, String payDate, int oNum, String payWay,
			String dState, String id, String wDate, int price) {
		super();
		this.goodsId = goodsId;
		this.goodsImg = goodsImg;
		this.goodsName = goodsName;
		this.payDate = payDate;
		this.oNum = oNum;
		this.payWay = payWay;
		this.dState = dState;
		this.id = id;
		this.wDate = wDate;
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

	public String getPayDate() {
		return payDate;
	}

	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}

	public int getoNum() {
		return oNum;
	}

	public void setoNum(int oNum) {
		this.oNum = oNum;
	}

	public String getPayWay() {
		return payWay;
	}

	public void setPayWay(String payWay) {
		this.payWay = payWay;
	}

	public String getdState() {
		return dState;
	}

	public void setdState(String dState) {
		this.dState = dState;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getwDate() {
		return wDate;
	}

	public void setwDate(String wDate) {
		this.wDate = wDate;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
	
	
	
}
