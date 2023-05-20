<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Simple Chat</title>
</head>
<body>
    <div>
        <button type="button" onclick="openSocket();">대화방 참여</button>
        <button type="button" onclick="closeSocket();">대회방 나가기</button>
    	<br/><br/><br/>
  		메세지 입력 :
  		<input type="hidden" id="room" value="${roomNumber}" style="display: none;"> 
        <input type="text" id="sender" value="${userId}" style="display: none;">
        <input type="text" id="messageinput">
        <button type="button" onclick="send();">메세지 전송</button>
        <button type="button" onclick="clearText();">대화내용 지우기</button>
    </div>
    <!-- Server responses get written here -->
    <div id="messages">
    
    </div>
    <!-- websocket javascript -->
    <script type="text/javascript">
        var ws;
        var messages = document.getElementById("messages");
        
        function openSocket(){
            if(ws !== undefined && ws.readyState !== WebSocket.CLOSED ){
                writeResponse("WebSocket is already opened.");
                console.log('${userId}');
                console.log('${roomNumber}');
                return;
            }
            //웹소켓 객체 만드는 코드 - 서버의 @OnOpen을 실행시킴
            ws = new WebSocket("ws://localhost:8080/chatting/echo.do/${roomNumber}/${userId}");
            
            ws.onopen = function(event){
                if(event.data === undefined){
              		return;
                }
                writeResponse(event.data);
            };
            
            ws.onmessage = function(event){ 
                console.log('writeResponse');
                console.log(event.data)
                writeResponse(event.data);
                console.log('${userId}');
            };
            
            ws.onclose = function(event){
                writeResponse("대화 종료");
            }
            
        }
        
        function send(){ 
            var text = document.getElementById("messageinput").value+","+document.getElementById("sender").value+","+document.getElementById("room").value;
            ws.send(text);
            console.log(text);
            text = "";
        }
        
        function closeSocket(){
            ws.close();
        }
        
        function writeResponse(text){
            messages.innerHTML += "<br>"+text;
        }

        function clearText(){
            console.log(messages.parentNode);
            messages.parentNode.removeChild(messages);
      	}
        
  </script>
</body>
</html>