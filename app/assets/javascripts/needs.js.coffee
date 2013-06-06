# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
	
	calcDataTableHeight = ->
		return $('#needs_wrapper').height() - 105

	oTable = $('#needs_table').dataTable({
		"sScrollY": calcDataTableHeight(),
		"bPaginate": false,
		"sDom": '<"top">rt<"bottom"p><"clear">'
	})
	
	$('#needs_search').keyup ->
	      oTable.fnFilter $(this).val()
	$('#needs_search').blur ->
	      oTable.fnFilter $(this).val()
	
	$('#showHideMap').click ->
		$('#main').toggleClass('hideMap')
		# Leave for now until I rewrite this stuff
		# $('#needs_wrapper').height($(window).height() - 40)
		clearTimeout(window.refresh_size)
		window.refresh_size = setTimeout( -> $(window).resize()
		1000)

	$(window).resize ->
		$('div.dataTables_scrollBody').height(calcDataTableHeight())
		oSettings = oTable.fnSettings()
		oSettings.oScroll.sY = calcDataTableHeight(); 
		oTable.fnDraw()
		
	$('#comment_content').focus ->
		$(this).addClass('typing')
		
	$('#comment_content').blur ->
		$(this).removeClass('typing')