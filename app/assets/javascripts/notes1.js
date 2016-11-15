$(document).ready(function(){
	/* This code is executed after the DOM has been completely loaded */

	var tmp;

	$('.note').each(function(){
		/* Finding the biggest z-index value of the notes */

		tmp = $(this).css('z-index');
		if(tmp>zIndex) zIndex = tmp;
	})

	/* A helper function for converting a set of elements to draggables: */
	make_draggable($('.note'));

});
