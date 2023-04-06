package kr.kh.onairauction.service;

import java.util.ArrayList;

import kr.kh.onairauction.vo.NoteBoxVO;
import kr.kh.onairauction.vo.ReportCategoryVO;
import kr.kh.onairauction.vo.ReportVO;

public interface AuctionService {
	String getEmail(String id);
	
	ArrayList<ReportCategoryVO> getReportCategoryName();

	boolean register(ReportVO report);
	
	boolean registerNote(NoteBoxVO note);
}