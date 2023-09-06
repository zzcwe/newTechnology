package kr.th.auction.service;

import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.th.auction.dao.AuctionDAO;
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


@Service
public class AuctionServiceImp implements AuctionService{
	
	@Autowired
	AuctionDAO auctionDao;

	@Override
	public ArrayList<ProductStoreVO> selectPossibleProductList(MemberVO user) {
		
		return auctionDao.selectPossibleProductList(user.getMe_id(), 0);
		
	}

	@Override
	public boolean insertAuction(AuctionVO auction) {
		if(auctionDao.insertAuction(auction)) {
			//경매에 등록되면 선택된 상품의 등록상태를 바꿔준다.
			auctionDao.updateProduct(auction.getAu_pr_code());
			return true;
		}
		return false;
	}

	@Override
	public ArrayList<AuctionVO> getOnAirAuctionList(Criteria cri) {
		//실시간 경매 리스트 검색
		return auctionDao.selectOnAirAuctionList(cri);
	}

	@Override
	public int getOnAirAuctionTotalCount() {
		return auctionDao.selectOnAirAuctionTotalCount();
	}

	@Override
	public ArrayList<AuctionVO> getAuction(int searchCategory, String searchName, Criteria cri) {
		System.out.println(searchCategory);
		System.out.println(searchName);
		if(searchCategory == 1) {
			System.out.println("실행1");
			return auctionDao.selectAuctionListName(searchName, cri);
		}else if(searchCategory == 2) {
			System.out.println("실행2");
			//return auctionDao.selectAuctionListStart(searchName, cri);
		}else if(searchCategory == 3) {
			System.out.println("실행3");
			//return auctionDao.selectAuctionListEnd(searchName, cri);
		}
		return null;
	}

	@Override
	public int getAuctionTotalCount(int searchCategory, String searchName) {
		if(searchCategory == 1) {
			System.out.println("실행1");
			return auctionDao.selectAuctionTotalCountName(searchName);
		}else if(searchCategory == 2) {
			System.out.println("실행2");
			//return auctionDao.selectAuctionTotalCountStart(searchName);
		}else if(searchCategory == 3) {
			System.out.println("실행3");
			//return auctionDao.selectAuctionTotalCountEnd(searchName);
		}
		return 0;
	}
	
