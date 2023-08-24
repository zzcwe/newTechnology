package kr.th.auction.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.th.auction.vo.CertificationVO;
import kr.th.auction.vo.MemberVO;
import kr.th.auction.vo.BoardListVO;
import kr.th.auction.pagination.Criteria;
import kr.th.auction.pagination.PageMaker;
import kr.th.auction.service.MemberService;

@Controller
public class MemberContoller {
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value = "/signup", method=RequestMethod.GET) //url이나 a링크를 통해 이동할 경우, 요청방식 GET방식이기때문에 GET방식인 리퀘스트매핑이 필요함
	public ModelAndView signup(ModelAndView mv) {
		mv.setViewName("/member/signup");
		return mv;
	}
	
	@RequestMapping(value = "/signup", method=RequestMethod.POST)
	public ModelAndView signupPost(ModelAndView mv, MemberVO member) {
		boolean isSignup = memberService.signup(member);
		if(isSignup) {
			//아이디가 주어지면 주어진 아이디의 인증 번호를 발급하고, 
			//발급한 인증 번호를 DB에 저장하고, 이메일로 인증 번호가 있는 링크를 전송하는 기능
			memberService.emailAuthentication(member.getMe_id(), member.getMe_email());
			mv.setViewName("redirect:/");
		}else {
			mv.setViewName("redirect:/signup");
		}
		return mv;
	}
	@RequestMapping(value = "/email", method=RequestMethod.GET)
	public ModelAndView email(ModelAndView mv, CertificationVO ok) {
		if(memberService.emailAuthenticationConfirm(ok)) {
			
		}else {
			
		}
		mv.setViewName("redirect:/");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value = "/check/id", method=RequestMethod.POST)
	public Map<String, Object> checkId(@RequestBody MemberVO user) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		boolean res = memberService.checkId(user);
		map.put("res", res);
		System.out.print(res);
		return map;
	}
	@RequestMapping(value = "/login", method=RequestMethod.GET)
	public ModelAndView login(ModelAndView mv, HttpServletRequest request) {
		String url = request.getHeader("Referer");
		//다른 URL을 통해 로그인페이지로 온 경우
		//(단, 로그인 실패로 인해서 login post에서 온 경우는 제외)
		if(url != null && !url.contains("login")) {
			request.getSession().setAttribute("prevURL", url);
		}
		mv.setViewName("/member/login");
		return mv;
	}
	@RequestMapping(value = "/login", method=RequestMethod.POST)
	public ModelAndView loginPost(ModelAndView mv, MemberVO member/*, HttpSession session*/) {
		MemberVO user = memberService.login(member);
		System.out.println("logIn");
		//session.setAttribute("user", user);
		mv.addObject("user", user); //DB에 있는 멤버의 정보를 웹페이지에 추가 ("변수이름", "데이터 값")
		if(user != null) { 
			mv.setViewName("redirect:/");
			//자동로그인 체크여부는 화면에서 가져오는 거지 DB에서 가져오는게 아님
			//user는 DB에서 가져온 회원 정보라 자동 로그인 여부를 알 수가 없음
			//그래서 화면에서 가져온 member에 있는 자동 로그인 여부를 user에 수정
			//user.setAutoLogin(member.isAutoLogin()); //setAutoLogin이랑 isAutoLogin 모두 @Data의 메소드임
		}else
			mv.setViewName("redirect:/login");
		return mv;
	}
	@RequestMapping(value = "/logout", method=RequestMethod.GET)
	public ModelAndView logout(ModelAndView mv, 
			HttpSession session,
			HttpServletResponse response) throws IOException {
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user != null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그아웃 되었습니다.');location.href='/auction/'</script>"); //alert창으로 로그아웃 띄우고 로케이션.href='주소'로 이동
			out.flush();
		}
		//세션에 있는 회원 정보를 삭제
		
		session.removeAttribute("user");
		//user.setMe_session_limit(null);
		//user.setMe_session_id(null);
		//memberService.updateMemberBySession(user);
		mv.setViewName("redirect:/");
		System.out.println("logOut");
		return mv;
	}
	@RequestMapping(value = "/board/list", method=RequestMethod.GET) 
	public ModelAndView boardList(ModelAndView mv, HttpSession session, Criteria cri) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		ArrayList<BoardListVO> boardList = memberService.selectBoardList(user.getMe_id(), cri);
		int totalCount = memberService.getBoardTotalCount();
			PageMaker pm = new PageMaker(totalCount, 3, cri);
		mv.addObject("boardList", boardList);
		mv.addObject("pm", pm);
		mv.setViewName("/member/boardList");
		return mv;
	}
}
