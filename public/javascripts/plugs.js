function PlugThumbs(options) {
  options = $.extend({ per_row: 4, visible_rows: 3 }, options);
  this.per_row = options.per_row;
  this.visible_rows = options.visible_rows;
  this.visible = true;
  this.thumbs = new Array();
  this.current_thumb = null;
  
  this.first_row = 0;
  this.last_row = this.visible_rows - 1;
  this.height_offset = 0;
  
  this.add = function(plug_thumb) {
    this.thumbs[plug_thumb.num] = plug_thumb;
  };
  this.get = function(num) {
    return this.thumbs[num];
  };
  this.numRows = function() {
    return Math.ceil($('.thumb_holder').size() / this.per_row);
  };
  this.rowHeight = function() {
    return parseInt($('.thumb_holder:first').css('height')) - 1;
  };
  this.fadeThumbs = function(except) {
    this.current_thumb = except;
    this.visible = false;
    
    if (this.numRows() > this.visible_rows) {
      $('.row_nav').fadeOut();
    }
    
    this.to_fade = new Array();
    this.to_fade_index = 0;
    for (var i = 0; i < $('.thumb_holder').size(); i++) {
      if (this.get(i).row < this.first_row || this.get(i).row > this.last_row) {
        // Flat out hide all non-visible rows
        $('#plug_' + i).hide();
      } else if (parseInt(except.attr('rel')) != i) {
        // Fade randomly
        this.to_fade.push(i);
      } 
    }
    this.to_fade.sort(function() { return (Math.round(Math.random()) - 0.5) });
    this.randomFade($('#plug_' + this.to_fade[this.to_fade_index]));
  };
  this.randomFade = function(thumb) {
    var self = this;
    var j = parseInt(thumb.attr('rel'));
    thumb.fadeOut(100, function() {
      self.to_fade_index++;
      if (self.to_fade_index < self.to_fade.length) {
        self.randomFade($('#plug_' + self.to_fade[self.to_fade_index]));
      } else {
        self.slideThumbAndOpenPlug();
      }
    });
  };
  this.slideThumbAndOpenPlug = function() {
    var self = this;
    thumb = this.current_thumb
    thumb.find('img').attr('src', thumb.find('.large_img').html());
    thumb.animate({ left: 17, top: 27 + self.height_offset }, 2000, function() {
      thumb.find('img').animate({ height: 300, width: 500 }, 'medium', function() {
        $('#plug_main_' + self.current_thumb.attr('rel')).fadeIn('slow', function() {
          plug = $(this);
          
          Application.cufonize();
          
          plug.find('.plug_text').fadeIn('slow', function() {
            plug.find('.plug_link_holder').fadeIn('slow', function() {
              plug.find('.close').fadeIn('slow');
            });
          });
        });
      });
    });
  };
  this.closePlugAndRevertThumb = function() {
    var self = this;
    
    $('#plug_main_' + self.current_thumb.attr('rel')).fadeOut('slow', function() {
      var thumb = self.get(parseInt(self.current_thumb.attr('rel')));
      self.current_thumb.find('a').css('cursor', 'pointer');
      self.current_thumb.find('img').animate({ height: thumb.img_height, width: thumb.img_width }, 'medium');
      self.current_thumb.animate({ left: thumb.thumb_left, top: thumb.thumb_top }, 'medium', function() {
        $('.plug_text').hide();
        $('.plug_link_holder').hide();
        $('.close').hide();
        $('.thumb_holder').fadeIn('fast');
        
        if (self.numRows() > self.visible_rows) {
          $('.row_nav').fadeIn();
        }
        
        self.visible = true;
      });
    });
  };
}

function PlugThumb(thumbs, obj) {
  this.obj = obj;
  this.num = parseInt(obj.attr('rel'));
  this.col = this.num % thumbs.per_row;
  this.row = (this.num - (this.num % thumbs.per_row)) / thumbs.per_row;
  this.img_height = parseInt(obj.find('img').css('height'));
  this.img_width  = parseInt(obj.find('img').css('width'));
  this.thumb_top  = (parseInt(obj.css('height')) - 1) * this.row + 1;
  this.thumb_left = (parseInt(obj.css('width')) - 1) * this.col + 1;
  
  this.freeze = function() {
    this.obj.css('position', 'absolute').css('top', this.thumb_top).css('left', this.thumb_left);
  }
}

$(function() {
  Plugs.init();
});

var Plugs = function() {

var thumbs;
  
  return {
    
    init: function() {
      
      thumbs = new PlugThumbs();
      
      if (thumbs.numRows() > thumbs.visible_rows) {
        $('.row_nav').show();     
        if (thumbs.last_row >= thumbs.numRows() - 1) {
          $('.next_row').css('opacity', 0.5);
        }
        if (thumbs.first_row <= 0) {
          $('.prev_row').css('opacity', 0.5);
        }  
      }
      
      $('.thumb_holder').each(this.create_thumb);
      $('.thumb_holder').click(this.click_thumb);
      $('.thumb_holder').hover(this.thumb_mouseon, this.thumb_mouseoff);
      $('.close').click(this.close_plug);
      $('.next_row').click(this.next_row);
      $('.prev_row').click(this.prev_row);
    },
    
    create_thumb: function() {
      var thumb = new PlugThumb(thumbs, $(this));
      thumbs.add(thumb);
      thumb.freeze();
    },
    
    click_thumb: function() {
      if (!thumbs.visible) {
        return false;
      }
      $(this).find('a').css('cursor', 'default');
      $(this).find('span').fadeOut('fast');
      $(this).find('.plug_title_overlay').fadeOut('fast');
      thumbs.fadeThumbs($(this))
      return false;
    },
    
    thumb_mouseon: function() {
      if (!thumbs.visible) {
        return;
      }
      $(this).find('.plug_title_overlay').slideToggle('fast', function() {
        $(this).find('span').fadeIn('fast');
      });
    },
    
    thumb_mouseoff: function() {
      if (!thumbs.visible) {
        $(this).find('span').hide();
        $(this).find('.plug_title_overlay').hide();
        return;
      }
      $(this).find('span').fadeOut('fast', function() {
        $(this).parents('.plug_title_overlay').slideToggle('fast');
      });
    },
    
    close_plug: function() {
      thumbs.closePlugAndRevertThumb();
      return false;
    },
    
    next_row: function() {
      if (thumbs.last_row >= thumbs.numRows() - 1) {
        return false;
      }
      
      $('.prev_row').css('opacity', 1);
      thumbs.height_offset += thumbs.rowHeight();
      thumbs.first_row++;
      thumbs.last_row++;
      $('.thumb_slider').animate({ top: -thumbs.height_offset });

      if (thumbs.last_row >= thumbs.numRows() - 1) {
        $(this).css('opacity', 0.5);
      }
      
      $(this).effect("highlight", { color: 'orange' }, 300);
      return false;
    },
    
    prev_row: function() {
      if (thumbs.first_row <= 0) {
        return false;
      }
      
      $('.next_row').css('opacity', 1);
      thumbs.height_offset -= thumbs.rowHeight();
      thumbs.first_row--;
      thumbs.last_row--;
      $('.thumb_slider').animate({ top: -thumbs.height_offset });

      if (thumbs.first_row <= 0) {
        $(this).css('opacity', 0.5);
      }
      
      $(this).effect("highlight", { color: 'orange' }, 300);
      return false;
    }
    
  }
  
}();