# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
	$('#patient_risk').change ->
	  	risk = $('#patient_risk').val()
	  	if risk == 'low'
	    	$('#suggestion').text 'larger than 5mg, smaller than 10mg'
	  	else if risk == 'high'
	    	$('#suggestion').text 'smaller than 5mg'
	  	return