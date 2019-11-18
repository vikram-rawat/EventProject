// $(document).ready(function () {

  //   let location = $.getJSON("/json/api/states");
  //   location.then((data) => {
  //     let s = ''
  //     $.each(data,(i,v) => {
  //       s += '<option value="'+ v.StatesName +'" name="' + v.StatesName + '">'+ v.StatesName + '</option>'     
  //     });
  //     // $('#states').material_select();
  //     $('#states').append(s);
  //     $('#states').formSelect();
  //   });

  //   var valuess = ""

  //   $("#states").on('change', function() {

  //     var valuess = this;

  //     console.log($(this));
  //     console.log(valuess);
  // });

  //   $('.chips-vikram').chips({
  //     placeholder: 'Search a City or District',
  //     secondaryPlaceholder: '+Add Location',
  //     data: [{
  //           tag: 'Apple',
  //         }, {
  //           tag: 'Microsoft',
  //         }, {
  //           tag: 'Google',
  //         }],
  //     autocompleteOptions: {
  //       data: {
  //         'Apple': null,
  //         'Microsoft': null,
  //         'Google': null,
  //         'Dhol':null
  //       },
  //       limit: Infinity,
  //       minLength: 1
  //     }
  //   });

  // $('#states').on('contentChanged', function() {
  //   $(this).material_select();
  //   console.log($(this).material_select());
  // });
  //   // setup listener for custom event to re-initialize on change
  //   $('.materialSelect').on('contentChanged', function() {
  //     $(this).material_select();
  //   });

  var searchEngine = new Vue({
    el: "#searchTab",
    delimiters: ['{%%', '%%}'],
    data: {
      mainJson: [],
      states: [],
      locations: [],
      statesValue: ""
    },
    mounted: function () {
      this.mainJson = $.getJSON("/json/api/states");
      let s = []
      this.mainJson.then((data) => {
        this.states = data;
      });
    },
    computed: {

    },
    watch: {
      statesValue: function (newValue, oldValue) {
        $.getJSON('/json/api/locations', {
            state: newValue
          })
          .then((data) => {

            this.locations = data;

            var storeDict = {}

            $.each(data, (i, v) => {
              storeDict[v.LocationName] = null
            });

            console.log(storeDict);

            $('.chips-districts').chips({
              placeholder: 'Search a City or District',
              secondaryPlaceholder: '+Add Location',
              autocompleteOptions: {
                data: storeDict,
                limit: Infinity,
                minLength: 1
              }
            });

            // $('.chips-districts').material_chip({
            //   'data': storeDict
            //   });
          });
      }
    }
  });
// });