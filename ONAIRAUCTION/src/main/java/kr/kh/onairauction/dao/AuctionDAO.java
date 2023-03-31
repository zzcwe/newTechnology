package kr.kh.onairauction.dao;

import org.apache.ibatis.annotations.Param;

import kr.kh.onairauction.vo.MemberVO;

public interface AuctionDAO {
	String getEmail(@Param("id")String id);
}