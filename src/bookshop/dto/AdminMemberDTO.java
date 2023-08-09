package bookshop.dto;

import java.sql.Date;

public class AdminMemberDTO {

	private String adminId;
	private String passwd;
	private Date joinDt;
	
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public Date getJoinDt() {
		return joinDt;
	}
	public void setJoinDt(Date joinDt) {
		this.joinDt = joinDt;
	}
	
	@Override
	public String toString() {
		return "AdminMemberDTO [adminId=" + adminId + ", passwd=" + passwd + ", joinDt=" + joinDt + "]";
	}
	
}
