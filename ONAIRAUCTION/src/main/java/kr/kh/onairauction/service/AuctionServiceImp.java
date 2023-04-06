package kr.kh.onairauction.service;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.kh.onairauction.dao.AuctionDAO;
import kr.kh.onairauction.vo.NoteBoxVO;
import kr.kh.onairauction.vo.ReportCategoryVO;
import kr.kh.onairauction.vo.ReportVO;

@Service
public class AuctionServiceImp implements AuctionService {
	@Autowired
	AuctionDAO auctionDAO;
	
	@Override
	public String getEmail(String id) {
		return auctionDAO.getEmail(id);
	}
	@Override
	public ArrayList<ReportCategoryVO> getReportCategoryName(){
		return auctionDAO.selectReportCategory();
	}
	@Override
	public boolean register(ReportVO report) {
		if(report == null)
			return false;
		if(auctionDAO.insertReport(report) != 0)
			return true;
		return false;
	}
	@Override
	public boolean registerNote(NoteBoxVO note) {
		if(note == null)
			return false;
		if(auctionDAO.insertNote(note) != 0)
			return true;
		return false;
	}
	
	
}