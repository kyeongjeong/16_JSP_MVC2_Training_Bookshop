package bookshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import bookshop.dto.OrderDTO;

public class OrderDAO {

	private OrderDAO() {}
	private static OrderDAO instance = new OrderDAO();
	public static OrderDAO getInstance() {
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
	
	
	public void insertOrderBook(OrderDTO orderDTO , int point) {
    	
    	try {
    		
			getConnection();
			String sql = "INSERT INTO `ORDER` (MEMBER_ID , BOOK_CD ,ORDER_BOOK_QTY , PAYMENT_AMT , ORDERER_NM , ORDERER_HP , RECEIVER_NM , RECEIVER_HP  , ";
				   sql += "ZIPCODE , ROAD_ADDRESS , JIBUN_ADDRESS , NAMUJI_ADDRESS , DELIVERY_METHOD , DELIVERY_MESSAGE , DELIVERY_STATUS , GIFT_WRAPPING , ";
				   sql += "PAY_METHOD , PAY_ORDERER_HP , CARD_COMPANY_NM ,  CARD_PAY_MONTH , PAY_ORDER_TIME) ";
				   sql += "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,NOW());";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, orderDTO.getMemberId());
			pstmt.setInt(2, orderDTO.getBookCd());
			pstmt.setInt(3, orderDTO.getOrderBookQty());
			pstmt.setInt(4, orderDTO.getPaymentAmt());
			pstmt.setString(5, orderDTO.getOrdererNm());
			pstmt.setString(6, orderDTO.getOrdererHp());
			pstmt.setString(7, orderDTO.getReceiverNm());
			pstmt.setString(8, orderDTO.getReceiverHp());
			pstmt.setString(9, orderDTO.getZipcode());
			pstmt.setString(10, orderDTO.getRoadAddress());
			pstmt.setString(11, orderDTO.getJibunAddress());
			pstmt.setString(12, orderDTO.getNamujiAddress());
			pstmt.setString(13, orderDTO.getDeliveryMethod());
			pstmt.setString(14, orderDTO.getDeliveryMessage());
			pstmt.setString(15, orderDTO.getDeliveryStatus());
			pstmt.setString(16, orderDTO.getGiftWrapping());
			pstmt.setString(17, orderDTO.getPayMethod());
			pstmt.setString(18, orderDTO.getPayOrdererHp());
			pstmt.setString(19, orderDTO.getCardCompanyNm());
			pstmt.setString(20, orderDTO.getCardPayMonth());
			pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement("UPDATE MEMBER SET POINT = POINT + ? WHERE MEMBER_ID = ?");
			pstmt.setInt(1, point);
			pstmt.setString(2, orderDTO.getMemberId());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
    	
    }
	
	
	public ArrayList<HashMap<String, Object>> getMyOrderList(String memberId) {

		ArrayList<HashMap<String, Object>> orderList = new ArrayList<HashMap<String, Object>>();
		
		try {
			
			getConnection();
			String sql = "SELECT * FROM `ORDER` O ";
				   sql += "INNER JOIN BOOK B ";
				   sql += "ON O.BOOK_CD = B.BOOK_CD ";
				   sql += "AND O.MEMBER_ID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			rs    = pstmt.executeQuery();
			
			while (rs.next()) {

				HashMap<String, Object> orderMap = new HashMap<String, Object>();
				orderMap.put("orderCd" , rs.getLong("ORDER_CD"));
				orderMap.put("memberId" , rs.getString("MEMBER_ID"));
				orderMap.put("bookCd" , rs.getInt("BOOK_CD"));
				orderMap.put("orderBookQty" , rs.getInt("ORDER_BOOK_QTY"));
				orderMap.put("paymentAmt" , rs.getInt("PAYMENT_AMT"));
				orderMap.put("deliveryStatus" , rs.getString("DELIVERY_STATUS"));
				orderMap.put("imgNm" , rs.getString("IMG_NM"));
				orderMap.put("price" , rs.getString("PRICE"));
				orderMap.put("bookNm" , rs.getString("BOOK_NM"));
				orderList.add(orderMap);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
		
		return orderList;
		
	}
	
	
	public HashMap<String, Object> getMyOrderDetail(long orderCd) {

		HashMap<String, Object> orderMap = new HashMap<String, Object>();

		try {
			
			getConnection();
			String sql = "SELECT * FROM `ORDER` O ";
				   sql += "INNER JOIN BOOK B ";
				   sql += "ON O.BOOK_CD = B.BOOK_CD ";
				   sql += "WHERE O.ORDER_CD = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, orderCd);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				
				orderMap.put("orderCd" , rs.getLong("ORDER_CD"));
				orderMap.put("memberId" , rs.getString("MEMBER_ID"));
				orderMap.put("bookCd" , rs.getInt("BOOK_CD"));
				orderMap.put("orderBookQty" , rs.getInt("ORDER_BOOK_QTY"));
				orderMap.put("paymentAmt" , rs.getInt("PAYMENT_AMT"));
				orderMap.put("ordererNm" , rs.getString("ORDERER_NM"));
				orderMap.put("ordererHp" , rs.getString("ORDERER_HP"));
				orderMap.put("receiverNm" , rs.getString("RECEIVER_NM"));
				orderMap.put("receiverHp" , rs.getString("RECEIVER_HP"));
				orderMap.put("zipcode" , rs.getString("ZIPCODE"));
				orderMap.put("roadAddress" , rs.getString("ROAD_ADDRESS"));
				orderMap.put("jibunAddress" , rs.getString("JIBUN_ADDRESS"));
				orderMap.put("namujiAddress" , rs.getString("NAMUJI_ADDRESS"));
				orderMap.put("deliveryMethod" , rs.getString("DELIVERY_METHOD"));
				orderMap.put("deliveryMessage" , rs.getString("DELIVERY_MESSAGE"));
				orderMap.put("deliveryStatus" , rs.getString("DELIVERY_STATUS"));
				orderMap.put("giftWrapping" , rs.getString("GIFT_WRAPPING"));
				orderMap.put("payMethod" , rs.getString("PAY_METHOD"));
				orderMap.put("payOrdererHp" , rs.getString("PAY_ORDERER_HP"));
				orderMap.put("cardCompanyNm" , rs.getString("CARD_COMPANY_NM"));
				orderMap.put("cardPayMonth" , rs.getString("CARD_PAY_MONTH"));
				orderMap.put("payOrderTime" , rs.getDate("PAY_ORDER_TIME"));
				
				orderMap.put("bookNm" , rs.getString("BOOK_NM"));
				orderMap.put("writer" , rs.getString("WRITER"));
				orderMap.put("publisher" , rs.getString("PUBLISHER"));
				orderMap.put("price" , rs.getInt("PRICE"));
				orderMap.put("discountRt" , rs.getInt("DISCOUNT_RT"));
				orderMap.put("deliveryPrice" , rs.getInt("DELIVERY_PRICE"));
				orderMap.put("point" , rs.getInt("POINT"));
				orderMap.put("imgNm" , rs.getString("IMG_NM"));
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
		
		return orderMap;
		
	}
	
}
