package bookshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import bookshop.dto.MemberDTO;

public class MemberDAO {

	private MemberDAO() {}
	private static MemberDAO instance = new MemberDAO();
	public static MemberDAO getInstance() {
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
	
	
	public boolean checkDuplicateId(String memberId) {
    	
    	boolean isDuple = false;
    	
    	try {
    		
			getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM MEMBER WHERE MEMBER_ID = ?");
			pstmt.setString(1 , memberId);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				isDuple = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
    	
    	return isDuple;
    	
    }
	
	
    public void registerMember(MemberDTO memberDTO) {
    	
    	try {
    		
			getConnection();
			pstmt = conn.prepareStatement("INSERT INTO MEMBER VALUES(? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , 0 , NOW())");
			pstmt.setString(1, memberDTO.getMemberId());
			pstmt.setString(2, memberDTO.getMemberNm());
			pstmt.setString(3, memberDTO.getPasswd());
			pstmt.setString(4, memberDTO.getSex());
			pstmt.setString(5, memberDTO.getBirthDt());
			pstmt.setString(6, memberDTO.getHp());
			pstmt.setString(7, memberDTO.getSmsstsYn());
			pstmt.setString(8, memberDTO.getEmail());
			pstmt.setString(9, memberDTO.getEmailstsYn());
			pstmt.setString(10, memberDTO.getZipcode());
			pstmt.setString(11, memberDTO.getRoadAddress());
			pstmt.setString(12, memberDTO.getJibunAddress());
			pstmt.setString(13, memberDTO.getNamujiAddress());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
    	
    }
    
    
    public boolean loginMember(MemberDTO memberDTO) {
    	
    	boolean isLogin = false;
    	
    	try {
    		
			getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM MEMBER WHERE MEMBER_ID = ? AND PASSWD = ?");
			pstmt.setString(1, memberDTO.getMemberId());
			pstmt.setString(2, memberDTO.getPasswd());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				isLogin = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
    	
    	return isLogin;
    	
    }
    
    
    public MemberDTO getMemberDetail(String memberId) {
        
    	MemberDTO memberDTO = new MemberDTO();
        
    	try {
    		
            getConnection();
            pstmt = conn.prepareStatement("SELECT * FROM MEMBER WHERE MEMBER_ID = ?");
            pstmt.setString(1, memberId);
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
            	memberDTO = new MemberDTO();
            	memberDTO.setMemberId(rs.getString("MEMBER_ID"));
            	memberDTO.setMemberNm(rs.getString("MEMBER_NM"));
            	memberDTO.setPasswd(rs.getString("PASSWD"));
            	memberDTO.setSex(rs.getString("SEX"));
            	memberDTO.setBirthDt(rs.getString("BIRTH_DT"));
            	memberDTO.setHp(rs.getString("HP"));
            	memberDTO.setSmsstsYn(rs.getString("SMSSTS_YN"));
            	memberDTO.setEmail(rs.getString("EMAIL"));
            	memberDTO.setEmailstsYn(rs.getString("EMAILSTS_YN"));
            	memberDTO.setZipcode(rs.getString("ZIPCODE"));
            	memberDTO.setRoadAddress(rs.getString("ROAD_ADDRESS"));
            	memberDTO.setJibunAddress(rs.getString("JIBUN_ADDRESS"));
            	memberDTO.setNamujiAddress(rs.getString("NAMUJI_ADDRESS"));
            	memberDTO.setPoint(rs.getInt("POINT"));
            	memberDTO.setJoinDt(rs.getDate("JOIN_DT"));
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        	getClose();
        }
    	
        return memberDTO;
    
    }
    
    
    public void deleteMember(String memberId) {
    	
    	try {
    		
    		getConnection();
    		pstmt = conn.prepareStatement("DELETE FROM MEMBER WHERE MEMBER_ID = ?");
    		pstmt.setString(1, memberId);
    		pstmt.executeUpdate();
    		
    	} catch(Exception e) {
    		e.printStackTrace();
    	} finally {
    		getClose();
    	}
    	
    }
    
    
    public void updateMember(MemberDTO memberDTO) {
        
    	try {
    		
            getConnection();
            
            String sql = "UPDATE MEMBER SET ";
		           sql += "MEMBER_NM = ?,";
                   sql += "SEX = ?,";
                   sql += "BIRTH_DT = ?,";
                   sql += "HP = ?,";
                   sql += "SMSSTS_YN = ?,";
                   sql += "EMAIL = ?,";
                   sql += "EMAILSTS_YN = ?,";
                   sql += "ZIPCODE = ?,";
                   sql += "ROAD_ADDRESS = ?,";
                   sql += "JIBUN_ADDRESS = ?,";
                   sql += "NAMUJI_ADDRESS = ?";
                   sql += "WHERE MEMBER_ID = ?";
                   
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, memberDTO.getMemberNm());
            pstmt.setString(2, memberDTO.getSex());
            pstmt.setString(3, memberDTO.getBirthDt());
            pstmt.setString(4, memberDTO.getHp());
            pstmt.setString(5, memberDTO.getSmsstsYn());
            pstmt.setString(6, memberDTO.getEmail());
            pstmt.setString(7, memberDTO.getEmailstsYn());
            pstmt.setString(8, memberDTO.getZipcode());
            pstmt.setString(9, memberDTO.getRoadAddress());
            pstmt.setString(10, memberDTO.getJibunAddress());
            pstmt.setString(11, memberDTO.getNamujiAddress());
            pstmt.setString(12, memberDTO.getMemberId());
            pstmt.executeUpdate();
            
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	getClose();
        }
    	
    }
	
	
}
