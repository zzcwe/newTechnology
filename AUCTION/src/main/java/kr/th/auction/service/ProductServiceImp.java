package kr.th.auction.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.th.auction.dao.ProductDAO;
import kr.th.auction.pagination.Criteria;
import kr.th.auction.utils.UploadFileUtils;
import kr.th.auction.vo.FileVO;
import kr.th.auction.vo.ProductVO;
import kr.th.auction.vo.StoreVO;

@Service
public class ProductServiceImp implements ProductService {
	@Autowired
	ProductDAO productDao;
	
	String uploadPath = "C:\\uploadfiles";
	
	@Override
	public StoreVO selectStored(String me_id) {
		return productDao.selectStore(me_id);
	}
	
	@Override
	public boolean checkStore(StoreVO store) {
		if(store == null || 
				store.getSt_name() == null || 
				store.getSt_name().trim().length() == 0)
				return false;
			return productDao.selectStoreById(store.getSt_name()) == null; //true 반환
	}

	@Override
	public void createStore(StoreVO store, String userId) {
		productDao.insertStore(store, userId);
	}

	@Override
	public boolean insertProduct(ProductVO product, MultipartFile[] files) {
		
		if(productDao.insertProduct(product)) {
			uploadFiles(files, product.getPr_code()); //앞에서 먼저 product가 DB에 삽입되고 난 후 수정된 pr_code값이 들어감 
			System.out.println("상품등록 성공!");
			return true;
		}
		return false;
	}
	
	//첨부파일
	private void uploadFiles(MultipartFile [] files, int pr_code) {
		if(files == null || files.length == 0)
			return ;
		for(MultipartFile file : files) {
			if(file == null || file.getOriginalFilename().length() == 0)
				continue;
			String fileName = "";
			try {
				fileName = UploadFileUtils.uploadFile(uploadPath, 
						file.getOriginalFilename(),
						file.getBytes()); 
			} catch (Exception e) {
				e.printStackTrace();
			} 
			System.out.println(fileName);
			FileVO fileVo = new FileVO(file.getOriginalFilename(), fileName, pr_code);
			productDao.insertFile(fileVo, pr_code);
			System.out.println("파일업로드 성공!");
			}
		}

	@Override
	public ArrayList<ProductVO> getProduct(Criteria cri) {
		return productDao.selectProductList(cri);
	}

	@Override
	public int getProductTotalCount() {
		return productDao.selectProductTotalCount();
	}

	@Override
	public ProductVO getProduct(int pr_code) {
		return productDao.selectProduct(pr_code);
	}

	@Override
	public ArrayList<FileVO> getFileList(int pr_code) {
		return productDao.selectFileList(pr_code);
	}

	@Override
	public boolean updateProduct(ProductVO product, MultipartFile[] files, int[] fileNums) {
		ProductVO dbvo = productDao.selectProduct(product.getPr_code());
		if(dbvo == null)
			return false;
		if(productDao.updateProduct(product) == 0)
			return false;
		uploadFiles(files, product.getPr_code());
		if(fileNums == null || fileNums.length == 0)
			return true;
		ArrayList<FileVO> fileList = new ArrayList<FileVO>();
		for(int fileNum : fileNums) {
			FileVO fileVo = productDao.selectFile(fileNum);
			if(fileVo != null)
				fileList.add(fileVo);
		}	
		deleteFileList(fileList);	
		return true;
	}
	// 상품 삭제
		@Override
		public boolean deleteProduct(int pr_code) {	
			ArrayList<FileVO> fileList = productDao.selectFileList(pr_code);
			deleteFileList(fileList);
			return productDao.deleteProduct(pr_code) != 0;
		}
		private void deleteFileList(ArrayList<FileVO> fileList) {
			if(fileList == null || fileList.size() == 0) 
				return;
			for(FileVO file : fileList) { //향상된 for문
				if(file == null)
					continue;//for문 끝냄
				UploadFileUtils.removeFile(uploadPath, file.getFi_save_name());
				productDao.deleteFile(file);
			}	
		}
		//상품 검색
		@Override
		public ArrayList<ProductVO> getProduct(int searchCategory, String searchName, Criteria cri) {
			System.out.println(searchCategory);
			System.out.println(searchName);
			if(searchCategory == 1) {
				System.out.println("실행1");
				return productDao.selectProductListName(searchName, cri);
			}else if(searchCategory == 2) {
				System.out.println("실행2");
				return productDao.selectProductListIntro(searchName, cri);
			}else if(searchCategory == 3) {
				System.out.println("실행3");
				return productDao.selectProductListLocation(searchName, cri);
			}
			return null;
		}

		@Override
		public int getProductTotalCount(int searchCategory, String searchName) {
			if(searchCategory == 1) {
				System.out.println("실행1");
				return productDao.selectProductTotalCountName(searchName);
			}else if(searchCategory == 2) {
				System.out.println("실행2");
				return productDao.selectProductTotalCountIntro(searchName);
			}else if(searchCategory == 3) {
				System.out.println("실행3");
				return productDao.selectProductTotalCountLocation(searchName);
			}
			return 0;
		}
}
