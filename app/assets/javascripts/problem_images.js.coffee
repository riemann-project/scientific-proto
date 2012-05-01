# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(-> $('#active_image').Jcrop( onChange: showCoords, onSelect: showCoords) )

showCoords = (c) ->
	$('#x').val c.x
	$('#y').val c.y
	$('#w').val c.w
	$('#h').val c.h