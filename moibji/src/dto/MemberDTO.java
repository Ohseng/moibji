package dto;

import java.util.Date;

public class MemberDTO {
				
		private String shopid;
	    private String shoppw;
	    private String shopname;
	    private String shopzipcode;
	    private String shopaddr1;
	    private String shopaddr2;
	    private String shopphone;
	    private String shopemail; 
	    private Date regdate;
		
	    
	    public MemberDTO() {
			super();
		}


		public MemberDTO(String shopid, String shoppw, String shopname, String shopzipcode, String shopaddr1,
				String shopaddr2, String shopphone, String shopemail, Date regdate) {
			super();
			this.shopid = shopid;
			this.shoppw = shoppw;
			this.shopname = shopname;
			this.shopzipcode = shopzipcode;
			this.shopaddr1 = shopaddr1;
			this.shopaddr2 = shopaddr2;
			this.shopphone = shopphone;
			this.shopemail = shopemail;
			this.regdate = regdate;
		}


		public MemberDTO(String shopid, String shoppw, String shopname, String shopzipcode, String shopaddr1,
				String shopaddr2, String shopphone, String shopemail) {
			super();
			this.shopid = shopid;
			this.shoppw = shoppw;
			this.shopname = shopname;
			this.shopzipcode = shopzipcode;
			this.shopaddr1 = shopaddr1;
			this.shopaddr2 = shopaddr2;
			this.shopphone = shopphone;
			this.shopemail = shopemail;
		}
		
			
		public MemberDTO(String shopid, String shoppw, String shopname, String shopzipcode, String shopaddr1,
				String shopaddr2, String shopphone) {
			super();
			this.shopid = shopid;
			this.shoppw = shoppw;
			this.shopname = shopname;
			this.shopzipcode = shopzipcode;
			this.shopaddr1 = shopaddr1;
			this.shopaddr2 = shopaddr2;
			this.shopphone = shopphone;
		}


		//getter & setter
		
		


		public String getShopid() {
			return shopid;
		}


		public void setShopid(String shopid) {
			this.shopid = shopid;
		}


		public String getShoppw() {
			return shoppw;
		}


		public void setShoppw(String shoppw) {
			this.shoppw = shoppw;
		}


		public String getShopname() {
			return shopname;
		}


		public void setShopname(String shopname) {
			this.shopname = shopname;
		}


		public String getShopzipcode() {
			return shopzipcode;
		}


		public void setShopzipcode(String shopzipcode) {
			this.shopzipcode = shopzipcode;
		}


		public String getShopaddr1() {
			return shopaddr1;
		}


		public void setShopaddr1(String shopaddr1) {
			this.shopaddr1 = shopaddr1;
		}


		public String getShopaddr2() {
			return shopaddr2;
		}


		public void setShopaddr2(String shopaddr2) {
			this.shopaddr2 = shopaddr2;
		}


		public String getShopphone() {
			return shopphone;
		}


		public void setShopphone(String shopphone) {
			this.shopphone = shopphone;
		}


		public String getShopemail() {
			return shopemail;
		}


		public void setShopemail(String shopemail) {
			this.shopemail = shopemail;
		}


		public Date getRegdate() {
			return regdate;
		}


		public void setRegdate(Date regdate) {
			this.regdate = regdate;
		}
		
		
		
		
		
		
		
		
		
		
}





		