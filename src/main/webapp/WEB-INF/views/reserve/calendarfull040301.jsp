<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${ pageContext.servletContext.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="/ssm/resources/js/jquery-3.7.0.min.js"></script>
<link href="/ssm/resources/js/fullcalendar-5.0.1/lib/main.css"  rel="stylesheet"  />
<script type="text/javascript" src="/ssm/resources/js/fullcalendar-5.0.1/lib/main.js"></script>
<script type="text/javascript" src="/ssm/resources/js/fullcalendar-5.0.1/lib/locales/ko.js"></script>

<script>
  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById("calendar");

    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      minTime :'10:00:00',
      maxTime :'24:00:00',
      locale:'ko',
      initialDate: '2024-04-03',
      navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,
      select: function(arg) {
        var title = prompt('일정 입력:');
        
        if (title) {
          calendar.addEvent({
            title: title,
            start: arg.start,
            end: arg.end,
            allDay: arg.allDay
          })
        }
        calendar.unselect()
      },
      eventClick: function(calEvent, jsEvent) {
    	/*   
        if (confirm('Are you sure you want to delete this event?')) {
          arg.event.remove()
        }
         */
         var title = prompt('일정 수정:', calEvent.title, {
             buttons: {
                 Ok: true,
                 Cancel: false
             }
         });
         
    	  if (title){
              calEvent.title = title;
              calEvent.start=calEvent.start,
              calEvent.end=calEvent.end,
              calEvent.allDay=calEvent.allDay
              calendar.fullCalendar('updateEvent',calEvent);
          }
      },
      editable: true,
      dayMaxEvents: true, // allow "more" link when too many events
      events: [
        {
          title: 'All Day Event',
          start: '2024-04-01'
        },
        {
          title: 'Long Event',
          start: '2024-04-07',
          end: '2024-04-10'
        },
        {
          groupId: 999,
          title: 'Repeating Event',
          start: '2024-04-09T16:00:00'
        },
        {
          groupId: 999,
          title: 'Repeating Event',
          start: '2024-04-16T16:00:00'
        },
        {
          title: 'Conference',
          start: '2024-04-11',
          end: '2024-04-13'
        },
        {
          title: 'Meeting',
          start: '2024-04-12'
        },
        {
          title: 'Lunch',
          start: '2024-04-12T12:00:00'
        },
        {
          title: 'Meeting',
          start: '2024-04-12T14:30:00'
        },
        {
          title: 'Happy Hour',
          start: '2024-04-12T17:30:00'
        },
        {
          title: 'Dinner',
          start: '2024-04-12T20:00:00'
        },
        {
          title: 'Birthday Party',
          start: '2024-04-13T07:00:00'
        },
        {
          title: 'Click for Google',
          url: 'http://google.com/',
          start: '2024-04-28',
          end :'2024-04-30'
        }
      ]
    });

    calendar.render();
  });

</script>
<title>calendar2</title>

<style type="text/css">
  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 1100px;
    margin: 0 auto;
  }

</style>
</head>
<body>

  <div id='calendar'></div>
  
</body>
</html>