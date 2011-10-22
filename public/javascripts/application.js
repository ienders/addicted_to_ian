$(function() {
  Application.init();
});

var Application = function() {
  
  return {  
    init: function() {
      this.cufonize();
    	SyntaxHighlighter.config.clipboardSwf = '/swf/clipboard.swf';
      SyntaxHighlighter.all();
    },
    
    cufonize: function() {
      Cufon.replace(['.main_content h3, .plug_description_holder h3, .main_content h4, .widget h3, .main_content h5, .main_content h6, .month_name, .month_nav, .resume h1, .resume h3, .resume .degree, .resume .title, .about_name'], { fontFamily: 'Tuffy', hover: true });	
    	Cufon.now();
    }
  };
  
}();

var Tweets = function() {
  return {
    load: function() {
      $('#tweets').load('/blogs/tweets');
    }
  };
}();
