<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>테스트 메인페이지</title>
    <script src="https://code.jquery.com/jquery-3.7.1.js"
        integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script>
      function alarmMsg() {
        $.ajax({
          type: 'GET',
          url: '/msgrest/getunreadmsg',
          data: {
          },
          dataType: 'json',
          success: function(result) {
            // 성공 시 결과를 화면에 표시
            console.log(result);
            displayMsg(result)
          },
          error: function(error) {
            console.log('Error:', error);
          }
        });
      }

      function displayMsg(result){
        myMsgbox = document.getElementById("myMsg");
        myMsgbox.innerText = '';
        document.getElementById("alarmbell").innerHTML = `<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-bell" viewBox="0 0 16 16">
                  <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2M8 1.918l-.797.161A4 4 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4 4 0 0 0-3.203-3.92zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5 5 0 0 1 13 6c0 .88.32 4.2 1.22 6"/>
               </svg>`;
        if(result.length == 0){
          myMsgbox.innerHTML = '<p>새로운 쪽지가 없음</p>'
          return;
        }
        var alarm = `<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                        `+result.length+`
                        <span class="visually-hidden">unread messages</span>
                    </span>`
        document.getElementById("alarmbell").innerHTML += alarm;
        var count = result.length;
        myMsgbox.innerHTML += '<div>'+count+'개의 쪽지가 있습니다</div><div class="btn" onclick="realAllMessage()">'+'전체읽음'+'</div>'
        var msg_nos = [];
        result.forEach(function (msg){
          var sendid = msg.msg_sendid;
          var content = msg.msg_content;
          var msg_no = msg.msg_no;
          msg_nos.push(msg_no);
          var html = `<hr>
                <div>
                    <div>
                        `+sendid+`
                    </div>
                    <div>
                        `+content+`
                        <span id=readmsg class="btn" onclick="readOneMessage(`+msg_no+`)">읽음</span>
                    </div>
                </div>`;
          myMsgbox.innerHTML += html;
        })
        document.getElementById("msg_nos").value = JSON.stringify(msg_nos);
        console.log(document.getElementById("msg_nos").value);
      }
      window.onload = alarmMsg;
      function readOneMessage(msg_no){
        $.ajax({
          type: 'POST',
          url: '/msgrest/readonemsg',
          data: {
            msg_no: msg_no
          },
          dataType: 'text',
          success: function(result) {
            // 성공 시 결과를 화면에 표시
            alarmMsg();
          },
          error: function(error) {
            console.log('Error:', error);
          }
        });
      }
      function realAllMessage(){
        var msg_nos = document.getElementById("msg_nos").value;
        $.ajax({
          type: 'POST',
          url: '/msgrest/readallmsg',
          data: {
            msg_nos: msg_nos
          },
          dataType: 'text',
          success: function(result) {
            // 성공 시 결과를 화면에 표시
            alarmMsg();
          },
          error: function(error) {
            console.log('Error:', error);
          }
        });
      }
    </script>

    <style>
	    .main{
            width: 100%;
            max-width: 1400px;
            margin: auto;
        }
        #mainbox{
        	width: 100%;
        	max-width: 1200px;
        	margin: 0 auto;
        }
        #mybtn{
          float: right;
        }
        .f_right{
          display: inline;
          position: relative;
          float: right;
        }
    </style>