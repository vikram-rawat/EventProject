$(document).ready(function(){

  let location = $.getJSON("/json/api/states");  

  location.then((data) => {
    let s = ''
    $.each(data,(i,v) => {
      s += '<option value="'+ v.StatesName +'" name="' + v.StatesName + '">'+ v.StatesName + '</option>'     
    });
    // $('#states').material_select();
    $('#states').append(s);
    $('#states').formSelect();
  });

  

});