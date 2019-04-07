(function($){
  $(function(){

    $('.sidenav').sidenav();

  }); // end of document ready
})(jQuery); // end of jQuery name space

$(document).ready(function(){

  $('.sidenav').sidenav();
  
  $('.carousel').carousel({
    fullWidth: true,
    duration:100,
    indicators: true
  });

    $('.modal').modal();
  
    $('select').formSelect();

    $('.fixed-action-btn').floatingActionButton();


    $('.scrollspy').scrollSpy();


    $('.slider').slider();

    $('.tabs').tabs();

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
        'Music': null,
        'Dance': null,
        'DJ': null,
        'Dhol': null,
        'Flowers': null,
        'Dance': null,
        'Transport': null
      },
      limit: Infinity,
      minLength: 1
    }
  });

    $('.datepicker').datepicker();

    $('select').formSelect();

    M.updateTextFields();

    $('.datepicker').datepicker();

    $('input.autocomplete').autocomplete({
      data: {
        "Apple": null,
        "Microsoft": null,
        "Google": 'https://placehold.it/250x250'
      },
    });
});


// var slider = document.getElementById('test-slider');
// Slider.create(slider, {
//  start: [20, 80],
//  connect: true,
//  step: 1,
//  orientation: 'horizontal', // 'horizontal' or 'vertical'
//  range: {
//    'min': 0,
//    'max': 100
//  },
//  format: wNumb({
//    decimals: 0
//  })
// });