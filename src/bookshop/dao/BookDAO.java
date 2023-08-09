package bookshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import bookshop.dto.BookDTO;

public class BookDAO {

	private BookDAO() {}
	private static BookDAO instance = new BookDAO();
	public static BookDAO getInstance() {
		return instance;
	}

	private Connection conn         = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs            = null;

	private void getConnection() {
		
		/*
		 
			  - 이클립스에서 Servers폴더에 있는 Context.xml파일에 아래의 설정 추가 
			 
			  <Resource 
					auth="Container" 
					driverClassName="com.mysql.cj.jdbc.Driver"
					type="javax.sql.DataSource"
					url="jdbc:mysql://localhost:3306/BOOKSHOP?serverTimezone=Asia/Seoul&amp;useSSL=false"
					name="jdbc/bookshop" 
					username="root"
					password="1234" 
					loginTimeout="10" 
					maxWait="5000" 
			   /> 
		     
		 */
		
		try {
			
			Context initctx = new InitialContext();
			Context envctx = (Context) initctx.lookup("java:comp/env");       
			DataSource ds = (DataSource) envctx.lookup("jdbc/bookshop"); 		  
			conn = ds.getConnection();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	private void getClose() {
    	if (rs != null)    {try {rs.close();}   catch (SQLException e) {}}
    	if (pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
        if (conn != null)  {try {conn.close();}  catch (SQLException e) {}}
    }
	
	
	public ArrayList<BookDTO> getBookList() {

		ArrayList<BookDTO> bookList = new ArrayList<BookDTO>();
		
		try {
			
			getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM BOOK");
			rs    = pstmt.executeQuery();
			
			while (rs.next()) {

				BookDTO bookDTO = new BookDTO();
				bookDTO.setBookCd(rs.getInt("BOOK_CD"));
				bookDTO.setBookNm(rs.getString("BOOK_NM"));
				bookDTO.setWriter(rs.getString("WRITER"));
				bookDTO.setPrice(rs.getInt("PRICE"));
				bookDTO.setDiscountRt(rs.getInt("DISCOUNT_RT"));
				bookDTO.setStock(rs.getInt("STOCK"));
				bookDTO.setPublisher(rs.getString("PUBLISHER"));
				bookDTO.setSort(rs.getString("SORT"));
				bookDTO.setPoint(rs.getInt("POINT"));
				bookDTO.setPublishedDt(rs.getDate("PUBLISHED_DT"));
				bookDTO.setTotalPage(rs.getInt("TOTAL_PAGE"));
				bookDTO.setIsbn(rs.getString("ISBN"));
				bookDTO.setDeliveryPrice(rs.getInt("DELIVERY_PRICE"));
				bookDTO.setPart(rs.getString("PART"));
				bookDTO.setWriterIntro(rs.getString("WRITER_INTRO"));
				bookDTO.setPublisherComment(rs.getString("PUBLISHER_COMMENT"));
				bookDTO.setIntro(rs.getString("INTRO"));
				bookDTO.setPublisherComment(rs.getString("PUBLISHER_COMMENT"));
				bookDTO.setRecommendation(rs.getString("RECOMMENDATION"));
				bookDTO.setImgNm(rs.getString("IMG_NM"));
				bookDTO.setEnrollDt(rs.getDate("ENROLL_DT"));
				bookList.add(bookDTO);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
		
		return bookList;
		
	}
	
	
	public BookDTO getBookDetail(int bookCd) {

		BookDTO bookDTO = new BookDTO();

		try {
			
			getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM BOOK WHERE BOOK_CD = ?");
			pstmt.setInt(1, bookCd);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				
				bookDTO = new BookDTO();
				bookDTO.setBookCd(rs.getInt("BOOK_CD"));
				bookDTO.setBookNm(rs.getString("BOOK_NM"));
				bookDTO.setWriter(rs.getString("WRITER"));
				bookDTO.setPrice(rs.getInt("PRICE"));
				bookDTO.setDiscountRt(rs.getInt("DISCOUNT_RT"));
				bookDTO.setStock(rs.getInt("STOCK"));
				bookDTO.setPublisher(rs.getString("PUBLISHER"));
				bookDTO.setSort(rs.getString("SORT"));
				bookDTO.setPoint(rs.getInt("POINT"));
				bookDTO.setPublishedDt(rs.getDate("PUBLISHED_DT"));
				bookDTO.setTotalPage(rs.getInt("TOTAL_PAGE"));
				bookDTO.setIsbn(rs.getString("ISBN"));
				bookDTO.setDeliveryPrice(rs.getInt("DELIVERY_PRICE"));
				bookDTO.setPart(rs.getString("PART"));
				bookDTO.setWriterIntro(rs.getString("WRITER_INTRO"));
				bookDTO.setPublisherComment(rs.getString("PUBLISHER_COMMENT"));
				bookDTO.setIntro(rs.getString("INTRO"));
				bookDTO.setPublisherComment(rs.getString("PUBLISHER_COMMENT"));
				bookDTO.setRecommendation(rs.getString("RECOMMENDATION"));
				bookDTO.setImgNm(rs.getString("IMG_NM"));
				bookDTO.setEnrollDt(rs.getDate("ENROLL_DT"));
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
		
		return bookDTO;
		
	}
	
	
	public ArrayList<BookDTO> getRelatedBookList(String sort) {

		ArrayList<BookDTO> bookList = new ArrayList<BookDTO>();
		
		try {
			
			getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM BOOK WHERE SORT = ?");
			pstmt.setString(1, sort);
			rs    = pstmt.executeQuery();
			
			while (rs.next()) {

				BookDTO bookDTO = new BookDTO();
				bookDTO.setBookCd(rs.getInt("BOOK_CD"));
				bookDTO.setBookNm(rs.getString("BOOK_NM"));
				bookDTO.setWriter(rs.getString("WRITER"));
				bookDTO.setPrice(rs.getInt("PRICE"));
				bookDTO.setDiscountRt(rs.getInt("DISCOUNT_RT"));
				bookDTO.setStock(rs.getInt("STOCK"));
				bookDTO.setPublisher(rs.getString("PUBLISHER"));
				bookDTO.setSort(rs.getString("SORT"));
				bookDTO.setPoint(rs.getInt("POINT"));
				bookDTO.setPublishedDt(rs.getDate("PUBLISHED_DT"));
				bookDTO.setTotalPage(rs.getInt("TOTAL_PAGE"));
				bookDTO.setIsbn(rs.getString("ISBN"));
				bookDTO.setDeliveryPrice(rs.getInt("DELIVERY_PRICE"));
				bookDTO.setPart(rs.getString("PART"));
				bookDTO.setWriterIntro(rs.getString("WRITER_INTRO"));
				bookDTO.setPublisherComment(rs.getString("PUBLISHER_COMMENT"));
				bookDTO.setIntro(rs.getString("INTRO"));
				bookDTO.setPublisherComment(rs.getString("PUBLISHER_COMMENT"));
				bookDTO.setRecommendation(rs.getString("RECOMMENDATION"));
				bookDTO.setImgNm(rs.getString("IMG_NM"));
				bookDTO.setEnrollDt(rs.getDate("ENROLL_DT"));
				bookList.add(bookDTO);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
		
		return bookList;
		
	}
}
