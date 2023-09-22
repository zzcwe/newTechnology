package kr.th.auction.controller;

import java.io.IOException;
import java.io.PrintWriter;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.th.auction.pagination.Criteria;
import kr.th.auction.pagination.PageMaker;
import kr.th.auction.service.AuctionService;
import kr.th.auction.service.ProductService;
import kr.th.auction.vo.AuctionOrderVO;
import kr.th.auction.vo.AuctionRecordVO;
import kr.th.auction.vo.AuctionVO;
import kr.th.auction.vo.BoardListVO;
import kr.th.auction.vo.ChattingVO;
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


@Controller
public class AuctionController {
	
	@Autowired
	AuctionService auctionService;
	
	
	@RequestMapping(value = "/auction/register", method = RequestMethod.GET)
	public ModelAndView auctionRegisterGet(ModelAndView mv, HttpSession session) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		ArrayList<ProductStoreVO> registerPossibleProductList = auctionService.selectPossibleProductList(user);
		mv.addObject("registerPossibleProductList", registerPossibleProductList);
		mv.setViewName("/auction/register");
		return mv;
	}
	@RequestMapping(value = "/auction/register", method = RequestMethod.POST)
	public ModelAndView auctionRegisterPost(ModelAndView mv, AuctionVO auction, HttpServletResponse response) throws IOException{
		
		if(auctionService.insertAuction(auction)) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('경매가 등록되었습니다.');location.href='/auction/auction/register'</script>");
			out.flush();
		}
		mv.setViewName("redirect:/auction/register");
		return mv;
	}
	@RequestMapping(value = "/auction/list", method = RequestMethod.GET)
	public ModelAndView auctionListGet(ModelAndView mv, Criteria cri) {
		ArrayList<AuctionVO> auctionList = auctionService.getOnAirAuctionList(cri);
		int totalCount = auctionService.getOnAirAuctionTotalCount();
		PageMaker pm = new PageMaker(totalCount, 3, cri);
		mv.addObject("auctionList",auctionList);
		mv.addObject("pm", pm);
		mv.setViewName("/auction/list");
		return mv;
	}
	@RequestMapping(value = "/auction/list", method = RequestMethod.POST)
	public ModelAndView auctionListPost(ModelAndView mv, String searchName, String searchCategory, Criteria cri) {
		int num = Integer.parseInt(searchCategory);
		ArrayList<AuctionVO> auctionList = new ArrayList<AuctionVO>();
		auctionList = auctionService.getAuction(num, searchName, cri);
		int totalCount = auctionService.getAuctionTotalCount(num, searchName);
		PageMaker pm = new PageMaker(totalCount, 3, cri);
		mv.addObject("auctionList", auctionList);
		mv.addObject("pm", pm);
		mv.setViewName("/auction/list");
		return mv;
	}
	@RequestMapping(value = "/onairauction/detail/{au_num}", method=RequestMethod.GET)
	public ModelAndView home(ModelAndView mv, HttpSession session, @PathVariable("au_num")int au_num) {
		mv.setViewName("/auction/onairauction");
		
		// 1. 경매번호로 경매불러오고 세션에 저장해주고, 세션에 저장되어있는 유저아이디를 불러와준다.
		AuctionVO auction = auctionService.getAuction(au_num);
		mv.addObject("auction", auction);
		MemberVO user = (MemberVO)session.getAttribute("user"); 
		// 2. 받아온 auction객체의 속성을 통해서 판매자와 상품정보를 서버와 세션에 저장해준다. if(user != null) //화면에서도 C:if로 처리해주기
		if(user != null) {
			int productCode = auction.getAu_pr_code();
			String sellerId = auction.getAu_me_id();
			ProductVO auctionProduct = auctionService.selectProduct(productCode);
			MemberVO auctionSeller = auctionService.selectSeller(sellerId);
			mv.addObject("auctionProduct", auctionProduct);
			mv.addObject("auctionSeller", auctionSeller); 
			int price = auctionProduct.getPr_start_price();
			int auctionNum = auction.getAu_num();
			// 3. 현재페이지에서 사용하기 위한 요소들을 찾아서  mv.addObject해준다.
			ArrayList<ReportCategoryVO> reportCategory = auctionService.selectReportCategory();
			ArrayList<AuctionRecordVO> auctionRecordList = auctionService.selectAuctionRecord(auction.getAu_start_date(), price, sellerId, auctionNum);
			ArrayList<BoardListVO> boardList = auctionService.selectBoardList(user.getMe_id());
			ArrayList<FileVO> file = auctionService.selectFile(productCode);
			mv.addObject("files", file);
			mv.addObject("boardList", boardList);
			mv.addObject("reportCategory", reportCategory);
			mv.addObject("auctionRecordList", auctionRecordList);
			int lastAuctionRecordIndex = auctionRecordList.size()-1;
			AuctionRecordVO lastAuctionRecord = auctionRecordList.get(lastAuctionRecordIndex);
			mv.addObject("lastAuctionRecord", lastAuctionRecord);
			SellerLikeVO sellerLikeState = auctionService.selectSellerLike(user.getMe_id(), auctionSeller.getMe_id());
			if(sellerLikeState == null && user != null) {
				auctionService.insertSellerLike(user.getMe_id(), auctionSeller.getMe_id(), 0);
				sellerLikeState = auctionService.selectSellerLike(user.getMe_id(), auctionSeller.getMe_id());
				int state = sellerLikeState.getSl_state();
				mv.addObject("sellerLikeState",state);
			}else if(sellerLikeState != null && user != null) {
				int state = sellerLikeState.getSl_state();
				mv.addObject("sellerLikeState",state);
			}
			ProductLikeVO productLikeState = auctionService.selectProductLike(auctionProduct.getPr_code(), user.getMe_id());
			if(productLikeState == null && user != null) {
				auctionService.insertProductLike(auctionProduct.getPr_code(), user.getMe_id(), 0);
				productLikeState = auctionService.selectProductLike(auctionProduct.getPr_code(), user.getMe_id());
				int state = productLikeState.getPl_state();
				mv.addObject("productLikeState",state);
			}else if(productLikeState != null && user != null) {
				int state = productLikeState.getPl_state();
				mv.addObject("productLikeState",state);
			}
			Date nowTime = new Date();
			SimpleDateFormat date = new SimpleDateFormat("yyyy. MM. dd. HH:mm:ss");
			String now = date.format(nowTime);
			mv.addObject("nowTime", now);
			mv.addObject("endTime", "첫 입찰 " + auction.getAu_limit_bid_time() +"초 후에 종료됩니다.");
			if (!lastAuctionRecord.getAr_me_id().equals(auctionSeller.getMe_id())) {
				String end = auctionService.endTime(lastAuctionRecord, auction);
				mv.addObject("endTime", end + "에 종료됩니다.");
			}
			String lol = now.replaceAll("[^0-9]", "");
			lol = lol.substring(8);
			int intNowTime = Integer.parseInt(lol);
			mv.addObject("intNow", intNowTime);
			ChattingVO channel = auctionService.selectChatting(au_num);
			String userId = user.getMe_id();
			int chattingChannel = channel.getCh_num();
			mv.addObject("chattingChannel", chattingChannel); 
			mv.addObject("userId", userId);
		}
		return mv;
		//경매카테고리, 신고카테고리
		
	}
	@ResponseBody
	@RequestMapping(value = "/auctionFinish", method=RequestMethod.POST)
	public Map<String, Object> auctionFinish(@RequestBody Map<String, String> formData, HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();
		String value1 = formData.get("value1");
		int now = Integer.parseInt(value1);
		String value2 = formData.get("value2");
		int end = Integer.parseInt(value2);
		String value3 = formData.get("value3");
		int auctionNum = Integer.parseInt(value3);
		AuctionVO auction = auctionService.getAuction(auctionNum);
		boolean auctionEnd = auctionService.finishAuction(now, end, auction);
		map.put("res", auctionEnd);
		return map;
	}
	
	@RequestMapping(value = "/report", method=RequestMethod.POST)
	public ModelAndView report(ModelAndView mv, ReportVO report, int au_num) {
		boolean register = auctionService.insertReport(report);
		mv.setViewName("redirect:/onairauction/detail/"+ au_num);
		return mv;
	}
	@RequestMapping(value = "/message", method=RequestMethod.POST)
	public ModelAndView message(ModelAndView mv, MessageVO message, int au_num) {
		boolean register = auctionService.insertMessage(message);
		mv.setViewName("redirect:/onairauction/detail/"+au_num);
		return mv;
	}
	@ResponseBody
	@RequestMapping(value = "/delivery", method=RequestMethod.POST)
	public Map<String,Object> delivery(@RequestBody Map<String, String> formData) {
		Map<String, Object> map = new HashMap<String, Object>();
		String one = formData.get("value1");
		String two = formData.get("value2");
		int value1 = Integer.parseInt(one);
		int value2 = Integer.parseInt(two);
		AuctionVO auction = auctionService.getAuction(value2);
		AuctionOrderVO confirm = auctionService.selectAuctionOrder(value2);
		if(confirm == null) {
			AuctionOrderVO order = auctionService.insertOrder(auction);
		}
		AuctionOrderVO order = auctionService.selectAuctionOrder(value2);
		auctionService.insertDelivery(order.getAo_num(), value1);
		map.put("res",true);
		return map;
	}
	@ResponseBody
	@RequestMapping(value = "/auctionBid", method=RequestMethod.POST) //1. 입찰종료 되었을 때, 입찰막기 추가해야함 //2. 새로운입찰이 들어왔을 때, 판매종료시간 리셋해야함
	public Map<String, Object> auctionBid(@RequestBody Map<String, String> formData, HttpSession session){
		String value1 = formData.get("value1");
		double price = Double.parseDouble(value1);
		Map<String, Object> map = new HashMap<String, Object>();
		MemberVO user = (MemberVO)session.getAttribute("user");
		String id = user.getMe_id();
		VirtualAccountVO userAccount = auctionService.selectAccount(id);
		String levelName = user.getMe_ml_name();
		MembershipLevelVO level = auctionService.selectMebership(levelName);
		int expense = level.getMl_expense();
		String three = formData.get("value3");
		int value3 = Integer.parseInt(three);
		AuctionVO auction = auctionService.getAuction(value3);
		System.out.println(auction);
		int auctionNum = auction.getAu_num();
		LocalDateTime auctionOpen = auction.au_start_date;
		//LocalDateTime 타입을 Date 타입으로 바꿔줘야함
		ZoneId zoneId = ZoneId.systemDefault();
		Date auctionOpenTime = Date.from(auctionOpen.atZone(zoneId).toInstant());
		Date serverTime = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yyyy. MM. dd. HH:mm:ss");
		String now = date.format(serverTime);
		String lol = now.replaceAll("[^0-9]", "");
		lol = lol.substring(8);
		int intNowTime = Integer.parseInt(lol);
		boolean bidPossible = auctionService.timeChange(auctionOpenTime, serverTime);
		System.out.println(auction.getAu_final_date());
		if(auction.getAu_final_date() == null) {
			if(bidPossible) {
				boolean res = auctionService.insertBid(price, expense, userAccount, user, auctionNum);
				map.put("res", res);
				AuctionRecordVO lastRecord = auctionService.lastAuctionRecord(auctionNum);
				String lastTime = auctionService.endTime(lastRecord, auction);
				String intEnd = lastTime.replaceAll("[^0-9]", "");
				map.put("intEnd", intEnd);
			}
			map.put("bidPossible", bidPossible);
		}
		return map;
	}
	@ResponseBody
	@RequestMapping(value = "/auctionBidImmediate", method=RequestMethod.POST) 
	public Map<String, Object> auctionBidImmediate(@RequestBody Map<String, String> formData, HttpSession session){
		String value1 = formData.get("value1");
		double price = Double.parseDouble(value1);
		Map<String, Object> map = new HashMap<String, Object>();
		MemberVO user = (MemberVO)session.getAttribute("user");
		String id = user.getMe_id();
		VirtualAccountVO userAccount = auctionService.selectAccount(id);
		String levelName = user.getMe_ml_name();
		MembershipLevelVO level = auctionService.selectMebership(levelName);
		int expense = level.getMl_expense();
		String three = formData.get("value3");
		int value3 = Integer.parseInt(three);
		AuctionVO auction = auctionService.getAuction(value3);
		System.out.println(auction);
		int auctionNum = auction.getAu_num();
		LocalDateTime auctionOpen = auction.au_start_date;
		//LocalDateTime 타입을 Date 타입으로 바꿔줘야함
		ZoneId zoneId = ZoneId.systemDefault();
		Date auctionOpenTime = Date.from(auctionOpen.atZone(zoneId).toInstant());
		Date serverTime = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yyyy. MM. dd. HH:mm:ss");
		String now = date.format(serverTime);
		String lol = now.replaceAll("[^0-9]", "");
		lol = lol.substring(8);
		int intNowTime = Integer.parseInt(lol);
		boolean bidPossible = auctionService.timeChange(auctionOpenTime, serverTime);
		System.out.println(auction.getAu_final_date());
		if(auction.getAu_final_date() == null) {
			if(bidPossible) {
				boolean res = auctionService.insertBid(price, expense, userAccount, user, auctionNum);
				map.put("res", res);
				AuctionRecordVO lastRecord = auctionService.lastAuctionRecord(auctionNum);
				String lastTime = auctionService.endTime(lastRecord, auction);
				String intEnd = lastTime.replaceAll("[^0-9]", "");
				map.put("intEnd", "0");
			}
			map.put("bidPossible", bidPossible);
		}
		return map;
	}
	
	@RequestMapping(value = "/userStore/{id}", method=RequestMethod.GET)
	public ModelAndView Store(ModelAndView mv, @PathVariable("id")String id, Criteria cri) { 
		StoreVO userStore = auctionService.selectStore(id);
		ArrayList<ProductVO> productList = auctionService.selectProductList(userStore.getSt_num(), cri);
		int totalCount = auctionService.getProductTotalCount(userStore.getSt_num());
			PageMaker pm = new PageMaker(totalCount, 3, cri);
		mv.addObject("productList", productList);
		mv.addObject("pm", pm);
		mv.setViewName("/auction/store");
		return mv;
	}
	@ResponseBody
	@RequestMapping(value = "/sellerLike", method=RequestMethod.POST)
	public Map<String, Object> sellerLike(@RequestBody Map<String, String> formData, HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();
		String value = formData.get("value1");
		int value1 = Integer.parseInt(value);
		String value2 = formData.get("value2");
		MemberVO user = (MemberVO)session.getAttribute("user");
		String userId = user.getMe_id();
		map = auctionService.sellerLike(value1, userId, value2);
		return map;
	}
	@ResponseBody
	@RequestMapping(value = "/productLike", method=RequestMethod.POST)
	public Map<String, Object> productLike(@RequestBody Map<String, String> formData, HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();
		String one = formData.get("value1");
		String two = formData.get("value2");
		int value1 = Integer.parseInt(one);
		int value2 = Integer.parseInt(two);
		MemberVO user = (MemberVO)session.getAttribute("user");
		String userId = user.getMe_id();
		map = auctionService.productLike(value2, userId, value1);
		return map;
	}
	@ResponseBody
	@RequestMapping(value = "/chattingJoin", method=RequestMethod.POST) 
	public Map<String, Object> chatting(@RequestBody Map<String, String> formData, HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();
		String message = formData.get("value1");
		String sender = formData.get("value2");
		String channel = formData.get("value3");
		auctionService.insertChattingRecord(message, sender, channel);
		return map;
	}
}
