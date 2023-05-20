package kr.kh.onairauction.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import kr.kh.onairauction.vo2.SellerLikeVO;
import kr.kh.onairauction.vo2.AuctionRecordVO;
import kr.kh.onairauction.vo2.AuctionVO;
import kr.kh.onairauction.vo2.MemberVO;
import kr.kh.onairauction.vo2.MembershipLevelVO;
import kr.kh.onairauction.vo2.MessageVO;
import kr.kh.onairauction.vo2.ProductLikeVO;
import kr.kh.onairauction.vo2.ProductVO;
import kr.kh.onairauction.vo2.ReportCategoryVO;
import kr.kh.onairauction.vo2.ReportVO;
import kr.kh.onairauction.vo2.VirtualAccountVO;

public interface AuctionService {
	
	ArrayList<ReportCategoryVO> selectReportCategory();

	boolean insertReport(ReportVO report);
	
	boolean insertMessage(MessageVO message);
	
	ArrayList<AuctionRecordVO> selectAuctionRecord(int auctionNum);
	
	MemberVO getUser(String me_id); //나중에 삭제
	
	boolean insertBid(Double price, int expense, VirtualAccountVO userAccount, MemberVO user, int auctionNum);
	
	MembershipLevelVO selectMebership(String levelName);

	VirtualAccountVO selectAccount(String id);
	
	AuctionVO getAuction(String id);

	ProductVO selectProduct(int productCode);

	MemberVO selectSeller(String sellerId);
	
	boolean timeChange(Date a, Date b);

	SellerLikeVO selectSellerLike(String userId, String sellerId);

	void insertSellerLike(String userId, String sellerId, int num);

	void updateSellerLike(String userId, String sellerId, int sellerLikeState);

	ProductLikeVO selectProductLike(int productCode, String userId);

	void insertProductLike(int productCode, String userId, int num);

	void updateProductLike(int productCode, String userId, int productLikeState);
	
	String endTime(AuctionRecordVO lastRecord, AuctionVO auction);
	
	Map<String, Object> sellerLike(int sellerLikeState, String userId, String sellerId);
	
	Map<String, Object> productLike(int productCode, String userId, int productLikeState);
}