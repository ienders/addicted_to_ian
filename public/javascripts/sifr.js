function sifr_plugs() {
	$('.plugs_content h3').sifr({
		fontSize: '30px',
		color: '#464646'
	});
	// $('.plugs_content h4').sifr({
	// 	fontSize: '18px',
	// 	color: '#464646',
	// 	link: '#F26E25',
	// 	hover: '#000000'
	// });
// 	$('.plugs_content li').sifr({
// 		font: 'tuffy_bold',
// 		fontSize: '14px',
// 		color: '#464646',
// 		link: '#F26E25',
// 		hover: '#000000'
// 	});
// 	$('.plug_link_holder').sifr({
// 		font: 'tuffy_bold',
// 		fontSize: '20px',
// 		color: '#464646',
// 		link: '#F26E25',
// 		hover: '#000000'
// 	});
}

function sifrize() {
	$.sifr({ path: '/swf/', font: 'tuffy', color: '#000000', save: true });
	$('.blog_content h3').sifr({
		fontSize: '30px',
		color: '#464646'
	});
	$('.blog_content h4').sifr({
		fontSize: '20px',
		color: '#464646',
		link: '#F26E25',
		hover: '#000000'
	});
	$('.blog_content h5').sifr({
		fontSize: '15px',
		color: '#464646'
	});	
	$('.blog_content h6').sifr({
		fontSize: '12px',
		color: '#464646'
	});
	$('.nav_links div').sifr({
    fontSize: '17px',
		link: '#000000',
		hover: '#F26E25'
	});
	$('.footer_links div').sifr({
		font: 'tuffy_bold',
		fontSize: '14px',
		link: '#000000',
		hover: '#F26E25'
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
	sifr_plugs();
}

$(document).ready(function() {
  sifrize();
});