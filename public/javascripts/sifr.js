$(document).ready(function() {
  $.sifr({ path: '/swf/', save: true });
	$('.blog_content h3').sifr({
		font: 'tuffy',
		fontSize: '30px',
		color: '#464646'
	});
	$('.nav_links div').sifr({
		font: 'tuffy',
    fontSize: '17px',
		color: '#000000',
		link: '#000000',
		hover: '#F26E25'
	});
	$('.footer_links div').sifr({
		font: 'tuffy_bold',
		fontSize: '14px',
		color: '#000000',
		link: '#000000',
		hover: '#F26E25'
	});
	$('.widget h3').sifr({
		font: 'tuffy',
		fontSize: '18px',
		color: '#000000'
	});
});
