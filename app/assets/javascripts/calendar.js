// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
    $(document).ready(function() {

	    $('#calendar').fullCalendar({
	      header: {
	        left: 'prev,next today',
	        center: 'title',
	        right: 'month,basicWeek'
	      },
	      defaultView: 'month',
	      height: 600,


	      eventClick: function(event) {
	        $.modal("<p><h1>" + event.title + "</h1>" + "<br />" + 
	        				event.number + "<br />" + 
	        				event.start_date + "<br />" +
	        				event.end_date + "<br />" + 
	        				event.members + "<br />" +
	        				event.completed + "<br />" +
	        				event.billed + "<br />" +
	        				event.bugs + "<br />" + 
	        				event.completed_points + "</p>");
	      }, 
	      events: '/calendar/events'
	    })

  	});