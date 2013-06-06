# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
	$('#users_table').dataTable({
		"bPaginate": false
	})
	oTable = $('#users_table').dataTable()
	
	$('.user_role select').change ->
		$(this).closest('form').submit()