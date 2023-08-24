package kr.th.auction.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.th.auction.dao.AdminDAO;
import kr.th.auction.service.AdminService;
import kr.th.auction.vo.ProductCategoryVO;
import kr.th.auction.vo.ProductLargeCategoryVO;
import kr.th.auction.vo.ProductMiddleCategoryVO;
import kr.th.auction.vo.ProductSmallCategoryVO;

@Controller
public class AdminController {
	
	@Autowired
	AdminService adminService;
	@Autowired
	AdminDAO adminDao;
	
	@RequestMapping(value = "/admin/category", method = RequestMethod.GET)
	public ModelAndView adminCategory(ModelAndView mv) {
		ArrayList<ProductLargeCategoryVO> largeCategory = adminService.selectLargeCategory();
		mv.addObject("largeCategory", largeCategory);
		ArrayList<ProductMiddleCategoryVO> middleCategory = adminDao.selectMiddleCategory();
		mv.addObject("middleCategory", middleCategory);
		ArrayList<ProductSmallCategoryVO> smallCategory = adminDao.selectSmallCategory();
		mv.addObject("smallCategory", smallCategory);
		mv.setViewName("/admin/category");
		return mv;
	}
	@RequestMapping(value = "/admin/category/large", method = RequestMethod.POST)
	public ModelAndView largeCategory(ModelAndView mv, ProductLargeCategoryVO newCategory) {
		adminDao.insertLargeCategory(newCategory);
		mv.setViewName("redirect:/admin/category");
		return mv;
	}
	@RequestMapping(value = "/admin/category/middle", method = RequestMethod.POST)
	public ModelAndView middleCategory(ModelAndView mv, ProductMiddleCategoryVO newCategory) {
		adminDao.insertMiddleCategory(newCategory);
		mv.setViewName("redirect:/admin/category");
		return mv;
	}
	@RequestMapping(value = "/admin/category/small", method = RequestMethod.POST)
	public ModelAndView smallCategory(ModelAndView mv, ProductSmallCategoryVO newCategory) {
		adminDao.insertSmallCategory(newCategory);
		mv.setViewName("redirect:/admin/category");
		return mv;
	}
	@RequestMapping(value = "/admin/category/final", method = RequestMethod.POST)
	public ModelAndView finalCategory(ModelAndView mv, ProductCategoryVO newCategory) {
		adminDao.insertFinalCategory(newCategory);
		mv.setViewName("redirect:/admin/category");
		return mv;
	}
	
}
