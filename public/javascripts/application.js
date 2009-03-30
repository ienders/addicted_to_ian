$(document).ready(function() {
  $.sifr({ path: '/swf/', save: true });
	$('.blog_content h3').sifr({
		font: 'tuffy',
		fontSize: '26pt',
		color: '#454545'
	});
	$('.nav_links div').sifr({
		font: 'tuffy',
		fontSize: '18pt',
		color: '#000000',
		link: '#000000',
		hover: '#FD8340'
	});
});