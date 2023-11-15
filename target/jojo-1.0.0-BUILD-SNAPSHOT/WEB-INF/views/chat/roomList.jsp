<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- Google tag (gtag.js) -->
<script async
	src="https://www.googletagmanager.com/gtag/js?id=G-CMBGRHC3KW"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'G-CMBGRHC3KW');
</script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/mqtt/mqtt.min.js"></script>
<script type="text/javascript">

function ajaxResponse(method, url, params) {
    return new Promise(function(resolve, reject) {
        $.ajax({
            url: url,
            method: method,
            data: JSON.stringify(params),
            contentType: 'application/json',
            success: function(response) {
                resolve(response);
            },
            error: function(error) {
                reject(error);
            }
        });
    });
}



</script>
<meta charset="UTF-8">
<title>chat</title>
</head>
<body>

 <div class="container" id="app">
        <div>
            <h2 id="room-name"></h2>
        </div>
        <div class="input-group">
            <div class="input-group-prepend">
                <label class="input-group-text">내용</label>
            </div>
            <input type="text" class="form-control" name="message" id="message">
            <div class="input-group-append">
                <button class="btn btn-primary" type="button" id="send_message_button">send</button>
<!--                 <button class="btn btn-primary" type="button" id="leave_button">잠시나가기</button> -->
<!--                 <button class="btn btn-primary disabled" type="button" id="reenter_button">다시입장</button> -->
            </div>
        </div>
<!--         <div>잠시 나가기는 채팅방에서 수신되는 메시지를 받지 않고 채팅방에 참여한 모든 사람에 메시지는 보낼수 있다</div> -->
        <ul class="list-group" id="message_list" style="border: 2px solid red;">
        
        </ul>
    </div>	
	

</body>
</html>

