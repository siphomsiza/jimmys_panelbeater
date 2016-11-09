readyHome = ->
	home = ( ->
			init = ->
        console.log "loading select2 ,timepicker ,datepicker"
				$('select').each ->
					$(this).select2()
				$('.select2-container').each ->
					$(this).attr('style','width: 40%;')
				$('.timepicker').each ->
					$(this).datetimepicker format: 'LT'
				$('.date_a_picker').each ->
					$(this).datetimepicker format: 'DD-MM-YYYY'
			init: init
		)()
	home.init()

$(document).ready readyHome
$(document).on 'page:load', readyHome