	@Override
	public ArrayList<ReportCategoryVO> selectReportCategory(){
		return auctionDao.selectReportCategory();
	}
	@Override
	public boolean insertReport(ReportVO report) {
		if(report == null)
			return false;
		if(auctionDao.insertReport(report) != 0)
			return true;
		return false;
	}
	@Override
	public boolean insertMessage(MessageVO message) {
		if(message.getMe_content() == ""||message.getMe_title()=="")//수정해야함
			return false;
		if(auctionDao.insertMessage(message) != 0)
			return true;
		return false;
	}
	@Override
	public ArrayList<AuctionRecordVO> selectAuctionRecord(String auctionStart, int productPrice, String sellerId, int auctionNum){
		ArrayList<AuctionRecordVO> a = auctionDao.selectAuctionRecord(auctionNum);
		if(a.size() == 0) {
			insertAuctionRecord(auctionStart, productPrice, sellerId, auctionNum);
		}
		a = auctionDao.selectAuctionRecord(auctionNum);
		return a;
	}
	@Override
	public MemberVO getUser(String me_id) { //나중에 삭제
		
		return auctionDao.selectMember(me_id);
	}
	@Override
	public boolean insertBid(double price, int expense, VirtualAccountVO userAccount, MemberVO user, int auctionNum) {
		double a = userAccount.getVa_holding_amount(); 
		double b = price + (price * expense * 0.001);
		String id = user.getMe_id();
		if(b > a) {
			System.out.println("보유잔액이 부족합니다.");
			return false;
		}
		else if (b <= a) {
			System.out.println("입찰되었습니다.");
			auctionDao.insertAuctionRecord(price, id, auctionNum);
			return true;
		}
		return false;
	}
	@Override
	public MembershipLevelVO selectMebership(String levelName) {
		
		return auctionDao.selectMembership(levelName);
	}
	@Override
	public VirtualAccountVO selectAccount(String id) {
		
		return auctionDao.selectAccount(id);
	}
	@Override
	public AuctionVO getAuction(int num) { 
		
		return auctionDao.selectAuction(num);
	}
	@Override
	public ProductVO selectProduct(int productCode) {
		
		return auctionDao.selectProduct(productCode);
	}
	@Override
	public MemberVO selectSeller(String sellerId) {
		
		return auctionDao.selectSeller(sellerId);
	}
	@Override
	public boolean timeChange(Date a, Date b) {
		SimpleDateFormat date = new SimpleDateFormat("yyMMddHHmmss");
		String auctionOpenTime = date.format(a);
		String now = date.format(b);
		System.out.println(auctionOpenTime);
		System.out.println(now);
		//a와 b를 비교해서 a가 더 크면 false, b가 더 크면 true를 리턴
		try{
            long number1 = Long.parseLong(auctionOpenTime);
            long number2 = Long.parseLong(now);
            
	            if(number1 <= number2) {
	            	return true;
	            }else if(number1 > number2) {
	            	return false;
	            }
        }
        catch (NumberFormatException ex){
            ex.printStackTrace();
        }
		return false;
	}
	@Override
	public SellerLikeVO selectSellerLike(String userId, String sellerId) {
		return auctionDao.selectSellerLike(userId, sellerId);
	}
	@Override
	public void insertSellerLike(String userId, String sellerId, int num) {
		auctionDao.insertSellerLike(userId, sellerId, num);
	}
	@Override
	public void updateSellerLike(String userId, String sellerId, int sellerLikeState) {
		SellerLikeVO table = auctionDao.selectSellerLike(userId, sellerId);
		if(table.getSl_state() == 0) {
			auctionDao.updateSellerLike(table, sellerLikeState);
		}else if(table.getSl_state() == 1) {
			auctionDao.updateSellerLike(table, sellerLikeState);
		}
		
	}
	@Override
	public ProductLikeVO selectProductLike(int productCode, String userId) {
		return auctionDao.selectProductLike(productCode, userId);
	}
	@Override
	public void insertProductLike(int productCode, String userId, int num) {
		auctionDao.insertProductLike(productCode, userId, num);
		
	}
	@Override
	public void updateProductLike(int productCode, String userId, int productLikeState) {
		ProductLikeVO table = auctionDao.selectProductLike(productCode, userId);
		if(table.getPl_state() == 0) {
			auctionDao.updateProductLike(table, productLikeState);
		}else if(table.getPl_state() == 1) {
			auctionDao.updateProductLike(table, productLikeState);
		}
		
	}
	@Override
	public String endTime(AuctionRecordVO lastRecord, AuctionVO auction) {
		String dateStr = lastRecord.getAr_bid_time();
		SimpleDateFormat date1 = new SimpleDateFormat("HH:mm:ss");
		dateStr = dateStr.replaceAll("[^0-9]", "");
		dateStr = dateStr.substring(8);
		int number = Integer.parseInt(dateStr);
		int time = auction.getAu_limit_bid_time();
		int sum = number + time;
		int second = sum % 100;
		int min = sum / 100 % 100;
		int hour = sum / 10000 % 100;
		if(second >= 60) {
			second = second - 60;
			min = min + 1;
		}
		if(min >= 60) {
			min = min - 60;
			hour = hour + 1;
		}
		if(hour >= 24) {
			hour = 100;
		}
		sum = second + min*100 + hour*10000;
		dateStr = dateStr.valueOf(sum);
		if(dateStr.length() == 7) {
			dateStr = dateStr.substring(1);
		}
		StringBuffer bd = new StringBuffer();
		bd.append(dateStr);
		if(bd.length() == 6) {
			bd.insert(2, "시");
			bd.insert(5, "분");
			bd.insert(8, "초");
		}
		if(bd.length() == 5) {
			bd.insert(1, "시");
			bd.insert(4, "분");
			bd.insert(7, "초");
		}
		if(bd.length() == 4) {
			bd.insert(0,"00");
			bd.insert(2,"시");
			bd.insert(5,"분");
			bd.insert(8,"초");
			
		}
		if(bd.length() == 3) {
			bd.insert(0,"00");
			bd.insert(2,"시");
			bd.insert(3,"0");
			bd.insert(5,"분");
			bd.insert(8, "초");
		}
		if(bd.length() == 2) {
			bd.insert(0,"00");
			bd.insert(2,"시");
			bd.insert(3,"00");
			bd.insert(5,"분");
			bd.insert(8, "초");
		}
		if(bd.length() == 1) {
			bd.insert(0,"00");
			bd.insert(2,"시");
			bd.insert(3,"00");
			bd.insert(5,"분");
			bd.insert(7, "0");
			bd.insert(8, "초");
		}
		dateStr = bd.substring(0);
		return dateStr;
	}
	@Override
	public Map<String, Object> sellerLike(int sellerLikeState, String userId, String sellerId) {
		boolean res;
		Map<String, Object> map = new HashMap<String, Object>();
		if(sellerLikeState == 0) {
			//판매자좋아요테이블에서 상태를 1로 바꿔주고 map.put("sellerLike",sl_state)
			sellerLikeState = 1;
			updateSellerLike(userId, sellerId, sellerLikeState);
			res = true;
			map.put("sellerLikeState", sellerLikeState);
			map.put("res", res);
		}else if(sellerLikeState == 1) {
			//반대로 0으로
			sellerLikeState = 0;
			updateSellerLike(userId, sellerId, sellerLikeState);
			res = false;
			map.put("sellerLikeState",sellerLikeState);
			map.put("res", res);
		}
		return map;
	}
	@Override
	public Map<String, Object> productLike(int productCode, String userId, int productLikeState) {
		boolean res;
		Map<String, Object> map = new HashMap<String, Object>();
		if(productLikeState == 0) {
			//판매자좋아요테이블에서 상태를 1로 바꿔주고 map.put("sellerLike",sl_state)
			productLikeState = 1;
			updateProductLike(productCode, userId, productLikeState);
			res = true;
			map.put("productLikeState", productLikeState);
			map.put("res", res);
		}else if(productLikeState == 1) {
			//반대로 0으로
			productLikeState = 0;
			updateProductLike(productCode, userId, productLikeState);
			res = false;
			map.put("productLikeState", productLikeState);
			map.put("res", res);
		}
		return map;
	}
	@Override
	public void insertAuctionRecord(String auctionStart, int pr_start_price, String me_id, int au_num) {
		auctionDao.insertAuctionRecord2(auctionStart, pr_start_price,  me_id, au_num);
	}
	@Override
	public AuctionRecordVO lastAuctionRecord(int auctionNum) {
		ArrayList<AuctionRecordVO> recordList = auctionDao.selectAuctionRecord(auctionNum);
		int a = recordList.size() - 1;
		AuctionRecordVO L = recordList.get(a);
		return L;
	}
	@Override
	public boolean finishAuction(int intNow, int intEnd2, AuctionVO auction) {
		if(intNow > intEnd2 || auction.getAu_final_date() != null) {
			if(auction.getAu_final_date() == null) {
			System.out.println("종료시각입력실행");
			auctionDao.updateAuction(auction);
			ProductVO product =	auctionDao.selectProduct(auction.getAu_pr_code());
			auctionDao.updateProductTwo(product);
			AuctionRecordVO last = lastAuctionRecord(auction.getAu_num());
			String bidder = last.getAr_me_id();
			int auctionPrice = last.getAr_bid_price();
			VirtualAccountVO bidderAccount = selectAccount(bidder);
			MemberVO bidderUser =  getUser(bidder);
			String levelName = bidderUser.getMe_ml_name();
			MembershipLevelVO level = selectMebership(levelName);
			int expense = level.getMl_expense();
			double sum = auctionPrice + (auctionPrice * expense * 0.001);
			double amount = bidderAccount.getVa_holding_amount();
			double afterAmount = amount - sum;
			auctionDao.insertWithdraw(sum, bidder);
			auctionDao.updateVirtualAccount(bidder, afterAmount);
			}
			return true;
		}
		return false;
	}
	@Override
	public ArrayList<BoardListVO> selectBoardList(String me_id) {
		
		return auctionDao.selectBoardList(me_id);
	}
	@Override
	public AuctionOrderVO insertOrder(AuctionVO auction) {
		int num = auction.getAu_num();
		AuctionRecordVO last = lastAuctionRecord(auction.getAu_num());
		String auctionBidder = last.getAr_me_id();
		auctionDao.insertOrder(auctionBidder, num);
		AuctionOrderVO order = auctionDao.selectOrder(num);
		return order;
	}
	@Override
	public void insertDelivery(int ao_num, int bl_num) {
		DeliveryVO delivery = auctionDao.selectDelivery(ao_num); //여기서 에러가 남 
		System.out.println(delivery);
		if(delivery == null) {
			auctionDao.insertDelivery(ao_num, bl_num);
			System.out.println("인설트실행");
		}
		else {
			auctionDao.updateDelivery(ao_num, bl_num);
			System.out.println("업데이트실행");
		}
	}
	@Override
	public ChattingVO selectChatting(int au_num) {
		ChattingVO channel = auctionDao.selectChatting(au_num);
		if(channel == null) {
			auctionDao.insertChatting(au_num);
			channel = auctionDao.selectChatting(au_num);
		}
		return channel;
	}
	@Override
	public void insertChattingRecord(String message, String sender, String room) {
		auctionDao.insertChattingRecord(message, sender, room);
		
	}
	@Override
	public ArrayList<FileVO> selectFile(int productCode) {
		
		return auctionDao.selectFile(productCode);
	}
	@Override
	public AuctionOrderVO selectAuctionOrder(int au_num) {
		
		return auctionDao.selectOrder(au_num);
	}
	@Override
	public DeliveryVO selectDelivery(int ao_num) {
		
		return auctionDao.selectDelivery(ao_num);
	}
	@Override
	public void updateDelivery(int ao_num, int bl_num) {
		auctionDao.updateDelivery(ao_num, bl_num);
		
	}

	@Override
	public StoreVO selectStore(String id) {
		return auctionDao.selectStore(id);
	}

	@Override
	public ArrayList<ProductVO> selectProductList(int st_num, Criteria cri) {
		return auctionDao.selectProductList(st_num, cri);
	}

	@Override
	public int getProductTotalCount(int st_num) {
		
		return auctionDao.getProductTotalCount(st_num);
	}

	
	
}
