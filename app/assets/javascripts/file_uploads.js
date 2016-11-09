var fileUploadErrors = {
  maxFileSize: 'File is too big',
  minFileSize: 'File is too small',
  acceptFileTypes: 'Filetype not allowed',
  maxNumberOfFiles: 'Max number of files exceeded',
  uploadedBytes: 'Uploaded bytes exceed file size',
  emptyResult: 'Empty file upload result'
};


$(function () {
  if($('.fadein-0').length){
    console.log($('.fadein-size').length);
    $('.fadein-0 img:gt(0)').hide();
    setInterval(function () {
        $('.fadein-0 :first-child').fadeOut()
                                 .next('img')
                                 .fadeIn()
                                 .end()
                                 .appendTo('.fadein-0');
    }, 4000); // 4 seconds

    $('.fadein-1 img:gt(0)').hide();
    setInterval(function () {
        $('.fadein-1 :first-child').fadeOut()
                                 .next('img')
                                 .fadeIn()
                                 .end()
                                 .appendTo('.fadein-1');
    }, 4000); // 4 seconds

    $('.fadein-2 img:gt(0)').hide();
    setInterval(function () {
        $('.fadein-2 :first-child').fadeOut()
                                 .next('img')
                                 .fadeIn()
                                 .end()
                                 .appendTo('.fadein-2');
    }, 4000); // 4 seconds

    $('.fadein-3 img:gt(0)').hide();
    setInterval(function () {
        $('.fadein-3 :first-child').fadeOut()
                                 .next('img')
                                 .fadeIn()
                                 .end()
                                 .appendTo('.fadein-3');
    }, 4000); // 4 seconds

    $('.fadein-4 img:gt(0)').hide();
    setInterval(function () {
        $('.fadein-4 :first-child').fadeOut()
                                 .next('img')
                                 .fadeIn()
                                 .end()
                                 .appendTo('.fadein-4');
    }, 4000); // 4 seconds

    $('.fadein-5 img:gt(0)').hide();
    setInterval(function () {
        $('.fadein-5 :first-child').fadeOut()
                                 .next('img')
                                 .fadeIn()
                                 .end()
                                 .appendTo('.fadein-5');
    }, 4000); // 4 seconds

    $('.fadein-6 img:gt(0)').hide();
    setInterval(function () {
        $('.fadein-6 :first-child').fadeOut()
                                 .next('img')
                                 .fadeIn()
                                 .end()
                                 .appendTo('.fadein-6');
    }, 4000); // 4 seconds

    $('.fadein-7 img:gt(0)').hide();
    setInterval(function () {
        $('.fadein-7 :first-child').fadeOut()
                                 .next('img')
                                 .fadeIn()
                                 .end()
                                 .appendTo('.fadein-7');
    }, 4000); // 4 seconds

    $('.fadein-8 img:gt(0)').hide();
    setInterval(function () {
        $('.fadein-8 :first-child').fadeOut()
                                 .next('img')
                                 .fadeIn()
                                 .end()
                                 .appendTo('.fadein-8');
    }, 4000); // 4 seconds
    $('.fadein-9 img:gt(0)').hide();
    setInterval(function () {
        $('.fadein-9 :first-child').fadeOut()
                                 .next('img')
                                 .fadeIn()
                                 .end()
                                 .appendTo('.fadein-9');
    }, 4000); // 4 seconds

    $('.fadein-10 img:gt(0)').hide();
    setInterval(function () {
        $('.fadein-10 :first-child').fadeOut()
                                 .next('img')
                                 .fadeIn()
                                 .end()
                                 .appendTo('.fadein-10');
    }, 4000); // 4 seconds

  }
  if($('#fileupload').length){

    // Initialize the jQuery File Upload widget:
    $('#fileupload').fileupload();
    //
    // Load existing files:
    $.getJSON($('#fileupload').prop('action'), function (files) {
      var fu = $('#fileupload').data('blueimpFileupload'),
      template;

      fu._adjustMaxNumberOfFiles(-files.length);
      template = fu._renderDownload(files)
      .appendTo($('#fileupload .files'));
      // Force reflow:
      fu._reflow = fu._transition && template.length &&
      template[0].offsetWidth;
      template.addClass('in');
      $('#loading').remove();
    });

    var bar = $('.bar');
    $('form#fileupload').ajaxForm({
      beforeSend: function() {
        var percentVal = '0%';
        var percentComplete = 0;
        $(bar).style('width', percentVal).attr("aria-valuenow", percentComplete).html( percentVal );
      },
      uploadProgress: function(event, position, total, percentComplete) {
        var percentVal = percentComplete + '%';
        $(bar).style('width', percentVal).attr("aria-valuenow", percentComplete).html( percentVal );
      }
    });

  }
});
