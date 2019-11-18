$(document).ready(function(){

  (function($){
    $(function(){
      $('.sidenav').sidenav();
    }); // end of document ready
  })(jQuery); // end of jQuery name space

  $('.sidenav').sidenav();
  
  $('.carousel').carousel({
    fullWidth: true,
    duration:100,
    indicators: true
  });

  $('.modal').modal();

  $('.fixed-action-btn').floatingActionButton();

  $('.scrollspy').scrollSpy();

  $('.slider').slider();

  $('.tabs').tabs();

  $('.datepicker').datepicker();

  $('select').formSelect();

  // M.updateTextFields();

  $('.chips').chips();

  $('.datepicker').datepicker();
});