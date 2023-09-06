package kr.th.auction.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.th.auction.pagination.Criteria;
import kr.th.auction.vo.*;


public interface MemberDAO {

	MemberVO selectMemberById(@Param("me_id")String me_id);

	void insertCertification(@Param("mok")CertificationVO mok);

	CertificationVO selectCertification(@Param("mok")CertificationVO mok);

	void deleteCertification(@Param("mok")CertificationVO mok);

	void updateAuthority(@Param("me_id")String ce_me_id, @Param("me_authority")int me_authority);

	int insertMember(@Param("m")MemberVO member);

	void insertBoard(@Param("ce_me_id")String ce_me_id);

	void updateJoinTime(@Param("me_id")String ce_me_id, @Param("me_ml_name")String me_ml_name);

	ArrayList<BoardListVO> selectBoardList(@Param("me_id")String me_id, @Param("cri")Criteria cri);

	int selectBoardTotalCount();

	boolean insertBoardPlus(@Param("bo") BoardListVO board);

	boolean deleteBoard(@Param("bl_num") int bl_num);

	VirtualAccountVO selectAccount(@Param("me_id") String me_id);

	int insertVirtualAccount(@Param("va") VirtualAccountVO account);

	void insertCharge(ChargeVO chargeVO);

	void updateVirtual(@Param("me_id")String me_id, @Param("ch_amount")int ch_amount);

}
