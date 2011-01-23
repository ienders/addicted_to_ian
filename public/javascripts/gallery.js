$(function() {
  Gallery.init();
});

var Gallery = function() {
  
  var num_albums;
  var album_first = 0;
  var album_last =  3;

  var num_image_rows = 0;
  var image_row_first = 0;
  var image_row_last = 3;

  var currentX = 0;
  var currentY = 0;
  
  return {
    
    init: function() {
      num_albums = $('.album_nav').data('size');
      
      $('#back_album').click(this.back_album);
      $('#forward_album').click(this.forward_album);
      $('#back_images').click(this.back_images);
      $('#forward_images').click(this.forward_images);
      $('.album_link').click(this.load_album);
      $('.gallery_image').live('click', this.load_image);

      $('#picture').hover(
        function () {
          $('#image_data').fadeIn();
        }, 
        function () {
          $('#image_data').fadeOut();
        }
      );

      $().mousemove(function(e) {
        currentX = e.pageX;
        currentY = e.pageY;
      }); 

      $('#back_album').css('background-color', '#DDDDDD');

      if (num_albums <= 4) {
        $('#forward_album').css('background-color', '#DDDDDD');
        $('#forward_album').find('img').fadeOut();
      }
    },
    
    back_album: function() {
      if (album_first == 1) {
        $('#back_album').css('background-color', '#DDDDDD');
        $('#back_album').find('img').fadeOut();
      }

      if (num_albums <= 4 || album_first == 0) {
        return;
      }

      $(this).effect("highlight", { color: 'orange' }, 300);

      $('#forward_album').css('background-color', 'white');
      $('#forward_album').find('img').fadeIn();

      $('#album_' + album_last).slideToggle('fast');
      album_last--; album_first--;
      $('#album_' + album_first).slideToggle('fast');
    },
    
    forward_album: function() {
      if (album_last == num_albums -2) {
        $('#forward_album').css('background-color', '#DDDDDD');
        $('#forward_album').find('img').fadeOut();
      }

      if (num_albums <= 4 || album_last == num_albums - 1) {
        return;
      }

      $(this).effect("highlight", { color: 'orange' }, 300);

      $('#back_album').css('background-color', 'white');
      $('#back_album').find('img').fadeIn();

      $('#album_' + album_first).slideToggle('fast');
      album_last++; album_first++;
      $('#album_' + album_last).slideToggle('fast');
    },
    
    back_images: function() {
      if (image_row_first == 1) {
        $('#back_images').css('background-color', '#DDDDDD');
        $('#back_images').find('img').fadeOut();
      }

      if (num_image_rows <= 4 || image_row_first == 0) {
        return;
      }

      $('#forward_images').css('background-color', 'white');
      $('#forward_images').find('img').fadeIn();

      $(this).effect("highlight", { color: 'orange' }, 300);

      $('#thumbs_row_' + image_row_last).slideToggle('fast');
      image_row_last--; image_row_first--;
      $('#thumbs_row_' + image_row_first).slideToggle('fast');
    },
    
    forward_images: function() {
      if (image_row_last == num_image_rows -2) {
        $('#forward_images').css('background-color', '#DDDDDD');
        $('#forward_images').find('img').fadeOut();
      }

      if (num_image_rows <= 4 || image_row_last == num_image_rows - 1) {
        return;
      }

      $(this).effect("highlight", { color: 'orange' }, 300);


      $('#back_images').css('background-color', 'white');
      $('#back_images').find('img').fadeIn();

      $('#thumbs_row_' + image_row_first).slideToggle('fast');
      image_row_last++; image_row_first++;
      $('#thumbs_row_' + image_row_last).slideToggle('fast');
    },
    
    load_album: function() {
      $('.album_link').find('img').css('opacity', 1);
      $(this).find('img').css('opacity', 0.5);
      $.ajax({
        url: '/pictures/album/' + $(this).attr('rel'),
        data: 'num_image_rows=4',
        success: function(html) {
          $('#thumb_area').html(html);
        }
      });
    },
    
    load_image:  function() {
      var img = $(this);
      $('.gallery_image').css('border', '0px').css('background-color', '#CCCCCC').css('margin-top', 0).css('margin-left', 0);
      $('.gallery_image').find('img').css('opacity', 1);
      $(this).css('border', '1px solid black').css('background-color', 'white').css('margin-top', -2).css('margin-left', -2);
      $(this).find('img').css('opacity', 0.5);

      var id = img.attr('rel');
      var width = parseInt($('#photo_width_' + id).html());
      var height = parseInt($('#photo_height_' + id).html());

      $('#picture').html('');
      $('#picture').append($(document.createElement('img')).attr('src', $('#photo_filename_' + id).html()).css({ width: width, height: height }));
      $('#picture').append($(document.createElement('div')).attr('id', 'image_data').css('display', 'none').html($('#photo_data_' + id).html()));

      $('#picture').find('img').css('margin-top', (parseInt($('#picture').css('height')) - height) / 2);
      var minX = parseInt($('.pictures').offset().left);
      var maxX = parseInt($('.pictures').offset().left) + parseInt($('.pictures').css('width'));
      var minY = parseInt($('.pictures').offset().top);
      var maxY = parseInt($('.pictures').offset().top) + parseInt($('.pictures').css('height'));
      var x = parseInt(currentX);
      var y = parseInt(currentY);    
      if (x >= minX && x <= maxX && y >= minY && y <= maxY) {
        $('#image_data').show();
      }
    },
    
    
    
  }
  
}();