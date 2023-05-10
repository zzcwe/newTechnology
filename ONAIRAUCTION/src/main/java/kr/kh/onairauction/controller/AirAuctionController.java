package kr.kh.onairauction.controller;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import kr.kh.onairauction.service.AuctionService;
import kr.kh.onairauction.vo2.SellerLikeVO;
import kr.kh.onairauction.vo2.AuctionRecordVO;
import kr.kh.onairauction.vo2.AuctionVO;
import kr.kh.onairauction.vo2.MemberVO;
import kr.kh.onairauction.vo2.MembershipLevelVO;
import kr.kh.onairauction.vo2.MessageVO;
import kr.kh.onairauction.vo2.ProductVO;
import kr.kh.onairauction.vo2.ReportCategoryVO;
import kr.kh.onairauction.vo2.ReportVO;
import kr.kh.onairauction.vo2.VirtualAccountVO;

@RestController
@Controller
public class AirAuctionController {
	@Autowired
	AuctionService auctionService;
	
	
	@RequestMapping(value = "/", method=RequestMethod.GET)
	public ModelAndView home(ModelAndView mv, HttpSession session) {
		mv.setViewName("/auction/home");
		//
		//
		AuctionVO sessionAuction = auctionService.getAuction("seller");//나중에 지울 코드
		MemberVO sessionUser = auctionService.getUser("taehwan");//나중에 지울 코드
		session.setAttribute("auction", sessionAuction);//나중에 지울 코드
		session.setAttribute("user", sessionUser);//나중에 지울 코드
		System.out.println(sessionUser);
		//경매번호와 유저정보가 넘어온다고 가정
		// 1. 세션에 있는 경매번호와 사용자를 받아 서버와 mv에 저장해준다. 
		AuctionVO auction = (AuctionVO)session.getAttribute("auction");
		MemberVO user = (MemberVO)session.getAttribute("user");
		mv.addObject("auction", auction);
		mv.addObject("user", user);
		// 2. 받아온 auction객체의 속성을 통해서 판매자와 상품정보를 서버와 세션에 저장해주고, mv에 addObject해준다.
		int productCode = auction.getAu_pr_code();
		String sellerId = auction.getAu_me_id();
		ProductVO auctionProduct = auctionService.selectProduct(productCode);
		MemberVO auctionSeller = auctionService.selectSeller(sellerId);
		session.setAttribute("auctionProduct", auctionProduct);
		session.setAttribute("auctionSeller", auctionSeller);
		mv.addObject("auctionProduct", auctionProduct);
		mv.addObject("auctionSeller", auctionSeller);
		// 3. mv에 보여주기 위해 필요한 요소를 서버에서 찾아서 addObject해준다.
		ArrayList<ReportCategoryVO> reportCategory = auctionService.selectReportCategory();
		ArrayList<AuctionRecordVO> auctionRecordList = auctionService.selectAuctionRecord(1);
		mv.addObject("reportCategory", reportCategory);
		int lastAuctionRecordIndex = auctionRecordList.size()-1;
		AuctionRecordVO lastAuctionRecord = auctionRecordList.get(lastAuctionRecordIndex);
		mv.addObject("lastAuctionRecord", lastAuctionRecord);
		SellerLikeVO likeState = auctionService.selectSellerLike(user.getMe_id(), auctionSeller.getMe_id());
		if(likeState == null) {
			auctionService.insertSellerLike(user.getMe_id(), auctionSeller.getMe_id(), 0);
			likeState = auctionService.selectSellerLike(user.getMe_id(), auctionSeller.getMe_id());
			int state = likeState.getSl_state();
			mv.addObject("likeState",state);
		}else if(likeState != null) {
			int state = likeState.getSl_state();
			mv.addObject("likeState",state);
		}
		System.out.println(likeState);
		return mv;
		//DB에 저장되어 있는 데이터 - 구매자, 판매자, 상품, 경매, 경매카테고리, 경매기록(처음 하나의 기록), 신고카테고리
		
	}
	@RequestMapping(value = "/auctionRecord", method=RequestMethod.GET)
	public ArrayList<AuctionRecordVO> getAuctionRecord() {
		ArrayList<AuctionRecordVO> list = auctionService.selectAuctionRecord(1);
		return list; //나중에 삭제
	}
	
