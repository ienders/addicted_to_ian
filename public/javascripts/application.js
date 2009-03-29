$(document).ready(function() {
  $.sifr({ path: '/swf/', save: true });
	$('h3').sifr({
		font: 'tuffy',
		fontSize: '30px',
		color: '#454545'
	});
	$('#navigation ul li').sifr({
		font: 'tuffy',
		fontSize: '18px',
		color: 'black'
	});
});