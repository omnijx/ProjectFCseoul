package dto;

public class EShopOrderHistoryDto {
	private int goodsId;
	private int oNum;
	private String payWay;
	private String payDate;
	private String dState;
	private String cancel;
	private String oCheck;
	private String cState;
	private String oState;
	public EShopOrderHistoryDto(int goodsId, int oNum, String payWay, String payDate, String dState, String cancel,
			String oCheck, String cState, String oState) {
		super();
		this.goodsId = goodsId;
		this.oNum = oNum;
		this.payWay = payWay;
		this.payDate = payDate;
		this.dState = dState;
		this.cancel = cancel;
		this.oCheck = oCheck;
		this.cState = cState;
		this.oState = oState;
	}
	public int getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
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
	public String getCancel() {
		return cancel;
	}
	public void setCancel(String cancel) {
		this.cancel = cancel;
	}
	public String getoCheck() {
		return oCheck;
	}
	public void setoCheck(String oCheck) {
		this.oCheck = oCheck;
	}
	public String getcState() {
		return cState;
	}
	public void setcState(String cState) {
		this.cState = cState;
	}
	public String getoState() {
		return oState;
	}
	public void setoState(String oState) {
		this.oState = oState;
	}
	
	
}
