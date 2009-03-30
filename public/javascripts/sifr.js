$(document).ready(function() {
  $.sifr({ path: '/swf/', save: true });
	$('.blog_content h3').sifr({
		font: 'tuffy',
		fontSize: '26pt',
		color: '#464646'
	});
	$('.nav_links div').sifr({
		font: 'tuffy',
		fontSize: '18pt',
		color: '#000',
		link: '#000',
		hover: '#FD8340'
	});
	$('.footer_links div').sifr({
		font: 'tuffy_bold',
		fontSize: '16px',
		color: '#000',
		link: '#000',
		hover: '#FD8340'
	});
});
