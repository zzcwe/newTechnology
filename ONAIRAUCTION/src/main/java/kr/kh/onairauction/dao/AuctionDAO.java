package kr.kh.onairauction.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.onairauction.vo.MemberVO;
import kr.kh.onairauction.vo.NoteBoxVO;
import kr.kh.onairauction.vo.ReportCategoryVO;
import kr.kh.onairauction.vo.ReportVO;

public interface AuctionDAO {
	String getEmail(@Param("id")String id);
	
	ArrayList<ReportCategoryVO> selectReportCategory();

	int insertReport(@Param("r")ReportVO report);
	
	int insertNote(@Param("n")NoteBoxVO note);
}