var fileUploadErrors = {
  maxFileSize: 'File is too big',
  minFileSize: 'File is too small',
  acceptFileTypes: 'Filetype not allowed',
  maxNumberOfFiles: 'Max number of files exceeded',
  uploadedBytes: 'Uploaded bytes exceed file size',
  emptyResult: 'Empty file upload result'
};


$(function () {
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
