package hafy.member.vo;

public class NoticeSettingVO {
	
	private String memberNick;
	private String bidderBidNotice;
	private String bidderImminentNotice;
	private int bidderImminentTime;
	private String bidderClosedNotice;
	private String bidderReturnApproveNotice;
	private String sellerBidNotice;
	private String sellerLikeNotice;
	private String sellerClosedNotice;
	private String sellerPurchaseConfirmNotice;
	private String sellerReturnRequestNotice;
	
	
	public NoticeSettingVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public NoticeSettingVO(String memberNick, String bidderBidNotice, String bidderImminentNotice,
			int bidderImminentTime, String bidderClosedNotice, String bidderReturnApproveNotice, String sellerBidNotice,
			String sellerLikeNotice, String sellerClosedNotice, String sellerPurchaseConfirmNotice,
			String sellerReturnRequestNotice) {
		super();
		this.memberNick = memberNick;
		this.bidderBidNotice = bidderBidNotice;
		this.bidderImminentNotice = bidderImminentNotice;
		this.bidderImminentTime = bidderImminentTime;
		this.bidderClosedNotice = bidderClosedNotice;
		this.bidderReturnApproveNotice = bidderReturnApproveNotice;
		this.sellerBidNotice = sellerBidNotice;
		this.sellerLikeNotice = sellerLikeNotice;
		this.sellerClosedNotice = sellerClosedNotice;
		this.sellerPurchaseConfirmNotice = sellerPurchaseConfirmNotice;
		this.sellerReturnRequestNotice = sellerReturnRequestNotice;
	}
	
	public String getBidderReturnApproveNotice() {
		return bidderReturnApproveNotice;
	}
	public void setBidderReturnApproveNotice(String bidderReturnApproveNotice) {
		this.bidderReturnApproveNotice = bidderReturnApproveNotice;
	}
	public String getSellerReturnRequestNotice() {
		return sellerReturnRequestNotice;
	}
	public void setSellerReturnRequestNotice(String sellerReturnRequestNotice) {
		this.sellerReturnRequestNotice = sellerReturnRequestNotice;
	}
	

	public String getMemberNick() {
		return memberNick;
	}
	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}
	public String getBidderBidNotice() {
		return bidderBidNotice;
	}
	public void setBidderBidNotice(String bidderBidNotice) {
		this.bidderBidNotice = bidderBidNotice;
	}
	public String getBidderImminentNotice() {
		return bidderImminentNotice;
	}
	public void setBidderImminentNotice(String bidderImminentNotice) {
		this.bidderImminentNotice = bidderImminentNotice;
	}
	public int getBidderImminentTime() {
		return bidderImminentTime;
	}
	public void setBidderImminentTime(int bidderImminentTime) {
		this.bidderImminentTime = bidderImminentTime;
	}
	public String getBidderClosedNotice() {
		return bidderClosedNotice;
	}
	public void setBidderClosedNotice(String bidderClosedNotice) {
		this.bidderClosedNotice = bidderClosedNotice;
	}
	public String getSellerBidNotice() {
		return sellerBidNotice;
	}
	public void setSellerBidNotice(String sellerBidNotice) {
		this.sellerBidNotice = sellerBidNotice;
	}
	public String getSellerLikeNotice() {
		return sellerLikeNotice;
	}
	public void setSellerLikeNotice(String sellerLikeNotice) {
		this.sellerLikeNotice = sellerLikeNotice;
	}
	public String getSellerClosedNotice() {
		return sellerClosedNotice;
	}
	public void setSellerClosedNotice(String sellerClosedNotice) {
		this.sellerClosedNotice = sellerClosedNotice;
	}
	public String getSellerPurchaseConfirmNotice() {
		return sellerPurchaseConfirmNotice;
	}
	public void setSellerPurchaseConfirmNotice(String sellerPurchaseConfirmNotice) {
		this.sellerPurchaseConfirmNotice = sellerPurchaseConfirmNotice;
	}

	@Override
	public String toString() {
		return "NoticeSettingVO [memberNick=" + memberNick + ", bidderBidNotice=" + bidderBidNotice
				+ ", bidderImminentNotice=" + bidderImminentNotice + ", bidderImminentTime=" + bidderImminentTime
				+ ", bidderClosedNotice=" + bidderClosedNotice + ", bidderReturnApproveNotice="
				+ bidderReturnApproveNotice + ", sellerBidNotice=" + sellerBidNotice + ", sellerLikeNotice="
				+ sellerLikeNotice + ", sellerClosedNotice=" + sellerClosedNotice + ", sellerPurchaseConfirmNotice="
				+ sellerPurchaseConfirmNotice + ", sellerReturnRequestNotice=" + sellerReturnRequestNotice + "]";
	}

	
	

	
	

}
