package kr.th.auction.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.th.auction.dao.AdminDAO;
import kr.th.auction.dao.ProductDAO;
import kr.th.auction.pagination.Criteria;
import kr.th.auction.pagination.PageMaker;
import kr.th.auction.service.ProductService;
import kr.th.auction.utils.MessageUtils;
import kr.th.auction.vo.FileVO;
import kr.th.auction.vo.MemberVO;
import kr.th.auction.vo.ProductCategoryVO;
import kr.th.auction.vo.ProductLargeCategoryVO;
import kr.th.auction.vo.ProductMiddleCategoryVO;
import kr.th.auction.vo.ProductSmallCategoryVO;
import kr.th.auction.vo.ProductVO;
import kr.th.auction.vo.StoreVO;

@Controller
public class ProductController {
	
	@Autowired
	ProductService productService;
	@Autowired
	AdminDAO adminDao;
	@Autowired
	ProductDAO productDao;
	
	@RequestMapping(value = "/product/register", method = RequestMethod.GET)
 	public ModelAndView registerGet(ModelAndView mv, HttpSession session) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		StoreVO store = productService.selectStored(user.getMe_id());
		ArrayList<ProductLargeCategoryVO> largeCategory = adminDao.selectLargeCategory();
		mv.addObject("largeCategory", largeCategory);
		mv.addObject("store", store);
		mv.setViewName("/product/register");
		return mv;
	}
	@RequestMapping(value = "/product/register", method = RequestMethod.POST)
 	public ModelAndView registerPost(ModelAndView mv, ProductVO product, HttpServletResponse response, MultipartFile []files)  throws IOException {
		
		System.out.println(product); //pr_code = 0 
		boolean res = productService.insertProduct(product, files);
		System.out.println(product); //pr_code ->DB들어갔다가 나온 값으로 수정
		if(product != null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('상품이 등록되었습니다.');location.href='/auction/product/register'</script>");
			out.flush();
		}
		mv.setViewName("redirect:/product/register");
		return mv;
	}
	@ResponseBody
	@RequestMapping(value = "/check/store", method=RequestMethod.POST)
	public Map<String, Object> checkStore(@RequestBody StoreVO store) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		boolean res = productService.checkStore(store);
		map.put("res", res);
		return map;
	}
	@RequestMapping(value = "/create/store", method = RequestMethod.POST)
	public ModelAndView createStore(ModelAndView mv, StoreVO store, HttpSession session) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		String userId = user.getMe_id();		
		productService.createStore(store, userId);
		mv.setViewName("redirect:/product/register");
		return mv;
	}
	@ResponseBody
	@RequestMapping(value = "/select/middle/category", method = RequestMethod.POST)
	public Map<String, ArrayList<ProductMiddleCategoryVO>> selectMiddle(@RequestBody int plcNum){
		HashMap<String, ArrayList<ProductMiddleCategoryVO>> map = new HashMap<String, ArrayList<ProductMiddleCategoryVO>>();
		ArrayList<ProductMiddleCategoryVO> middleCategory = productDao.selectMiddleCategory(plcNum);
		map.put("middleCategory", middleCategory);
		return map;
	}
	@ResponseBody
	@RequestMapping(value = "/select/small/category", method = RequestMethod.POST)
	public Map<String, ArrayList<ProductSmallCategoryVO>> selectSmall(@RequestBody int pmcNum){
		HashMap<String, ArrayList<ProductSmallCategoryVO>> map = new HashMap<String, ArrayList<ProductSmallCategoryVO>>();
		ArrayList<ProductSmallCategoryVO> smallCategory = productDao.selectSmallCategory(pmcNum);
		map.put("smallCategory", smallCategory);
		return map;
	}
	@ResponseBody
	@RequestMapping(value = "/select/product/category", method = RequestMethod.POST)
	public Map<String, ArrayList<ProductCategoryVO>> selectProduct(@RequestBody int pscNum){
		HashMap<String, ArrayList<ProductCategoryVO>> map = new HashMap<String, ArrayList<ProductCategoryVO>>();
		ArrayList<ProductCategoryVO> productCategory = productDao.selectCategory(pscNum);
		map.put("productCategory", productCategory);
		return map;
	}
	@RequestMapping(value = "/product/list", method = RequestMethod.GET)
	public ModelAndView productListGet(ModelAndView mv, ProductVO product, Criteria cri) {
		ArrayList<ProductVO> productList = new ArrayList<ProductVO>();
		productList = productService.getProduct(cri);
		int totalCount = productService.getProductTotalCount();
			PageMaker pm = new PageMaker(totalCount, 3, cri);
		mv.addObject("productList", productList);
		mv.addObject("pm", pm);
		mv.setViewName("/product/list");
		return mv;
	}
	@RequestMapping(value = "/product/list", method = RequestMethod.POST)
	public ModelAndView productListPost(ModelAndView mv, String searchName, String searchCategory, Criteria cri) {
		System.out.println(searchName);
		System.out.println(searchCategory);
		int num = Integer.parseInt(searchCategory);
		ArrayList<ProductVO> productList = new ArrayList<ProductVO>();
		productList = productService.getProduct(num, searchName, cri);
		int totalCount = productService.getProductTotalCount(num, searchName);
		PageMaker pm = new PageMaker(totalCount, 3, cri);
		System.out.println(productList);
		System.out.println(totalCount);
		mv.addObject("productList", productList);
		mv.addObject("pm", pm);
		mv.setViewName("/product/list");
		return mv;
	}
	// 상품 상세 페이지
    @RequestMapping(value="/product/detail/{pr_code}", method=RequestMethod.GET)
    public ModelAndView  productDetail(ModelAndView mv, 
    		@PathVariable("pr_code") int pr_code, HttpSession session) {
    	ProductVO product = productService.getProduct(pr_code);
    	ArrayList<FileVO> files = productService.getFileList(pr_code);
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	StoreVO store = productService.selectStored(user.getMe_id());
    	mv.addObject("store", store);
    	mv.addObject("product", product);
    	mv.addObject("files", files);
    	mv.setViewName("/product/detail");
    	return mv;
    }
    //상품 수정 페이지
    @RequestMapping(value = "/product/update/{pr_code}", method=RequestMethod.GET)
	public ModelAndView productUpdate(ModelAndView mv,
			@PathVariable("pr_code")int pr_code) {
    	mv.setViewName("/product/update");
    	ProductVO product = productService.getProduct(pr_code);
		ArrayList<FileVO> files = productService.getFileList(pr_code);
		mv.addObject("product", product);
		mv.addObject("files", files);
		return mv;
    }
    @RequestMapping(value = "/product/update/{pr_code}", method=RequestMethod.POST)
	public ModelAndView productUpdatePost(ModelAndView mv,
			@PathVariable("pr_code")int pr_code, ProductVO product,
			MultipartFile []files, int [] fileNums, HttpServletResponse response) {
		if(productService.updateProduct(product, files, fileNums)) {
			MessageUtils.alertAndMovePage(response, 
					"게시글을 수정했습니다.", "/auction", 
					"/product/detail/"+pr_code);
		}else {
			MessageUtils.alertAndMovePage(response, 
					"게시글을 수정하지 못했습니다.", "/onAirAuction", 
					"/product/list");
		}
		return mv;
	}
 // 상품 상세페이지 - 삭제
 	@RequestMapping(value = "/product/delete/{pr_code}", method=RequestMethod.GET)
 	public ModelAndView productDelete(ModelAndView mv, 
 			@PathVariable("pr_code")int pr_code,
 			HttpServletResponse response) {
 		boolean res = productService.deleteProduct(pr_code);
 		if(res) {
 			MessageUtils.alertAndMovePage(response, 
 					"게시글을 삭제했습니다.", "/auction", "/product/list");
 		}else {
 			MessageUtils.alertAndMovePage(response, 
 					"작성자가 아니거나 존재하지 않은 게시글입니다.", "/auction", 
 					"/product/detail/"+pr_code);
 		}
 		return mv;
 	}
    
}
