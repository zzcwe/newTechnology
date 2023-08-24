package kr.th.auction.service;

import java.util.ArrayList;

import kr.th.auction.vo.ProductLargeCategoryVO;

public interface AdminService {

	ArrayList<ProductLargeCategoryVO> selectLargeCategory();

}
