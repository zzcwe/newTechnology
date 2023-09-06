package kr.th.auction.service;

import java.util.Date;
import java.util.ArrayList;
import java.util.Map;

import kr.th.auction.pagination.Criteria;
import kr.th.auction.vo.AuctionOrderVO;
import kr.th.auction.vo.AuctionRecordVO;
import kr.th.auction.vo.AuctionVO;
import kr.th.auction.vo.BoardListVO;
import kr.th.auction.vo.ChattingVO;
import kr.th.auction.vo.DeliveryVO;
import kr.th.auction.vo.FileVO;
import kr.th.auction.vo.MemberVO;
import kr.th.auction.vo.MembershipLevelVO;
import kr.th.auction.vo.MessageVO;
import kr.th.auction.vo.ProductLikeVO;
import kr.th.auction.vo.ProductStoreVO;
import kr.th.auction.vo.ProductVO;
import kr.th.auction.vo.ReportCategoryVO;
import kr.th.auction.vo.ReportVO;
import kr.th.auction.vo.SellerLikeVO;
import kr.th.auction.vo.StoreVO;
import kr.th.auction.vo.VirtualAccountVO;

public interface AuctionService {

	ArrayList<ProductStoreVO> selectPossibleProductList(MemberVO user);

	boolean insertAuction(AuctionVO auction);

	ArrayList<AuctionVO> getOnAirAuctionList(Criteria cri);

	int getOnAirAuctionTotalCount();

	ArrayList<AuctionVO> getAuction(int searchCategory, String searchName, Criteria cri);

	int getAuctionTotalCount(int searchCategory, String searchName);
	
	ArrayList<ReportCategoryVO> selectReportCategory();

	boolean insertReport(ReportVO report);
	
	boolean insertMessage(MessageVO message);
	
	ArrayList<AuctionRecordVO> selectAuctionRecord(String auctionStart, int productPrice, String sellerId, int auctionNum);
	
	MemberVO getUser(String me_id);
	
	boolean insertBid(double price, int expense, VirtualAccountVO userAccount, MemberVO user, int auctionNum);
	
	MembershipLevelVO selectMebership(String levelName);

	VirtualAccountVO selectAccount(String id);
	
	AuctionVO getAuction(int num);

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

	void insertAuctionRecord(String auctionStart, int pr_start_price, String me_id, int au_num);
	
	AuctionRecordVO lastAuctionRecord(int auctionNum);

	boolean finishAuction(int intNow, int intEnd2, AuctionVO auction);

	ArrayList<BoardListVO> selectBoardList(String me_id);

	AuctionOrderVO insertOrder(AuctionVO auction);

	void insertDelivery(int ao_num, int bl_num);

	ChattingVO selectChatting(int au_num);

	void insertChattingRecord(String message, String sender, String room);

	ArrayList<FileVO> selectFile(int productCode);

	AuctionOrderVO selectAuctionOrder(int au_num);

	DeliveryVO selectDelivery(int ao_num);

	void updateDelivery(int ao_num, int bl_num);

	StoreVO selectStore(String id);

	ArrayList<ProductVO> selectProductList(int st_num, Criteria cri);

	int getProductTotalCount(int st_num);
	
}
