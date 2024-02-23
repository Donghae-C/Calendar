<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../includes/header.jsp"%>

	<style>
        .sec_cal {
            width: 100%;
            max-width: 500px;
            display: flex;
            float: left;
            margin: 0 auto;
            font-family: "NotoSansR";
            border: 0px;
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
			width: 100%;
			max-width: 500px;
			border: 0px;
        	margin: 0 auto;
        }
        .dhcode{
        	display: none;
        }
        #ins_ctime{
        	width: 100%;
        }
		#insertbox{
			width: 100%;
			margin: auto;
			border: 0px;
			display: none;
		}
        #delbtn{
			display: none;
			width: 50px;
        }
		#systembox{
			height: 38px;
		}
		.resultcard{
			width: 100%;
			max-width: 500px;
		}
		.rescard{
			margin-bottom: 10px;
			border: 0px;
		}


	</style>
<%@include file="../includes/header2.jsp"%>
                  <li class="nav-item">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb"  style="padding: 8px;">
                          <li class="breadcrumb-item"><a href="/">Home</a></li>
                          <li class="breadcrumb-item active" aria-current="page">Calendar</li>
                        </ol>
                      </nav>
                  </li>
<%@include file="../includes/header3.jsp"%>
            <div class="card col-6" id="secondcard">
            	<select class="" id="mySelect" onchange="getMcal()">
					<c:if test="${sessionScope.login ne null}">
						<option selected="selected">내 캘린더</option>
					</c:if>
            		<c:if test="${sessionScope.login ne null}">
            			<c:forEach var="group" items="${sessionScope.gList}">
            			<option value="${group.g_name}">${group.g_name}</option>
            			</c:forEach>
            		</c:if>
            	</select>

				<div id="insertbox">
					<div class="row insbox">
						<div class="col-2 text-center">시간</div>
						<div class="col-10" id="ins_ctimebox"><input type="time" id="ins_ctime"></div>
					</div>
					<div class="row insbox">
						<div class="col-2 text-center">제목</div>
						<div class="col-10" contenteditable="true" id="ins_ctitle"></div>
					</div>
					<div class="row insbox">
						<div class="col-2 text-center">내용</div>
						<div class="col-10" contenteditable="true" id="ins_ccontent"></div>
					</div>
					<div class="insbox d-flex justify-content-center">
						<div class="btn mx-auto" id="ins_btn" onclick="insertCal()">등록</div>
					</div>
				</div>
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
		<div id="systembox"><input type="button" id="delbtn" class="btn" value="삭제" onclick="deleteCal()"></div>
		    <div class="mydates">
		    	<div id="resultbox" class="myCalresult">

            	</div>
            </div>
    	</div>

    <form action="" id="resultform" method="get">
    <input type="hidden" id="ca_year" name="ca_year">
    <input type="hidden" id="ca_month" name="ca_month">
    <input type="hidden" id="ca_date" name="ca_date">
    <input type="hidden" id="gr_name" name="gr_name">
    </form>
