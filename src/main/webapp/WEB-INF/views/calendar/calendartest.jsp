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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <style>
        .main{
            width: 80%;
            margin: auto;
        }
        .sec_cal {
            
            min-width: 350px;
            display: flex;
            float: left;
            margin: 0 auto;
            font-family: "NotoSansR";
        }

        .sec_cal .cal_nav {
            display: flex;
            justify-content: center;
            align-items: center;
            font-weight: 700;
            font-size: 48px;
            line-height: 78px;
        }

        .sec_cal .cal_nav .year-month {
            width: 300px;
            text-align: center;
            line-height: 1;
        }

        .sec_cal .cal_nav .nav {
            display: flex;
            border: 1px solid #333333;
            border-radius: 5px;
        }

        .sec_cal .cal_nav .go-prev,
        .sec_cal .cal_nav .go-next {
            display: block;
            width: 50px;
            height: 78px;
            font-size: 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .sec_cal .cal_nav .go-prev::before,
        .sec_cal .cal_nav .go-next::before {
            content: "";
            display: block;
            width: 20px;
            height: 20px;
            border: 3px solid #000;
            border-width: 3px 3px 0 0;
            transition: border 0.1s;
        }

        .sec_cal .cal_nav .go-prev:hover::before,
        .sec_cal .cal_nav .go-next:hover::before {
            border-color: #ed2a61;
        }

        .sec_cal .cal_nav .go-prev::before {
            transform: rotate(-135deg);
        }

        .sec_cal .cal_nav .go-next::before {
            transform: rotate(45deg);
        }

        .sec_cal .cal_wrap {
            padding-top: 40px;
            position: relative;
            margin: 0 auto;
        }

        .sec_cal .cal_wrap .days {
            display: flex;
            margin-bottom: 20px;
            padding-bottom: 20px;
            border-bottom: 1px solid #ddd;
        }

        .sec_cal .cal_wrap::after {
            top: 368px;
        }

        .sec_cal .cal_wrap .day {
            display: flex;
            align-items: center;
            justify-content: center;
            width: calc(100% / 7);
            text-align: left;
            color: #999;
            font-size: 12px;
            text-align: center;
            border-radius: 5px
        }

        .current.today {
            background: rgb(242 242 242);
        }

        .sec_cal .cal_wrap .dates {
            display: flex;
            flex-flow: wrap;
            height: 290px;
        }

        .sec_cal .cal_wrap .day:nth-child(7n) {
            color: #3c6ffa;
        }

        .sec_cal .cal_wrap .day:nth-child(7n -6) {
            color: #ed2a61;
        }

        .sec_cal .cal_wrap .day.disable {
            color: #ddd;
        }

        .day {
            cursor: pointer;
        }

        .day:hover {
            background-color: beige;
        }
        #secondcard{
        	min-width: 350px;
        	height: 200px;
        	border: 1px solid red;
        	margin: 0 auto;
        }
        #mainbox{
        	width: 80%;
        	border: 1px solid green;
        	margin: 0 auto;
        }
        .dhcode{
        	display: none;
        }
        #ins_ctime{
        	width: 100%;
        }
    </style>
  </head>
  <body data-bs-theme="dark">
    <div class="main">
        <nav class="navbar navbar-expand-lg bg-body-tertiary">
            <div class="container-fluid">
              <a class="navbar-brand" href="/">mydhcode</a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation" id="togglebtn">
                <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                  <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">무엇을</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#">만들지</a>
                  </li>
                  <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                      고민해보자
                    </a>
                    <ul class="dropdown-menu">
                      <li><a class="dropdown-item" href="/calendar/">스케줄</a></li>
                      <li><a class="dropdown-item" href="#">게시판비슷한걸</a></li>
                      <li><hr class="dropdown-divider"></li>
                      <li><a class="dropdown-item" href="#">추가해야하나</a></li>
                    </ul>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link">   </a>
                  </li>
                  <li class="nav-item">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb"  style="padding: 8px;">
                          <li class="breadcrumb-item"><a href="#">Home</a></li>
                          <li class="breadcrumb-item active" aria-current="page">Data</li>
                        </ol>
                      </nav>
                  </li>
                  <c:if test="${sessionScope.login eq null}">
                  <li class="nav-item">
                  	<a class="nav-link" href="/member/login">로그인</a>
                  </li>
                  </c:if>
                  <c:if test="${sessionScope.login ne null}">
                  <li class="nav-item">
                  	<a class="nav-link" href="/member/logout">로그아웃</a>
                  </li>
                  </c:if>
                </ul>
                <form class="d-flex" role="search">
                  <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                  <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
              </div>
            </div>
          </nav>
          <div class="row" id="mainbox">
            <div class="card col-6" id="secondcard">
            	<select class="" id="mySelect" onchange="getMonth()">
            		<option selected="selected">선택해주세요</option>
            		<c:if test="${sessionScope.login ne null}">
            			<c:forEach var="group" items="${sessionScope.gList}">
            			<option value="${group.g_name}">${group.g_name}</option>
            			</c:forEach>
            		</c:if>
            	</select>
            <c:if test="${sessionScope.login.m_grade eq 3}">
            	<input type="button" value="삭제" onclick="displayCheck()">
            	<input type="button" value="등록" onclick="displayInsert()">
            </c:if>
    		</div>
          	<div class="sec_cal card col-6">
          
        		<div class="cal_nav">
            		<a href="javascript:;" class="nav-btn go-prev">prev</a>
            		<div class="year-month"></div>
            		<a href="javascript:;" class="nav-btn go-next">next</a>
        		</div>
        		<div class="cal_wrap">
            		<div class="days">
                		<div class="day">SUN</div>
                		<div class="day">MON</div>
                		<div class="day">TUE</div>
                		<div class="day">WED</div>
                		<div class="day">THU</div>
                		<div class="day">FRI</div>
                		<div class="day">SAT</div>
            		</div>
            		<div class="dates"></div>
        		</div>
		    </div>
		    <div class="mydates">
		    	<div class="row">
		    		<div class="col-1 dhcode"></div>
		    		<div class="col-2">시간</div>
		    		<div class="col-2">제목</div>
		    		<div class="col-7">내용</div>
		    	</div>
		    	<div class="row" id="insertbox">
		    		<div class="col-2"><input type="time" id="ins_ctime"></div>
	           		<div class="col-2" contenteditable="true" id="ins_ctitle"></div>
	            	<div class="col-7" contenteditable="true" id="ins_ccontent"></div>
	            	<div class="col-1 insertbox btn" onclick="insertCal()">등록</div>
		    	</div>
		    	<div class="row" id="resultbox" class="myCalresult">
            		
            	</div>
            </div>
    	</div>
    </div>
    <form action="" id="resultform" method="get">
    <input type="hidden" id="ca_year" name="ca_year">
    <input type="hidden" id="ca_month" name="ca_month">
    <input type="hidden" id="ca_date" name="ca_date">
    <input type="hidden" id="gr_name" name="gr_name">
    </form>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
    
  	<script>
        $(document).ready(function () {
            calendarInit();
            var curDate = new Date();
            $("#ca_year").val(curDate.getFullYear());
            $("#ca_month").val(curDate.getMonth()+1);
            $("#ca_date").val(curDate.getDate());
        });
        var date = new Date();
        var utc = date.getTime() + (date.getTimezoneOffset() * 60 * 1000);
        var kstGap = 9 * 60 * 60 * 1000;
        var today = new Date(utc + kstGap);

        var thisMonth = new Date(today.getFullYear(), today.getMonth(), today.getDate());
        var currentYear = thisMonth.getFullYear();
        var currentMonth = thisMonth.getMonth();
        var currentDate = thisMonth.getDate();
        function calendarInit() {


            renderCalender(thisMonth);

            function renderCalender(thisMonth) {
                currentYear = thisMonth.getFullYear();
                currentMonth = thisMonth.getMonth();
                currentDate = thisMonth.getDate();

                var startDay = new Date(currentYear, currentMonth, 0);
                var prevDate = startDay.getDate();
                var prevDay = startDay.getDay();

                var endDay = new Date(currentYear, currentMonth + 1, 0);
                var nextDate = endDay.getDate();
                var nextDay = endDay.getDay();

                $('.year-month').text(currentYear + '.' + (currentMonth + 1));

                calendar = document.querySelector('.dates')
                calendar.innerHTML = '';

                for (var i = prevDate - prevDay + 1; i <= prevDate; i++) {
                    calendar.innerHTML = calendar.innerHTML + '<div class="day prev disable">' + i + '</div>'
                }

                for (var i = 1; i <= nextDate; i++) {
                    calendar.innerHTML = calendar.innerHTML + '<div class="day current" id="'+i+'num" onclick="getDate(' + i + ')">' + i + '</div>'
                }

                for (var i = 1; i <= (7 - nextDay == 7 ? 0 : 7 - nextDay); i++) {
                    calendar.innerHTML = calendar.innerHTML + '<div class="day next disable">' + i + '</div>'
                }

                if (today.getMonth() == currentMonth) {
                    todayDate = today.getDate();
                    var currentMonthDate = document.querySelectorAll('.dates .current');
                    currentMonthDate[todayDate - 1].classList.add('today');
                }
                
            }

            $('.go-prev').on('click', function () {
                thisMonth = new Date(currentYear, currentMonth - 1, 1);
                renderCalender(thisMonth);
             	getMonth();
            });

            $('.go-next').on('click', function () {
                thisMonth = new Date(currentYear, currentMonth + 1, 1);
                renderCalender(thisMonth);
                getMonth();
            });
        }
        function getDate(i) {
        	var selectedGroup = document.getElementById("mySelect").value; 
            mycalendar = document.querySelector('.mydates');
            var currentMonth2 = currentMonth+1
            document.getElementById("ca_year").value = currentYear;
            document.getElementById("ca_month").value = currentMonth2;
            document.getElementById("ca_date").value = i;
            console.log(document.getElementById("ca_year").value);
            console.log(document.getElementById("ca_month").value);
            console.log(document.getElementById("ca_date").value);
            $.ajax({
                type: 'GET',
                url: '/calrest/getdate',
                data: {
                    ca_year: currentYear,
                    ca_month: currentMonth2,
                    ca_date: i,
                 	gr_name: selectedGroup
                },
                dataType: 'json',
                success: function(result) {
                    // 성공 시 결과를 화면에 표시
                    displayResult(result)
                },
                error: function(error) {
                    console.log('Error:', error);
                }
            });
        }
		function displayResult(result) {
			mycalendar = document.getElementById("resultbox")
		    
		    // 기존 데이터 삭제
		    mycalendar.innerHTML = '';

		    // 결과가 비어있는지 확인
		    if (result.length === 0) {
		        mycalendar.innerHTML = 'No data available.';
		        return;
		    }

		    // 결과 반복 처리
		    result.forEach(function(cal) {
		    	console.log(cal.c_time);
		        // 각 CalendarVO 객체를 HTML로 추가
		        var html = `
		            <div class="col-1 dhcode"><input type="checkbox" value="`+cal.c_no+`"></div>
		            <div class="col-2">`+cal.c_time[0]+`:`+cal.c_time[1]+`</div>
		            <div class="col-2">`+cal.c_title+`</div>
		            <div class="col-7">`+cal.c_content+`</div>
		        `;
		    
		        // HTML을 mycalendar에 추가
		        mycalendar.innerHTML += html;
		    });
		}
		function displayCheck() {
			if(document.getElementById("mySelect").value == "선택해주세요"){
				alert("그룹을 선택해주세요");
				return;
			}
		    var elements = document.getElementsByClassName("dhcode");

		    for (var i = 0; i < elements.length; i++) {
		        elements[i].style.display = "block";
		    }
		}
		function displayInsert(){
			if(document.getElementById("mySelect").value == "선택해주세요"){
				alert("그룹을 선택해주세요");
				return;
			}
		}
		function insertCal() {
			if(document.getElementById("mySelect").value == "선택해주세요"){
				alert("그룹을 선택해주세요");
				return;
			}
			var selectedGroup = document.getElementById("mySelect").value;
			mycalendar = document.querySelector('.mydates');
            currentMonth2 = currentMonth+1;
            var currentDate2 = document.getElementById("ca_date").value;
            var currentDate3 = Number(currentDate2);
            var currentTime2 = document.getElementById("ins_ctime").value;
            var ctitle = document.getElementById("ins_ctitle").innerText;
            var ccontent = document.getElementById("ins_ccontent").innerText;
            $.ajax({
                type: 'POST',
                url: '/calrest/insertcal',
                data: {
                    ca_year: currentYear,
                    ca_month: currentMonth2,
                    ca_date: currentDate2,
                    ca_time: currentTime2,
                 	gr_name: selectedGroup,
                 	ca_title: ctitle,
                 	ca_content: ccontent
                },
                dataType: 'text',
                success: function(result) {
                    // 성공 시 결과를 화면에 표시
                    getMonth();
                    getDate(currentDate3);
                },
                error: function(error) {
                    console.log('Error:', error);
                }
            });
		}
		function getMonth(){
			var selectedGroup = document.getElementById("mySelect").value; 
            mycalendar = document.querySelector('.mydates');
            var currentMonth2 = currentMonth+1
            var currentDate2 = document.getElementById("ca_date").value;
            var currentDate3 = Number(currentDate2);
            console.log(currentYear);
            console.log(currentMonth2);
            $.ajax({
                type: 'GET',
                url: '/calrest/getmonth',
                data: {
                    ca_year: currentYear,
                    ca_month: currentMonth2,
                 	gr_name: selectedGroup
                },
                dataType: 'json',
                success: function(result) {
                    // 성공 시 결과를 화면에 표시
                    displaydot(result);
                    
                    
                },
                error: function(error) {
                    console.log('Error:', error);
                }
            });
		}
		function displaydot(result) {
			var checkdate = document.getElementsByClassName("current")
			for (var i = 0; i < checkdate.length; i++) {
				var iplus = i+1;
				checkdate[i].innerHTML = iplus;
			}
		    if (result.length === 0) {
		    	console.log("이번달은 스케줄이 없음")
		        return;
		    }
		    result.forEach(function(cal) {
		    	var cMonth = new Date(cal.c_date);
		    	var cDate = cMonth.getDate();
		        for(var i = 0; i<checkdate.length;i++){
		        	var check = i+1;
		        	if(check == cDate){
		        		checkdate[i].innerHTML = check + "<br>new"
		        	}
		        }
		        
		    });
		}
		function test() {
			console.log(document.getElementById("ins_ctime").value)
		}
		$(document).on('click', '.current', function() {
		    $(".current").removeClass('today');
		    $(this).addClass('today');
		});
		function selectToday(){
			
		}
    </script>
  </body>
</html>