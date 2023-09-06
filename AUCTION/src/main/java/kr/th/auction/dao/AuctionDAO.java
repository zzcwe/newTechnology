package kr.th.auction.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

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


public interface AuctionDAO {

	ArrayList<ProductStoreVO> selectPossibleProductList(@Param("me_id") String me_id,@Param("num") int i);

	boolean insertAuction(@Param("auction") AuctionVO auction);

	void updateProduct(@Param("pr_code") int au_pr_code);

	ArrayList<AuctionVO> selectOnAirAuctionList(@Param("cri") Criteria cri);

	int selectOnAirAuctionTotalCount();

	ArrayList<AuctionVO> selectAuctionListName(@Param("pr_name") String searchName,@Param("cri") Criteria cri);
	/*
	ArrayList<AuctionVO> selectAuctionListStart(String searchName, Criteria cri);

	ArrayList<AuctionVO> selectAuctionListEnd(String searchName, Criteria cri);
	*/

	int selectAuctionTotalCountName(@Param("pr_name") String searchName);
	/*
	int selectAuctionTotalCountStart(String searchName);

	int selectAuctionTotalCountEnd(String searchName);
	*/
	ArrayList<ReportCategoryVO> selectReportCategory();

	int insertReport(@Param("r")ReportVO report);
	
	int insertMessage(@Param("m")MessageVO note);
	
	ArrayList<AuctionRecordVO> selectAuctionRecord(int auctionNum);

	MemberVO selectMember(String id); 

	MembershipLevelVO selectMembership(String levelName);

	VirtualAccountVO selectAccount(String id);

	void insertAuctionRecord(@Param("p")double price, @Param("i")String id, @Param("n")int auctionNum);

	AuctionVO selectAuction(int num); 

	ProductVO selectProduct(int productCode);

	MemberVO selectSeller(String sellerId);

	SellerLikeVO selectSellerLike(@Param("userId")String userId, @Param("sellerId")String sellerId);

	void insertSellerLike(@Param("userId")String userId, @Param("sellerId")String sellerId, @Param("num")int num);

	void updateSellerLike(@Param("s")SellerLikeVO table, @Param("sellerLikeState")int sellerLikeState);

	ProductLikeVO selectProductLike(@Param("productCode")int productCode, @Param("userId")String userId);

	void insertProductLike(@Param("productCode")int productCode, @Param("userId")String userId, @Param("num")int num);

	void updateProductLike(@Param("p")ProductLikeVO table, @Param("productLikeState")int productLikeState);

	void insertAuctionRecord2(@Param("date")String au_start_day, @Param("price")int pr_start_price, @Param("id")String me_id, @Param("num")int au_num);

	void updateAuction(@Param("a")AuctionVO auction);

	void updateProductTwo(@Param("p")ProductVO product);

	ArrayList<BoardListVO> selectBoardList(String me_id);

	void insertWithdraw(@Param("s")double sum, @Param("b")String bidder);

	void updateVirtualAccount(@Param("b") String bidder, @Param("a") double afterAmount);

	void insertOrder(@Param("a") String auctionBidder, @Param("n") int num);

	AuctionOrderVO selectOrder(int num);

	void insertDelivery(@Param("a")int ao_num, @Param("b")int bl_num);

	ChattingVO selectChatting(int au_num);

	void insertChatting(int au_num);

	void insertChattingRecord(@Param("m")String message, @Param("s")String sender, @Param("r")String room);

	ArrayList<FileVO> selectFile(int productCode);

	DeliveryVO selectDelivery(int ao_num);

	void updateDelivery(@Param("a")int ao_num, @Param("b")int bl_num);

	StoreVO selectStore(@Param("id") String id);

	ArrayList<ProductVO> selectProductList(@Param("st_num") int st_num, @Param("cri") Criteria cri);

	int getProductTotalCount(@Param("st_num")int st_num);
}
