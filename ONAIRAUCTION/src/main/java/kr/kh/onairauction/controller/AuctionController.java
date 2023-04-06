package kr.kh.onairauction.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import kr.kh.onairauction.service.AuctionService;
import kr.kh.onairauction.vo.NoteBoxVO;
import kr.kh.onairauction.vo.ReportVO;


@Controller
public class AuctionController {
	@Autowired
	AuctionService auctionService;
	
	@RequestMapping(value = "/", method=RequestMethod.GET)
	public ModelAndView home(ModelAndView mv) {
		mv.setViewName("/auction/home");
		System.out.println(auctionService.getEmail("123"));
		System.out.println(auctionService.getReportCategoryName());
		return mv;
	}
	@RequestMapping(value = "/", method=RequestMethod.POST)
	public ModelAndView report(ModelAndView mv, ReportVO report) {
		boolean register = auctionService.register(report);
		mv.setViewName("redirect:/");
		return mv;
	}
	@RequestMapping(value = "/notebox", method=RequestMethod.POST)
	public ModelAndView notebox(ModelAndView mv, NoteBoxVO note) {
		boolean register1= auctionService.registerNote(note);
		mv.setViewName("redirect:/");
		return mv;
	}
	
}
