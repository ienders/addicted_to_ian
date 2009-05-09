function sifrize() {
	$.sifr({ path: '/swf/', font: 'tuffy', color: '#000000', save: true });
	$('.main_content h3').sifr({
		fontSize: '30px',
		color: '#464646'
	});
	$('.main_content h4').sifr({
		fontSize: '20px',
		color: '#464646',
		link: '#F26E25',
		hover: '#000000'
	});
	$('.main_content h5').sifr({
		fontSize: '15px',
		color: '#464646'
	});	
	$('.main_content h6').sifr({
		fontSize: '12px',
		color: '#464646'
	});
  // $('.nav_links div').sifr({
  //     fontSize: '17px',
  //  link: '#000000',
  //  hover: '#F26E25'
  // });
  // $('.footer_links div').sifr({
  //  font: 'tuffy_bold',
  //  fontSize: '14px',
  //  link: '#000000',
  //  hover: '#F26E25'
  // });
	$('.widget h3').sifr({
		fontSize: '18px'
	});
	$('.month_name').sifr({
		font: 'tuffy_bold',
		fontSize: '14px',
		color: '#888888',
		link: '#464646',
		hover: '#000000',
	});
	$('.month_nav').sifr({
		font: 'tuffy_bold',
		fontSize: '14px',
		link: '#F26E25',
		hover: '#000000'
	});
	$('h1#name').sifr({
		fontSize: '36px',
		color: '#000'
	});
	$('h3.underlined_header').sifr({
		fontSize: '15px',
		color: '#000',
		padding: '10px 0'
	});
}

$(document).ready(function() {
  sifrize();
});