	@RequestMapping(value = "/report", method=RequestMethod.POST)
	public ModelAndView report(ModelAndView mv, ReportVO report) {
		boolean register = auctionService.insertReport(report);
		mv.setViewName("redirect:/");
		return mv;
	}
	@RequestMapping(value = "/message", method=RequestMethod.POST)
	public ModelAndView message(ModelAndView mv, MessageVO message) {
		boolean register = auctionService.insertMessage(message);
		System.out.println(register);
		mv.setViewName("redirect:/");
		return mv;
	}
	@RequestMapping(value = "/ajaxData", method = RequestMethod.GET)
	public ModelAndView ajaxData(ModelAndView mv,HttpSession session) {
		mv.setViewName("auction/ajaxdata");
		ArrayList<AuctionRecordVO> auctionRecordList = auctionService.selectAuctionRecord(1);
		int lastAuctionRecordIndex = auctionRecordList.size()-1;
		AuctionRecordVO lastAuctionRecord = auctionRecordList.get(lastAuctionRecordIndex);
		Date nowTime = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yyyy. MM. dd. HH:mm:ss");
		String now = date.format(nowTime);
		mv.addObject("nowTime", now);
		mv.addObject("auctionRecordList", auctionRecordList);
		mv.addObject("lastAuctionRecord", lastAuctionRecord);
		return mv;
	}
	@RequestMapping(value = "/auctionBid", method=RequestMethod.POST)
	public Map<String, Object> auctionBid(@RequestBody Double price, HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();
		MemberVO user = (MemberVO)session.getAttribute("user");
		String id = user.getMe_id();
		VirtualAccountVO userAccount = auctionService.selectAccount(id);
		String levelName = user.getMe_ml_name();
		MembershipLevelVO level = auctionService.selectMebership(levelName);
		int expense = level.getMl_expense();
		AuctionVO auction = (AuctionVO)session.getAttribute("auction");
		int auctionNum = auction.getAu_num();
		Date auctionOpenTime = auction.au_start_date;
		Date serverTime = new Date();
		boolean bidPossible2 = auctionOpenTime.after(serverTime);//OpenTime이 serverTime을 지났으면 true
		boolean bidPossible = auctionService.timeChange(auctionOpenTime, serverTime);
		//경매시작시간이 되기전에 입찰하기 안되게 코드짜기
		System.out.println(bidPossible);
		System.out.println(bidPossible2);
		if(bidPossible) {
			boolean res = auctionService.insertBid(price, expense, userAccount, user, auctionNum);
			System.out.println(res);
			map.put("res", res);
			AuctionRecordVO record = new AuctionRecordVO();
			double nextPrice = record.getAr_next_bid_price(price);
			System.out.println(nextPrice);
			map.put("nextPrice", nextPrice);
		}
		map.put("bidPossible", bidPossible);
		return map;
	}
	@RequestMapping(value = "/userStore", method=RequestMethod.GET)
	public ModelAndView Store(ModelAndView mv) { // @PathVariable("store_num")int store_num
		mv.setViewName("auction/store");
		return mv;
	}
	@RequestMapping(value = "/sellerLike", method=RequestMethod.POST)
	public Map<String, Object> sellerLike(@RequestBody int sellerLikeState, HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();
		MemberVO user = (MemberVO)session.getAttribute("user");
		String userId = user.getMe_id();
		MemberVO seller = (MemberVO)session.getAttribute("auctionSeller");
		String sellerId = seller.getMe_id();
		if(sellerLikeState == 0) {
			//판매자좋아요테이블에서 상태를 1로 바꿔주고 map.put("sellerLike",sl_state)
			sellerLikeState = 1;
			auctionService.updateSellerLike(userId, sellerId, sellerLikeState);
			boolean res = true;
			map.put("sellerLikeState", sellerLikeState);
			map.put("res", res);
		}else if(sellerLikeState == 1) {
			//반대로 0으로
			sellerLikeState = 0;
			auctionService.updateSellerLike(userId, sellerId, sellerLikeState);
			boolean res = false;
			map.put("sellerLikeState",sellerLikeState);
			map.put("res", res);
		}
		return map;
	}
	
}