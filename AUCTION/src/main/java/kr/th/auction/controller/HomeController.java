package kr.th.auction.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.th.auction.dao.ProductDAO;
import kr.th.auction.service.ProductService;
import kr.th.auction.vo.FileVO;
import kr.th.auction.vo.ProductVO;


@Controller
public class HomeController {
	
	@Autowired
	ProductService productService;
	@Autowired
	ProductDAO productDao;
	
	@RequestMapping(value = "/")
	public ModelAndView home(ModelAndView mv) {
		ArrayList<ProductVO>clothList = productDao.selectClothProduct("브랜드 패션");
		ArrayList<ProductVO>digitalList = productDao.selectClothProduct("디지털");
		ArrayList<ProductVO>foodList = productDao.selectClothProduct("식품");
		mv.addObject("digitalList", digitalList);
		mv.addObject("foodList", foodList);
		mv.addObject("clothList", clothList);
		getList(clothList, mv, "clothFiles_");
		getList(digitalList, mv, "digitalFiles_");
		getList(foodList, mv, "foodFiles_");
		
		
		/*for(int i = 0; i < clothList.size(); i++) {
			int pr_code = clothList.get(i).getPr_code();
			System.out.println(pr_code);
			ArrayList<FileVO> files = productDao.selectFileList(pr_code);
			mv.addObject("clothFiles_" + i, files);
		} */
		mv.setViewName("/main/home");
		return mv;
	}
	public void getList(ArrayList<ProductVO> list, ModelAndView mv, String name) {
		for(int i = 0; i < list.size(); i++) {
			int pr_code = list.get(i).getPr_code();
			ArrayList<FileVO> files = productDao.selectFileList(pr_code);
			mv.addObject(name + i, files);
		}
	}
	
}
