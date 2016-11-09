$(document).ready(function () {
  if ($('#clock').length > 0){
    $('#clock').countdown('2017/01/01', function (event) {
      var $this = $(this).html(event.strftime(''
      + '<div class="counts"><span>%w</span> <p>weeks</p></div> '
      + '<div class="counts"><span>%d</span> <p>days</p></div> '
      + '<div class="counts"><span>%H</span> <p>hr</p></div> '
      + '<div class="counts"><span>%M</span> <p>min</p></div> '
      + '<div class="counts"><span>%S</span> <p>sec</p></div>'));
    });
  }
});
