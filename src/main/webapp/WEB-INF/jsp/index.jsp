<%--
 功能说明：index.jsp
 作者：liuxing(2014-11-14 01:44)
 修改者：liuxing(2014-11-14 01:44)
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>websocket演示</title>
</head>
<body>
<input type="button" id="connect" onclick="connect()" value="连接"/>
<input type="button" id="disconnect" onclick="disconnect()" value="断开"/>

<input type="text" id="message" />

<div id="response" style="color:#00CC99; width:960px; background-color:#CC9933; border: 2px solid #0000FF; width: 200px;">

</div>

<br/>

<div id="conversationDiv" style="color:#00CC99; width:960px; background-color:#CC9933; border: 2px solid #0000FF; width: 200px;">

</div>

<script type="text/javascript">

    var socket = null;

    function setConnected(connected) {
        document.getElementById('connect').disabled = connected;
        document.getElementById('disconnect').disabled = !connected;
        document.getElementById('conversationDiv').style.visibility = connected ? 'visible' : 'hidden';
        document.getElementById('response').innerHTML = '';
        socket.close();
    }

    function connect() {
        if ('WebSocket' in window){
            socket = new WebSocket('ws://localhost:8080/websocket');

            socket.onopen = function(){
                setConnected(true);
            }

            socket.onclose = function(){
                console.log('断开连接');
            }

            socket.onmessage = function (evt) {
                console.log(evt);
                var received_msg = evt.data;
                showMessage(received_msg);
            }

        } else {
            console.log('不支持WebSocket');
        }
    }

    function disconnect() {
        setConnected(false);
        console.log("断开连接");
    }

    function sendName() {
        var message = document.getElementById('message').value;
        socket.send(JSON.stringify({ 'message': message }));
    }

    function showMessage(message) {
        var response = document.getElementById('response');
        var p = document.createElement('p');
        p.style.wordWrap = 'break-word';
        p.appendChild(document.createTextNode(message));
        response.appendChild(p);
    }

</script>

</body>
</html>