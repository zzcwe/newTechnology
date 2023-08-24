package kr.th.auction.service;

import java.util.ArrayList;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.th.auction.vo.BoardListVO;
import kr.th.auction.vo.CertificationVO;
import kr.th.auction.vo.MemberVO;
import kr.th.auction.dao.MemberDAO;
import kr.th.auction.pagination.Criteria;

@Service
public class MemberServiceImp implements MemberService{
	@Autowired
	MemberDAO memberDao;
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public boolean signup(MemberVO member) {
		if(member == null)
			return false;
		String newPw = passwordEncoder.encode(member.getMe_pw());
		member.setMe_pw(newPw);
		if(memberDao.insertMember(member) != 0)
			return true;
		return false;
	}
	@Override
	public boolean checkId(MemberVO user) {
		if(user == null || 
			user.getMe_id() == null || 
			user.getMe_id().trim().length() == 0)
			return false;
		return memberDao.selectMemberById(user.getMe_id()) == null; //true 반환
	}
	@Override
	public void emailAuthentication(String me_id, String me_email) {
		String str = authenticationNumber();
		CertificationVO mok = new CertificationVO(me_id, str);
		memberDao.insertCertification(mok);
		
		String title = "[OnairAuction]이메일 인증 메일입니다.";
		String content = 
			"다음 링크를 클릭해서 이메일 인증을 완료하세요.<br>" + 
			"<a href='http://localhost:8080/auction/email?ce_certification_number="+str+"&ce_me_id="+me_id+"'>이메일 인증하기</a>";
		//이메일 전송
		sendEmail(title, content, me_email);
	}
	private void sendEmail(String title, String content, String email) {
		String setfrom = "zzzxc6171@gmail.com";         
	    
	    try {
	        MimeMessage message = mailSender.createMimeMessage();
	        MimeMessageHelper messageHelper 
	            = new MimeMessageHelper(message, true, "UTF-8");

	        messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
	        messageHelper.setTo(email);     // 받는사람 이메일
	        messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
	        //setText에 true를 추가하면, content에 있는 html코드를 html코드로 적용
	        messageHelper.setText(content, true);  // 메일 내용

	        mailSender.send(message);
	    } catch(Exception e){
	        System.out.println(e);
	    }
	}
	private String authenticationNumber() {
		//인증번호 생성 : 6자리, 영어, 숫자로 된 인증 번호
		String str = "";
		int max = 61, min = 0;
		//영어 소문자 : 26개, 영어 대문자 : 26개, 숫자 : 10개 총 : 62개
		while(str.length() != 6) {
			int r = (int)(Math.random()*(max-min + 1) + min);
			//숫자 0~9
			if(r <= 9) {
				str += r;
			}
			//영어 소문자 10~35. 10=>a, 11=>b,... 35=>z
			else if(r <= 35) {
				str += (char)('a'+(r-10));
			}
			else {
				str += (char)('A'+(r-36));
			}
		}
		return str;
	}
	@Override
	public boolean emailAuthenticationConfirm(CertificationVO mok) {
		if(mok == null)
			return false;
		CertificationVO dbMok = memberDao.selectCertification(mok);
		if(dbMok != null) {
			//cartification 테이블을 지우기 전에 데이터를 board_list에 넣어준다.
			memberDao.insertBoard(mok.getCe_me_id());
			//certification 테이블에서 해당 데이터를 삭제하고
			memberDao.deleteCertification(mok);
			//member테이블에서 해당 회원의 권한을 1로 등급업
			memberDao.updateAuthority(mok.getCe_me_id(), 1);
			memberDao.updateJoinTime(mok.getCe_me_id());
			return true;
		}
		return false;
	}
	@Override
	public MemberVO login(MemberVO member) {
		if(member == null || member.getMe_id() == null 
			|| member.getMe_pw() == null)
			return null;
		MemberVO dbMember = memberDao.selectMemberById(member.getMe_id());
		if(dbMember == null)
			return null;
		if(passwordEncoder.matches(member.getMe_pw(), dbMember.getMe_pw()))
			return dbMember;
		return null;
	}
	@Override
	public ArrayList<BoardListVO> selectBoardList(String me_id, Criteria cri) {
		return memberDao.selectBoardList(me_id, cri);
	}
	@Override
	public int getBoardTotalCount() {
		return memberDao.selectBoardTotalCount();
	}
}
