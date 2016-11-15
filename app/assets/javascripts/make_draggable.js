var zIndex = 0;

function make_draggable(elements)
{
	/* Elements is a jquery object: */
	elements.draggable({

		containment:'parent',
		start:function(e,ui){ ui.helper.css('z-index',++zIndex); },
		stop:function(e,ui){

			/* Sending the z-index and positon of the note to update_position.php via AJAX GET: */
			$.post('/notes/update_position',{
				pos_x		: ui.position.left,
				pos_y		: ui.position.top,
				z_index		: zIndex,
				note_id	: ui.helper.find('span.data').html()
			});
		}
	});
}