<%@include file="../includes/body.jsp"%>
	<script>
        $(document).ready(function () {
            calendarInit();
            var curDate = new Date();
            $("#ca_year").val(curDate.getFullYear());
            $("#ca_month").val(curDate.getMonth()+1);
            $("#ca_date").val(curDate.getDate());
			$("#gr_name").val(document.getElementById("mySelect").value);
			getMcal();
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

                for (var i = prevDate - prevDay; i <= prevDate; i++) {
                    calendar.innerHTML = calendar.innerHTML + '<div class="day prev disable">' + i + '</div>'
                }

                for (var i = 1; i <= nextDate; i++) {
                    calendar.innerHTML = calendar.innerHTML + '<div class="day current" id="'+i+'num" onclick="selectDate(' + i + ')">' + i + '</div>'
                }

                for (var i = 1; i <= (7 - nextDay == 1 ? 0 : 6 - nextDay); i++) {
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
             	getMcal();
            });

            $('.go-next').on('click', function () {
                thisMonth = new Date(currentYear, currentMonth + 1, 1);
                renderCalender(thisMonth);
                getMcal();
            });
        }

		function selectDate(i) {
			var selectedGroup = document.getElementById("mySelect").value;
			var currentMonth2 = currentMonth + 1
			document.getElementById("ca_year").value = currentYear;
			document.getElementById("ca_month").value = currentMonth2;
			document.getElementById("ca_date").value = i;
			// getCal 함수에 콜백 함수 전달
			getCal(currentYear, currentMonth2, i, selectedGroup, function () {
				console.log("2");
				displaychk();
			});
		}
        
        function getCal(year, month, date, gname, callback) {
			var selectedGroup = document.getElementById("mySelect").value;
			if(selectedGroup != '내 캘린더'){
				$.ajax({
					type: 'GET',
					url: '/calrest/getdate',
					data: {
						ca_year: year,
						ca_month: month,
						ca_date: date,
						gr_name: gname
					},
					dataType: 'json',
					success: function(result) {
						// 성공 시 결과를 화면에 표시
						displayCal(result)
						callback();
					},
					error: function(error) {
						console.log('Error:', error);
					}
				});
			}else{
				$.ajax({
					type: 'GET',
					url: '/calrest/getmydate',
					data: {
						ca_year: year,
						ca_month: month,
						ca_date: date,
						gr_name: gname
					},
					dataType: 'json',
					success: function(result) {
						// 성공 시 결과를 화면에 표시
						displayCal(result)
						callback();
					},
					error: function(error) {
						console.log('Error:', error);
					}
				});
			}

        }
		function displayCal(result) {
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
				var hour = cal.c_time[0].toString().padStart(2, '0');
				var minute = cal.c_time[1].toString().padStart(2, '0');
		        // 각 CalendarVO 객체를 HTML로 추가
				var html2 = `
				<div class="card rescard">
					<div class="card resultcard">
						<div class="card-header">
    						<input type="checkbox" class="dhcode admincheck" name="delchk" value="`+cal.c_no+`">
  						</div>
  						<div class="card-body">
    						<h5 class="card-title">`+hour+`:`+minute+`<span class="dhcode admincheck f_right"><a href="javascript:displayUpdate('no`+cal.c_no+`')" class="btn">수정</a></span></h5>
    						<h6 class="card-subtitle mb-2 text-body-secondary">`+cal.c_title+`</h6>
    						<p class="card-text">`+cal.c_content+`</p>
  						</div>
					</div>
					<div class="card resultcard dhcode" id="no`+cal.c_no+`">
  						<div class="card-body">
    						<h5 class="card-title"><input type="time" id="udttime`+cal.c_no+`" value="`+hour+`:`+minute+`"></h5>
    						<h6 class="card-subtitle mb-2 text-body-secondary" contenteditable="true" id="udttitle`+cal.c_no+`">`+cal.c_title+`</h6>
    						<p class="card-text" contenteditable="true" id="udtcontent`+cal.c_no+`">`+cal.c_content+`</p>
  						</div>
						<div class="card-footer">
    						<a href="javascript:updateCal('`+cal.c_no+`')" class="btn">수정적용</a>
							<a href="javascript:hideUpdate('no`+cal.c_no+`')" class="btn">취소</a>
  						</div>
					</div>
				</div>
				`
		        // HTML을 mycalendar에 추가
		        mycalendar.innerHTML += html2;
		    });
		}

		function admincheck() {
			var selectedGroup = document.getElementById("mySelect").value;
			$.ajax({
				type: 'GET',
				url: '/calrest/adminchk',
				data: {
					gr_name: selectedGroup
				},
				dataType: 'text',
				success: function(result) {
					// 성공 시 결과를 화면에 표시
					if(result == "y"){
						document.getElementById("insertbox").style.display = 'block';
						document.getElementById("delbtn").style.display = 'block';
						var chkbox = document.getElementsByName("delchk");
						for(var i=0;i<chkbox.length;i++){
							chkbox[i].style.display = 'block';
						}
					}else{
						document.getElementById("insertbox").style.display = 'none';
						document.getElementById("delbtn").style.display = 'none';
						var chkbox = document.getElementsByName("delchk");
						for(var i=0;i<chkbox.length;i++){
							chkbox[i].style.display = 'none';
						}
					}
				},
				error: function(error) {
					console.log('Error:', error);
				}
			});

		}
		function displaychk() {
			var selectedGroup = document.getElementById("mySelect").value;
			$.ajax({
				type: 'GET',
				url: '/calrest/adminchk',
				data: {
					gr_name: selectedGroup
				},
				dataType: 'text',
				success: function (result) {
					// 성공 시 결과를 화면에 표시
					if (result == "y") {
						var updatebox = document.getElementsByClassName("admincheck");
						for (var i=0; i<updatebox.length; i++){
							updatebox[i].style.display = 'block';
						}
					} else {
						var updatebox = document.getElementsByClassName("admincheck");
						for (var i=0; i<updatebox.length; i++){
							updatebox[i].style.display = 'none';
						}
					}
				},
				error: function (error) {
					console.log('Error:', error);
				}
			});

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
                    getMcal();
					document.getElementById("ins_ctime").value = null;
					document.getElementById("ins_ctitle").innerText = "";
					document.getElementById("ins_ccontent").innerText = "";
                },
                error: function(error) {
                    console.log('Error:', error);
                }
            });
		}
		function getMcal(){
			var selectedGroup = document.getElementById("mySelect").value; 
            mycalendar = document.querySelector('.mydates');
            var currentMonth2 = currentMonth+1
            var currentDate2 = document.getElementById("ca_date").value;
            var currentDate3 = Number(currentDate2);
            console.log(currentYear);
            console.log(currentMonth2);
			if(selectedGroup != '내 캘린더'){
				console.log("내 캘린더 아님")
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
						admincheck();
						selectDate(document.getElementById("ca_date").value)
					},
					error: function(error) {
						console.log('Error:', error);
					}
				});
			}else{
				console.log("내 캘린더임")
				$.ajax({
					type: 'GET',
					url: '/calrest/getmymonth',
					data: {
						ca_year: currentYear,
						ca_month: currentMonth2,
						gr_name: selectedGroup
					},
					dataType: 'json',
					success: function(result) {
						// 성공 시 결과를 화면에 표시
						displaydot(result);
						admincheck();
						selectDate(document.getElementById("ca_date").value)
					},
					error: function(error) {
						console.log('Error:', error);
					}
				});
			}

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
		function testcheck(){

		}
		$(document).on('click', '.current', function() {
		    $(".current").removeClass('today');
		    $(this).addClass('today');
		});

		function deleteCal() {
			if(document.getElementById("mySelect").value == "선택해주세요"){
				alert("그룹을 선택해주세요");
				return;
			}
			var checkboxes = document.querySelectorAll('input[name="delchk"]:checked');
			var values = [];
			checkboxes.forEach(function(checkbox) {
				values.push(checkbox.value);
			});
			console.log(values);
			$.ajax({
				type: 'POST',
				url: '/calrest/delcal',
				data: JSON.stringify({
					delchk: values
				}),
				contentType: 'application/json',
				dataType:'text',
				success: function(result) {
					// 성공 시 결과를 화면에 표시
					getMcal();
				},
				error: function(error) {
					console.log('Error:', error);
					alert('Error occurred. See console for details.');
				}
			});
		}
		function displayUpdate(id){
			document.getElementById(id).style.display = "block";
		}
		function hideUpdate(id){
			document.getElementById(id).style.display = "none";
		}
		function updateCal(i) {
			if(document.getElementById("mySelect").value == "선택해주세요"){
				alert("그룹을 선택해주세요");
				return;
			}
			var udtime = document.getElementById("udttime"+i).value;
			var udtitle = document.getElementById("udttitle"+i).innerText;
			var udcontent = document.getElementById("udtcontent"+i).innerText;
			$.ajax({
				type: 'POST',
				url: '/calrest/updatecal',
				data: {
					ca_no: i,
					ca_time: udtime,
					ca_title: udtitle,
					ca_content: udcontent
				},
				dataType: 'text',
				success: function(result) {
					// 성공 시 결과를 화면에 표시
					getMcal();
					hideUpdate("no"+i);
				},
				error: function(error) {
					console.log('Error:', error);
				}
			});
		}
    </script>
<%@include file="../includes/footer.jsp"%>