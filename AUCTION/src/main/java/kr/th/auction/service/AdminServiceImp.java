package kr.th.auction.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.th.auction.dao.AdminDAO;
import kr.th.auction.vo.ProductLargeCategoryVO;

@Service
public class AdminServiceImp implements AdminService{
	@Autowired
	AdminDAO adminDao;

	@Override
	public ArrayList<ProductLargeCategoryVO> selectLargeCategory() {
		System.out.println("1");
		ArrayList<ProductLargeCategoryVO> largeCategory = adminDao.selectLargeCategory();
		System.out.println(largeCategory);
		if(largeCategory == null) {
			
		}
		return largeCategory;
	}

}
