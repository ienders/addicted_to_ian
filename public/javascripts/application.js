$(function() {
	// Hover on/off for navigation.
	$('.nav_links img, .footer_links img').each(function() {
		if ($(this).attr('src').match('_off')) {
			$(this).hover(
				function() {
					$(this).attr('src', $(this).attr('src').replace('_off', '_on'));
				},
				function() {
					$(this).attr('src', $(this).attr('src').replace('_on', '_off'));					
				}
			);
		}
	});
	
});