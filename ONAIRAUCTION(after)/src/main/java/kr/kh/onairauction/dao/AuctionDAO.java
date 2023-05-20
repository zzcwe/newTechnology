package kr.kh.onairauction.dao;

import java.util.ArrayList;
import java.util.Date;

import org.apache.ibatis.annotations.Param;

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

public interface AuctionDAO {
	
	ArrayList<ReportCategoryVO> selectReportCategory();

	int insertReport(@Param("r")ReportVO report);
	
	int insertMessage(@Param("m")MessageVO note);
	
	ArrayList<AuctionRecordVO> selectAuctionRecord(int auctionNum);

	MemberVO selectMember(String id); //나중에 삭제

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

	void updateProduct(@Param("p")ProductVO product);
}