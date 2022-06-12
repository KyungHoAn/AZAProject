<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List" %>
<%@page import="com.aza.service.domain.Schedule" %>

<!DOCTYPE html>
<html lang='en'>
<head>
<meta charset='utf-8' />
<link type="text/css" href="/resources/css/schedule.css" rel="stylesheet" />
<script type="text/javascript"	src="/resources/javascript/schedule/main.js"></script>
<!-- <script src='../lib/main.min.js'></script> -->
<script type="text/javascript"	src="/resources/javascript/schedule/ko.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- <script src="http://code.jquery.com/jquery-2.1.4.min.js"></script> -->
<script src="path/jquery-3.3.1.min.js"></script>

<script>
      //addEventListener => Ư�����(id, class,tag���)event�� Ŭ���ϸ� �Լ��� ������
      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');

        var calendar = new FullCalendar.Calendar(calendarEl, {
          headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridDay'
          },

          initialView: 'dayGridMonth',
          locale: 'ko',   //�ѱۼ��� ������ ����� ����
          buttonIcons: false, //������ �����޷� ���� <> == true
          navLinks: true,  //��¥ ������ �� ��ȸ
          businessHours: true, //�� �ð� ǥ��
          editable: true,
          selectable: true, //��¥ ���ý� ǥ��
          dayMaxEvents: true, //�̺�Ʈ�� ���� �� +ǥ�÷� ������ ����
          selectMirror: true, 
          select: function(arg){
            var title = prompt('���� ���: ');
            if(title){
              calendar.addEvent({
                title: title,
                start: arg.start,
                end: arg.end,
                allDay: arg.allDay
              })
            }
            calendar.unselect()
          },
          eventClick: function(arg){
            if(confirm('�̺�Ʈ�� ����ڽ��ϱ�?')){
              arg.event.remove()
            }
          },
          aditable: true,
            events: [
            	<%List<Schedule> calendarList = (List<Schedule>)request.getAttribute("calendarList");%>
          	  	<% if(calendarList !=null){ %>
          	  	<% for(Schedule vo : calendarList){ %>
              {            	  
                 title:'<%=vo.getScheduleTitle()%>',
                 start:'<%=vo.getScheduleStartTime()%>',
                 constraint:'fullCalendar',  //���ǵǾ����°�
                 color: '#257e4a'
              },
              <%} }%>
              {
               title: '���� api ����',
               start: '2022-06-06T13:00:00',
               constraint:'fullCalendar',  //���ǵǾ����°�
               color: '#257e4a'
             }
              /* ${schedule.scheduleStartTime}, */
              /* ${schedule.scheduleTitle}, */
          //   {
          //     title: '����api �����ھ�!!',
          //     start: '2022-06-06T19:00:00',
          //     end: '2022-06-07T09:30:00'
          //   },
          //   {
          //     title: '���� ȸ��',
          //     start: '2022-06-06T21:00:00',
          //     end: '2022-06-06T22:00:00'
          //   }
            // , // ���� �������� ������ �� �ִ� ���� ǥ��
            // {
            //   groupId: 'fullCalendar',
            //   start: '2022-06-06T13:00:00',
            //   end: '2022-06-17T09:00:00',
            //   display: 'background'
            // },
            // {//���� ���� ������ ǥ��
            //   start: '2022-06-06',
            //   end: '2022-06-07',
            //   overlap: false,
            //   display: 'background',
            //   color: '#ff9f89'
            // }
        	   ]
        });

        calendar.render();

        //������ �ɼ��� ����Ǹ� �������� �������� �ɼ� ����
        localeSelectorEl.addEventListener('change', function() {
            if (this.value) {
              calendar.setOption('locale', this.value);
            }
          });
      });

    </script>

<style>
body {
	margin: 40px 10px;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 1100px;
	margin: 0 auto;
	padding: 0 10px;
}

.fc-header-toolbar {
	/*�޷� ��� ���� ��ġ ����*/
	padding-top: 1em;
	padding-left: 1em;
	padding-right: 1em;
}

#loading {
	display: none;
	position: absolute;
	top: 10px;
	right: 10px;
}
</style>

</head>
<body>
	<h2>ScheduleTest</h2>
	<div id='loading'>loading...</div>
	<div id='calendar'></div>
</body>
</html>