// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(function() {
	$( "#datepicker" ).datepicker({
		dateFormat: 'yy-mm-dd',
		onSelect: function(dateText, inst) {
			$.get('/week_picker/' + dateText, function(data) {
				var content = "<table class='table'>"
				content += "<tr><th>Project Name</th><th>Iteration</th><th>Members</th><th>Billed</th><th>Bugs</th><th>Completed</th><th>Iteration Closed</th><th>Iteration Start Date</th><th>Iteration End Date</th></tr>";
				for(i=0; i<data.iterations.length; i++) {
					content += '<tr><td>' + data.iterations[i]['project_name'] + '</td>'
											 + '<td>' + data.iterations[i]['iteration_number'] + '</td>'
											 + '<td>' + data.iterations[i]['members'].join(', ') + '</td>'
											 + '<td>' + data.iterations[i]['billed_points'] + '</td>'
											 + '<td>' + data.iterations[i]['total_bug_points'] + '</td>'
											 + '<td>' + data.iterations[i]['completed_points'] + '</td>'
											 + '<td>' + data.iterations[i]['iteration_completed?'] + '</td>'
											 + '<td>' + data.iterations[i]['start_date'] + '</td>'
											 + '<td>' + data.iterations[i]['finish_date'] + '</td>';
				}
				content += "</table>";
				$('#here_table').append(content);
			})
		}
	});
});