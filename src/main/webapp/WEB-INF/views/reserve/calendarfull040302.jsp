<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %> --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> --%>
<%-- <%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %> --%>
<%-- <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${ pageContext.servletContext.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="/ssm/resources/js/jquery-3.7.0.min.js"></script>
<link href="/ssm/resources/js/fullcalendar-5.0.1/lib/main.css"  rel="stylesheet"  />
<script type="text/javascript" src="/ssm/resources/js/fullcalendar-5.0.1/lib/main.js"></script>
<script type="text/javascript" src="/ssm/resources/js/fullcalendar-5.0.1/lib/locales/ko.js"></script>

<style>
body {
	line-height:14px;
}
#calendar {
 max-width: 1100px;
 margin: 0 auto;
}

#form-div {
 background-color: '';
 padding:5px 5px 5px;
 width: 100%;    
 margin-top: 5px;
 -moz-border-radius: 7px;
 -webkit-border-radius: 7px;
}

.feedback-input {
 color:#3c3c3c;
 font-family: Helvetica, Arial, sans-serif;
 font-weight:400;
 font-size: 11px;
 border-radius: 0;
 line-height: 22px;
 background-color: #ffffff;
 padding: 3px 3px 3px 6px;
 margin-bottom: 10px;
 width:100%;
 -webkit-box-sizing: border-box;
 -moz-box-sizing: border-box;
 -ms-box-sizing: border-box;
 box-sizing: border-box;
 border: 3px solid rgba(0,0,0,0);
}

.feedback-input:focus {
  background: #fff;
  box-shadow: 0;
  /*border: 3px solid #3498db;*/
  border-color: #3498db;
  color: #3498db;
  outline: none;
  /*padding: 13px 13px 13px 54px;*/
}
 
.focused {
  color:#30aed6;
  border:#30aed6 solid 3px;
}
 
/* Icons */
#name {
  background-image: url(http://rexkirby.com/kirbyandson/images/name.svg);
  background-size: 30px 30px;
  background-position: 11px 8px;
  background-repeat: no-repeat;
}
 
#email {
  background-image: url(http://rexkirby.com/kirbyandson/images/email.svg);
  background-size: 30px 30px;
  background-position: 11px 8px;
  background-repeat: no-repeat;
}
 
#comment {
  background-image: url(http://rexkirby.com/kirbyandson/images/comment.svg);
  background-size: 30px 30px;
  background-position: 11px 8px;
  background-repeat: no-repeat;
}
 
textarea {
  width: 100%;
  height: 150px;
  line-height: 150%;
  resize:vertical;
}
 
input:hover, textarea:hover,
input:focus, textarea:focus {
  background-color:white;
}
 
#button-blue {
  font-family: 'Montserrat', Arial, Helvetica, sans-serif;
  float:left; /* 플롯 중요(::after 가상요소 이용)*/
  width: 100%;
  border: #fbfbfb solid 4px;
  cursor:pointer;
  background-color: #3498db;
  color:white;
  font-size:24px;
  padding-top:22px;
  padding-bottom:22px;
  -webkit-transition: all 0.3s;
  -moz-transition: all 0.3s;
  transition: all 0.3s;
  margin-top:-4px;
  font-weight:700;
}
 
#button-blue:hover {
  background-color: rgba(0,0,0,0);
  color: #0493bd;
}
 
.ease {
  width: 0;
  height: 74px;
  background-color: #fbfbfb;
  -webkit-transition: .3s ease;
  -moz-transition: .3s ease;
  -o-transition: .3s ease;
  -ms-transition: .3s ease;
  transition: .3s ease;
}
 
.submit:hover .ease {
  width:100%;
  background-color:white;
}

</style>

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