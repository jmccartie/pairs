# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
	$('#needs_table').dataTable({
		"sScrollY": "300px",
		"bPaginate": false,
		"sDom": '<"top">rt<"bottom"p><"clear">'
	})
	oTable = $('#needs_table').dataTable()
	$('#needs_search').keypress ->
	      oTable.fnFilter $(this).val()
	$('#needs_search').blur ->
	      oTable.fnFilter $(this).val()
