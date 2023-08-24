package kr.th.auction.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import kr.th.auction.pagination.Criteria;
import kr.th.auction.vo.FileVO;
import kr.th.auction.vo.ProductVO;
import kr.th.auction.vo.StoreVO;

public interface ProductService {

	StoreVO selectStored(String me_id);

	boolean checkStore(StoreVO store);

	void createStore(StoreVO store, String userId);

	boolean insertProduct(ProductVO product, MultipartFile[] files);

	ArrayList<ProductVO> getProduct(Criteria cri);

	int getProductTotalCount();

	ProductVO getProduct(int pr_code);

	ArrayList<FileVO> getFileList(int pr_code);

	boolean updateProduct(ProductVO product, MultipartFile[] files, int[] fileNums);

	boolean deleteProduct(int pr_code);

	ArrayList<ProductVO> getProduct(int searchCategory, String searchName, Criteria cri);

	int getProductTotalCount(int searchCategory, String searchName);
}
