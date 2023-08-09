package bookshop.dto;

import java.sql.Date;

public class BookDTO {

	private int bookCd;
	private String bookNm;
	private String writer;
	private int price;
	private int discountRt;
	private int stock;
	private String publisher;
	private String sort;
	private int point;
	private Date publishedDt;
	private int totalPage;
	private String isbn;
	private int deliveryPrice;
	private String part;
	private String writerIntro;
	private String contentsOrder;
	private String intro;
	private String publisherComment;
	private String recommendation;
	private String imgNm;
	private Date enrollDt;
	
	public int getBookCd() {
		return bookCd;
	}
	public void setBookCd(int bookCd) {
		this.bookCd = bookCd;
	}
	public String getBookNm() {
		return bookNm;
	}
	public void setBookNm(String bookNm) {
		this.bookNm = bookNm;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getDiscountRt() {
		return discountRt;
	}
	public void setDiscountRt(int discountRt) {
		this.discountRt = discountRt;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public Date getPublishedDt() {
		return publishedDt;
	}
	public void setPublishedDt(Date publishedDt) {
		this.publishedDt = publishedDt;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public int getDeliveryPrice() {
		return deliveryPrice;
	}
	public void setDeliveryPrice(int deliveryPrice) {
		this.deliveryPrice = deliveryPrice;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	public String getWriterIntro() {
		return writerIntro;
	}
	public void setWriterIntro(String writerIntro) {
		this.writerIntro = writerIntro;
	}
	public String getContentsOrder() {
		return contentsOrder;
	}
	public void setContentsOrder(String contentsOrder) {
		this.contentsOrder = contentsOrder;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getPublisherComment() {
		return publisherComment;
	}
	public void setPublisherComment(String publisherComment) {
		this.publisherComment = publisherComment;
	}
	public String getRecommendation() {
		return recommendation;
	}
	public void setRecommendation(String recommendation) {
		this.recommendation = recommendation;
	}
	public String getImgNm() {
		return imgNm;
	}
	public void setImgNm(String imgNm) {
		this.imgNm = imgNm;
	}
	public Date getEnrollDt() {
		return enrollDt;
	}
	public void setEnrollDt(Date enrollDt) {
		this.enrollDt = enrollDt;
	}
	
	@Override
	public String toString() {
		return "BookDTO [bookCd=" + bookCd + ", bookNm=" + bookNm + ", writer=" + writer + ", price=" + price
				+ ", discountRt=" + discountRt + ", stock=" + stock + ", publisher=" + publisher + ", sort=" + sort
				+ ", point=" + point + ", publishedDt=" + publishedDt + ", totalPage=" + totalPage + ", isbn=" + isbn
				+ ", deliveryPrice=" + deliveryPrice + ", part=" + part + ", writerIntro=" + writerIntro
				+ ", contentsOrder=" + contentsOrder + ", intro=" + intro + ", publisherComment=" + publisherComment
				+ ", recommendation=" + recommendation + ", imgNm=" + imgNm + ", enrollDt=" + enrollDt + "]";
	}
	
}
