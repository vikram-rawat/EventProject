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
  
  $('.chips').chips();
  $('.chips-initial').chips({
    data: [{
      tag: 'Apple',
    }, {
      tag: 'Microsoft',
    }, {
      tag: 'Google',
    }],
  });
  $('.chips-placeholder').chips({
    placeholder: 'Enter a tag',
    secondaryPlaceholder: '+Tag',
  });
  $('.chips-autocomplete').chips({
    autocompleteOptions: {
      data: {
        'Apple': null,
        'Microsoft': null,
        'Google': null
      },
      limit: Infinity,
      minLength: 1
    }
  });

  $('select').formSelect();

  $('.fixed-action-btn').floatingActionButton();

  $('.scrollspy').scrollSpy();

  $('.slider').slider();

  $('.tabs').tabs();

  $('.datepicker').datepicker();

  $('select').formSelect();

  M.updateTextFields();

  $('.datepicker').datepicker();
});