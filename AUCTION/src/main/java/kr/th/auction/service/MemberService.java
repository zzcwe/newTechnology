package kr.th.auction.service;

import java.util.ArrayList;

import kr.th.auction.pagination.Criteria;
import kr.th.auction.vo.BoardListVO;
import kr.th.auction.vo.CertificationVO;
import kr.th.auction.vo.ChargeVO;
import kr.th.auction.vo.MemberVO;
import kr.th.auction.vo.VirtualAccountVO;

public interface MemberService {
	
	boolean signup(MemberVO member);
	
	void emailAuthentication(String me_id, String me_email);
	
	boolean emailAuthenticationConfirm(CertificationVO ok);
	
	boolean checkId(MemberVO user);

	MemberVO login(MemberVO member);

	ArrayList<BoardListVO> selectBoardList(String me_id, Criteria cri);

	int getBoardTotalCount();

	boolean insertVirtualAccount(VirtualAccountVO account);

	void insertCharge(ChargeVO chargeVO);

	void updateVirtual(String me_id, int ch_amount);
	
}
