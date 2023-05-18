package kr.kh.chatting;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@ServerEndpoint(value="/echo.do")
public class WebSocketChat2 {
    
    private static final List<Session> sessionList = new ArrayList<Session>(); //맵으로 바꿔주자
    private static final Map<Integer, List<Session>> sessionList2 = new HashMap<Integer, List<Session>>();
    private static final Logger logger = LoggerFactory.getLogger(WebSocketChat2.class);
    public WebSocketChat2() {
        System.out.println("웹소켓(서버) 객체생성");
    }
    
    @OnOpen
    public void onOpen(Session session) {
        logger.info("Open session id:"+session.getId());
        try {
            final Basic basic=session.getBasicRemote();
            basic.sendText("대화방에 연결 되었습니다.");
        }catch (Exception e) {
            System.out.println(e.getMessage());
        }
        List<Session> sessionList =sessionList2.get(0);
        if(sessionList == null)
        	sessionList = new ArrayList<Session>();
        sessionList.add(session);
        sessionList2.put(0, sessionList);
        System.out.println(session.getId());
        System.out.println(session);
        System.out.println(sessionList);
        System.out.println(sessionList2);
    }
    
 
    private void sendAllSessionToMessage(Session self, String sender, String message, String num) {
    	
        try {
        	
        	int number = Integer.parseInt(num);
            for(Session session : sessionList2.get(number)) {
                if(!self.getId().equals(session.getId())) {
                    session.getBasicRemote().sendText(sender+" : "+message);
                }
            }
        }catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
  
    @OnMessage
    public void onMessage(String message,Session session ) {
    	
    	String sender = message.split(",")[1]; //스플릿으로 구분하여 방번호를 구분해서 받아줌
    	message = message.split(",")[0];
    	String num = message.split(",")[2];
    	num = "0";
        logger.info("Message From "+sender + ": "+message);
        try {
            final Basic basic=session.getBasicRemote();
            basic.sendText("<나> : "+message);
        }catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
        sendAllSessionToMessage(session, sender, message, num);
    }
    
    @OnError
    public void onError(Throwable e,Session session) {
        
    }
    
    @OnClose
    public void onClose(Session session) {
        logger.info("Session "+session.getId()+" has ended");
        sessionList.remove(session);
    }
}
