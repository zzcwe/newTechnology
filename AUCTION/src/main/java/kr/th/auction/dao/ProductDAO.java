package kr.th.auction.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.th.auction.pagination.Criteria;
import kr.th.auction.vo.FileVO;
import kr.th.auction.vo.ProductCategoryVO;
import kr.th.auction.vo.ProductMiddleCategoryVO;
import kr.th.auction.vo.ProductSmallCategoryVO;
import kr.th.auction.vo.ProductVO;
import kr.th.auction.vo.StoreVO;

public interface ProductDAO {
	StoreVO selectStore(@Param("me_id")String me_id);

	StoreVO selectStoreById(@Param("st_name")String st_name);

	void insertStore(@Param("store") StoreVO store, @Param("userId") String userId);
	
	ArrayList<ProductMiddleCategoryVO> selectMiddleCategory(int plc_num);

	ArrayList<ProductSmallCategoryVO> selectSmallCategory(int pmc_num);

	ArrayList<ProductCategoryVO> selectCategory(int psc_num);

	void insertFile(@Param("f") FileVO fileVo, @Param("pr_code") int pr_code);

	boolean insertProduct(@Param("p") ProductVO product);

	ArrayList<ProductVO> selectProductList(@Param("cri") Criteria cri);

	int selectProductTotalCount();

	ProductVO selectProduct(@Param("pr_code") int pr_code);

	ArrayList<FileVO> selectFileList(@Param("pr_code") int pr_code);

	int updateProduct(@Param("product") ProductVO product);

	FileVO selectFile(@Param("fi_num") int fileNum);

	void deleteFile(@Param("file") FileVO file);
	
	int deleteProduct(@Param("pr_code")int pr_code);
	
	ArrayList<ProductVO> selectProductListName(@Param("pr_name")String pr_name, @Param("cri") Criteria cri);
	
	ArrayList<ProductVO> selectProductListIntro(@Param("pr_intro")String pr_intro, @Param("cri") Criteria cri);
	
	ArrayList<ProductVO> selectProductListLocation(@Param("pr_location")String pr_location, @Param("cri") Criteria cri);

	int selectProductTotalCountName(@Param("pr_name")String pr_name);

	int selectProductTotalCountIntro(@Param("pr_intro")String pr_intro);

	int selectProductTotalCountLocation(@Param("pr_location")String pr_location);

	ArrayList<ProductVO> selectClothProduct(@Param("string")String string);
}
