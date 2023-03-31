package kr.kh.onairauction.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import kr.kh.onairauction.service.AuctionService;


@Controller
public class HomeController {
	@Autowired
	AuctionService auctionService;
	
	@RequestMapping(value = "/")
	public ModelAndView home(ModelAndView mv) {
		mv.setViewName("/auction/home");
		System.out.println(auctionService.getEmail("123"));
		return mv;
	}
	
}
