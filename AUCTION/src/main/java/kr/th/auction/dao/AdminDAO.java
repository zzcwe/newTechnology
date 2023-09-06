package kr.th.auction.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.th.auction.vo.MembershipLevelVO;
import kr.th.auction.vo.ProductCategoryVO;
import kr.th.auction.vo.ProductLargeCategoryVO;
import kr.th.auction.vo.ProductMiddleCategoryVO;
import kr.th.auction.vo.ProductSmallCategoryVO;

public interface AdminDAO {

	ArrayList<ProductLargeCategoryVO> selectLargeCategory();
	
	ArrayList<ProductMiddleCategoryVO> selectMiddleCategory();
	
	ArrayList<ProductSmallCategoryVO> selectSmallCategory();
	
	ArrayList<ProductSmallCategoryVO> selectProductCategory();

	void insertLargeCategory(@Param("l")ProductLargeCategoryVO str);
	
	void insertMiddleCategory(@Param("m")ProductMiddleCategoryVO str);

	void insertSmallCategory(@Param("s")ProductSmallCategoryVO newCategory);

	void insertFinalCategory(@Param("f")ProductCategoryVO newCategory);

	boolean insertMembership(@Param("l") MembershipLevelVO level);

}
