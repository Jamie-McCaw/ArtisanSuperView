// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(function() {
	$( "#datepicker" ).datepicker({
		dateFormat: 'yy-mm-dd',
		onSelect: function(dateText, inst) {
			$.get('/week_picker/' + dateText, function(data) {
				alert(data['start_date'] + " " + data['end_date']);
			})
		}
	});
});