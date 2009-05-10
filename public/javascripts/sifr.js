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
	$('.resume h1').sifr({
		fontSize: '36px',
		color: '#000'
	});
	$('.resume h3').sifr({
		color: '#000'
	});
	$('.resume .degree').sifr();
	$('.resume .skill_name').sifr({
		// font: 'tuffy_bold'
		fontSize: '11px'
	});
	$('.resume .title').sifr({
		fontSize: '16px'
	});
	$('.about_name').sifr({
		font: 'tuffy_bold',
		fontSize: '18px'
	});
	
}

$(document).ready(function() {
  sifrize();
});