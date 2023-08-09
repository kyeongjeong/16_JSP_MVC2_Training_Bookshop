package bookshop.dto;

import java.sql.Date;

public class OrderDTO {

	private long orderCd;
	private String memberId;
	private int bookCd;
	private int orderBookQty;
	private int paymentAmt;
	private String ordererNm;
	private String ordererHp;
	private String receiverNm;
	private String receiverHp;
	private String zipcode;
	private String roadAddress;
	private String jibunAddress;
	private String namujiAddress;
	private String deliveryMethod;
	private String deliveryMessage;
	private String deliveryStatus;
	private String giftWrapping;
	private String payMethod;
	private String payOrdererHp;
	private String cardCompanyNm;
	private String cardPayMonth;
	private Date payOrderTime;
	
	public long getOrderCd() {
		return orderCd;
	}
	public void setOrderCd(long orderCd) {
		this.orderCd = orderCd;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getBookCd() {
		return bookCd;
	}
	public void setBookCd(int bookCd) {
		this.bookCd = bookCd;
	}
	public int getOrderBookQty() {
		return orderBookQty;
	}
	public void setOrderBookQty(int orderBookQty) {
		this.orderBookQty = orderBookQty;
	}
	public int getPaymentAmt() {
		return paymentAmt;
	}
	public void setPaymentAmt(int paymentAmt) {
		this.paymentAmt = paymentAmt;
	}
	public String getOrdererNm() {
		return ordererNm;
	}
	public void setOrdererNm(String ordererNm) {
		this.ordererNm = ordererNm;
	}
	public String getOrdererHp() {
		return ordererHp;
	}
	public void setOrdererHp(String ordererHp) {
		this.ordererHp = ordererHp;
	}
	public String getReceiverNm() {
		return receiverNm;
	}
	public void setReceiverNm(String receiverNm) {
		this.receiverNm = receiverNm;
	}
	public String getReceiverHp() {
		return receiverHp;
	}
	public void setReceiverHp(String receiverHp) {
		this.receiverHp = receiverHp;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getRoadAddress() {
		return roadAddress;
	}
	public void setRoadAddress(String roadAddress) {
		this.roadAddress = roadAddress;
	}
	public String getJibunAddress() {
		return jibunAddress;
	}
	public void setJibunAddress(String jibunAddress) {
		this.jibunAddress = jibunAddress;
	}
	public String getNamujiAddress() {
		return namujiAddress;
	}
	public void setNamujiAddress(String namujiAddress) {
		this.namujiAddress = namujiAddress;
	}
	public String getDeliveryMethod() {
		return deliveryMethod;
	}
	public void setDeliveryMethod(String deliveryMethod) {
		this.deliveryMethod = deliveryMethod;
	}
	public String getDeliveryMessage() {
		return deliveryMessage;
	}
	public void setDeliveryMessage(String deliveryMessage) {
		this.deliveryMessage = deliveryMessage;
	}
	public String getDeliveryStatus() {
		return deliveryStatus;
	}
	public void setDeliveryStatus(String deliveryStatus) {
		this.deliveryStatus = deliveryStatus;
	}
	public String getGiftWrapping() {
		return giftWrapping;
	}
	public void setGiftWrapping(String giftWrapping) {
		this.giftWrapping = giftWrapping;
	}
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	public String getPayOrdererHp() {
		return payOrdererHp;
	}
	public void setPayOrdererHp(String payOrdererHp) {
		this.payOrdererHp = payOrdererHp;
	}
	public String getCardCompanyNm() {
		return cardCompanyNm;
	}
	public void setCardCompanyNm(String cardCompanyNm) {
		this.cardCompanyNm = cardCompanyNm;
	}
	public String getCardPayMonth() {
		return cardPayMonth;
	}
	public void setCardPayMonth(String cardPayMonth) {
		this.cardPayMonth = cardPayMonth;
	}
	public Date getPayOrderTime() {
		return payOrderTime;
	}
	public void setPayOrderTime(Date payOrderTime) {
		this.payOrderTime = payOrderTime;
	}
	
	@Override
	public String toString() {
		return "OrderDTO [orderCd=" + orderCd + ", memberId=" + memberId + ", bookCd=" + bookCd + ", orderBookQty="
				+ orderBookQty + ", paymentAmt=" + paymentAmt + ", ordererNm=" + ordererNm + ", ordererHp=" + ordererHp
				+ ", receiverNm=" + receiverNm + ", receiverHp=" + receiverHp + ", zipcode=" + zipcode
				+ ", roadAddress=" + roadAddress + ", jibunAddress=" + jibunAddress + ", namujiAddress=" + namujiAddress
				+ ", deliveryMethod=" + deliveryMethod + ", deliveryMessage=" + deliveryMessage + ", deliveryStatus="
				+ deliveryStatus + ", giftWrapping=" + giftWrapping + ", payMethod=" + payMethod + ", payOrdererHp="
				+ payOrdererHp + ", cardCompanyNm=" + cardCompanyNm + ", cardPayMonth=" + cardPayMonth
				+ ", payOrderTime=" + payOrderTime + "]";
	}
	
}
