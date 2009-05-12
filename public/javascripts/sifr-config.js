var tuffy = { src: '/swf/tuffy.swf' };
var tuffy_bold = { src: '/swf/tuffy_bold.swf' };

sIFR.activate(tuffy, tuffy_bold);

function sifrize() {
	sIFR.replace(tuffy, {
	  selector: '.main_content h3',
	  css: '.sIFR-root { font-size: 30px; color: #464646; line-height: 0.4em  }'
	});


	sIFR.replace(tuffy, {
	  selector: '.main_content h4',
	  css: [
	  '.sIFR-root { font-size: 20px; color: #464646; }',
	  'a:link { color: #F26E25; text-decoration: none }',    
		'a:visited { color: #F26E25; text-decoration: none }',  
		'a:hover { color: #000000; text-decoration: none }',	
		'a:active { color: #F26E25; text-decoration: none }'
		]
	});

	sIFR.replace(tuffy, {
	  selector: '.main_content h5',
	  css: '.sIFR-root { font-size: 15px; color: #464646  }'
	});

	sIFR.replace(tuffy, {
	  selector: '.main_content h6',
	  css: '.sIFR-root { font-size: 12px; color: #464646 }'
	});

	sIFR.replace(tuffy, {
	  selector: '.widget h3',
	  css: '.sIFR-root { font-size: 18px; color: #000000 }'
	});

	sIFR.replace(tuffy_bold, {
	  selector: '.month_name',
	  css: [
	  '.sIFR-root { font-size: 14px; color: #888888 }',
	  'a:link { color: #F26E25; text-decoration: none }',    
		'a:visited { color: #F26E25; text-decoration: none }',  
		'a:hover { color: #000000; text-decoration: none }',	
		'a:active { color:#F26E25; text-decoration: none }'
		]
	});

	sIFR.replace(tuffy_bold, {
	  selector: '.month_nav',
	  css: [
	  '.sIFR-root { font-size: 14px; color: #000000 }',
	  'a:link { color: #F26E25; text-decoration: none }',    
		'a:visited { color: #F26E25; text-decoration: none }',  
		'a:hover { color: #000000; text-decoration: none }',	
		'a:active { color: #F26E25; text-decoration: none }'
		]
	});

	sIFR.replace(tuffy, {
	  selector: '.resume h1',
	  css: '.sIFR-root { font-size: 36px; color: #000000 }'
	});

	sIFR.replace(tuffy, {
	  selector: '.resume h3',
	  css: '.sIFR-root { color: #000000 }'
	});

	sIFR.replace(tuffy, {
	  selector: '.resume .degree',
	  css: '.sIFR-root { color: #000000 }'
	});

	sIFR.replace(tuffy, {
	  selector: '.resume .title',
	  css: '.sIFR-root { font-size: 16px; color: #000000 }'
	});

	sIFR.replace(tuffy_bold, {
	  selector: '.about_name',
	  css: '.sIFR-root { font-size: 18px; color: #000000 }'
	});
}

$(function() {
	sifrize();
});
