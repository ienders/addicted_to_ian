var tuffy = { src: '/swf/tuffy.swf' };
var tuffy_bold = { src: '/swf/tuffy_bold.swf' };

sIFR.activate(tuffy, tuffy_bold);

// Now we can do the replacements. You can do as many as you like, but just
// as an example, we'll replace all `<h1>` elements with the Futura movie.
// 
// The first argument to `sIFR.replace` is the `futura` object we created earlier.
// The second argument is another object, on which you can specify a number of
// parameters or "keyword arguemnts". For the full list, see "Keyword arguments"
// under `replace(kwargs, mergeKwargs)` at 
// <http://wiki.novemberborn.net/sifr3/JavaScript+Methods>.
// 
// The first argument you see here is `selector`, which is a normal CSS selector.
// That means you can also do things like '#content h1' or 'h1.title'.
//
// The second argument determines what the Flash text looks like. The main text
// is styled via the `.sIFR-root` class. Here we've specified `background-color`
// of the entire Flash movie to be a light grey, and the `color` of the text to
// be red. Read more about styling at <http://wiki.novemberborn.net/sifr3/Styling>.
sIFR.replace(tuffy, {
  selector: '.main_content h3',
  css: '.sIFR-root { font-size: 30px; color: #464646;  }'
});

sIFR.replace(tuffy, {
  selector: '.main_content h4',
  css: [
  '.sIFR-root { font-size: 20px; color: #464646; }',
  'a:link { color: #F26E25; }',    
	'a:visited { color: #F26E25; }',  
	'a:hover { color: #000000; }',	
	'a:active { color: #F26E25; }'
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
  'a:link { color: #F26E25; }',    
	'a:visited { color: #F26E25; }',  
	'a:hover { color: #000000; }',	
	'a:active { color:#F26E25; }'
	]
});

sIFR.replace(tuffy_bold, {
  selector: '.month_nav',
  css: [
  '.sIFR-root { font-size: 14px; color: #000000 }',
  'a:link { color: #F26E25; }',    
	'a:visited { color: #F26E25; }',  
	'a:hover { color: #000000; }',	
	'a:active { color: #F26E25; }'
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

$('.sIFR-alternate').hide();