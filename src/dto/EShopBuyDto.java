package dto;

public class EShopBuyDto {
	private String goodsId;
	private String oNum;
	private String goodsImg;
	private String goodsName;
	private String payWay;
	private String payDate;
	private String dState;
	private String oCheck;
	private String oState;
	private String goodsSize;
	private String oQty;
	private int price;
	private String name;
	private String email;
	private String phone;
	private String address;
	private String postalNum;
	public EShopBuyDto(String goodsId, String oNum, String goodsImg, String goodsName, String payWay, String payDate,
			String dState, String oCheck, String oState, String goodsSize, String oQty, int price, String name,
			String email, String phone, String address, String postalNum) {
		super();
		this.goodsId = goodsId;
		this.oNum = oNum;
		this.goodsImg = goodsImg;
		this.goodsName = goodsName;
		this.payWay = payWay;
		this.payDate = payDate;
		this.dState = dState;
		this.oCheck = oCheck;
		this.oState = oState;
		this.goodsSize = goodsSize;
		this.oQty = oQty;
		this.price = price;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.postalNum = postalNum;
	}
	public String getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}
	public String getoNum() {
		return oNum;
	}
	public void setoNum(String oNum) {
		this.oNum = oNum;
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
	public String getPayWay() {
		return payWay;
	}
	public void setPayWay(String payWay) {
		this.payWay = payWay;
	}
	public String getPayDate() {
		return payDate;
	}
	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}
	public String getdState() {
		return dState;
	}
	public void setdState(String dState) {
		this.dState = dState;
	}
	public String getoCheck() {
		return oCheck;
	}
	public void setoCheck(String oCheck) {
		this.oCheck = oCheck;
	}
	public String getoState() {
		return oState;
	}
	public void setoState(String oState) {
		this.oState = oState;
	}
	public String getGoodsSize() {
		return goodsSize;
	}
	public void setGoodsSize(String goodsSize) {
		this.goodsSize = goodsSize;
	}
	public String getoQty() {
		return oQty;
	}
	public void setoQty(String oQty) {
		this.oQty = oQty;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPostalNum() {
		return postalNum;
	}
	public void setPostalNum(String postalNum) {
		this.postalNum = postalNum;
	}
	
	
	
}
